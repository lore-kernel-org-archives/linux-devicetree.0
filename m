From: Jaghathiswari Rankappagounder Natarajan <jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH linux v1 0/2] Support for ASPEED AST2400/AST2500 PWM and Fan Tach driver
Date: Mon,  9 Jan 2017 13:59:33 -0800
Message-ID: <20170109215935.30067-1-jaghu@google.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Support for ASPEED AST2400/AST2500 PWM and Fan Tach driver

Support for ASPEED AST2400/AST2500 PWM and Fan Tach driver.
The AST2400/AST2500 PWM controller can support 8 PWM output ports.
The AST2400/AST2500 Fan Tach controller can support 16 tachometer inputs.
There can be three different PWM clock types (Type M, N and O); Those three
types just to have three independent PWM sources.
The driver provides sysfs entries through which the user can configure the
duty cycle for the particular PWM output port and read the fan rpm value for
the particular tachometer input.
Added devicetree binding documentation for AST2400/AST2500 PWM and Fan Tach
support.

Tested on Zaius board (which has AST2500 chip) and observed that when
duty cycle is lowered then the fan speed is lowered and lower fan rpm value(
corresponding to the duty cycle) is reported and when the duty cycle is
increased then the fan speed increases and higher fan rpm value(corresponding
to the duty cycle) is reported.

Tested on AST2500 EVB board and observed the PWM output pulses come
correctly based on the given settings using Logic Saleae Analyzer.

Jaghathiswari Rankappagounder Natarajan (2):
  Documentation: dt-bindings: Document bindings for aspeed pwm and fan
    tach controller device driver
  drivers: hwmon: hwmon driver for ASPEED AST2400/2500 PWM and Fan tach
    controller

 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 153 ++++
 Documentation/hwmon/aspeed-pwm-tacho               |  22 +
 drivers/hwmon/Kconfig                              |   9 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/aspeed-pwm-tacho.c                   | 884 +++++++++++++++++++++
 5 files changed, 1069 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
 create mode 100644 Documentation/hwmon/aspeed-pwm-tacho
 create mode 100644 drivers/hwmon/aspeed-pwm-tacho.c

--
2.11.0.390.gc69c2f50cf-goog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
