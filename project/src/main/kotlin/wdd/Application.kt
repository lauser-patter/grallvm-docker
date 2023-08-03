package wdd

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication(proxyBeanMethods = false)
class GuessMoveApplication

fun main(args: Array<String>) {
    runApplication<GuessMoveApplication>(*args)
}

