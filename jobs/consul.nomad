job "consul" {
    type = "service"
    datacenters = ["do_ams3"]

    group "main" {
        count = 1
        task "consul" {
            driver = "docker"
            config {
                image = "consul:1.3.0"
                port_map = {
                    consul = 8500
                }
                volumes = [
                    "/opt/consul:/opt/consul"        
                ]
            }
            resources {
                memory = 100
                cpu = 100
                network {
                    port "consul" {
                        static = 8500
                    }
                }
            }
        }
    }
}
