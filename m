From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH 0/3] devicetree, qcomm PMIC: fix node name conflict
Date: Tue, 06 May 2014 17:48:35 -0700
Message-ID: <536982E3.10303@gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Courtney Cavin <courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

An issue with the path of SPMI nodes under /sys/bus/... was reported in
https://lkml.org/lkml/2014/4/23/312.  The symptom is that two different
grandchild nodes of the spmi with the same node-name@unit-address will
result in attempting to create duplicate links at
/sys/bus/platform/devices/unit-address.node-name.  It turns out that the
specific example provided might not be an expected configuration for
current hardware, but the reported trap remains an issue.

I have been poking at the problem, trying to figure out how to cleanly
fix the issue without breaking devicetree device creation.

The first patch in the series is the one that may be a very bad idea.  Or
it may help show the way forward to deal with what I think is the major
underlying problem.  I have not finished investigating the possible negative
side effects.  And I am still thinking whether this is a conceptually good
approach, or whether it is simply an expediant hack that hides the underlying
problem.  But I am throwing this out prematurely because I have mentioned
it to several people, and I want to make it visible to everyone involved.

The underlying architectural problem (in my opinion) is that a lot of devices
are created by the device tree infrastructure as platform devices, when they
truly should not be platform devices.  They should not be platform devices
because they are not physically on a platform bus, they are instead somewhere
below some other bus.  The first patch in this series is a hack which
results in the devices still being represented by "struct platform_device"
objects, but with a link to their parent's "struct bus_type" instead of
to &platform_bus_type.

The second patch does not require the first patch.  The second patch provides
a mechanism to allow subsystems to provide a method of naming devices to
avoid name collisions.

The third patch provides an example of a subsystem using the new feature
provided by the second patch.

The resulting device naming and soft links from applying all three patches,
or just the second and third patches are:


=====  no patches applied:

$ ls /sys/devices/
ARMv7 Krait  cpu-pmu.1    platform     software     tracepoint
breakpoint   cpus.0       soc.2        system       virtual

$ ls /sys/devices/soc.2/
f9000000.interrupt-controller  fc4281d0.qcom,mpm
f9011000.smem                  fc4ab000.restart
f9012000.regulator             fc4cf000.qcom,spmi
f9020000.timer                 fd484000.hwlock
f9088000.clock-controller      fd510000.pinctrl
f9098000.clock-controller      fd8c0000.clock-controller
f90a8000.clock-controller      gpio_keys.5
f90b8000.clock-controller      iio-thermal.4
f9824900.sdhc                  modalias
f991e000.serial                power
f9924000.i2c2                  subsystem
f9928000.i2c6                  timer.3
f9bff000.rng                   uevent
fc400000.clock-controller

$ ls /sys/devices/soc.2/fc4cf000.qcom,spmi/
driver     modalias   power      spmi-0     subsystem  uevent

$ ls /sys/devices/soc.2/fc4cf000.qcom,spmi/spmi-0/
0-00       0-01       0-04       power      subsystem  uevent

$ ls /sys/devices/soc.2/fc4cf000.qcom,spmi/spmi-0/0-00/
100.qcom,revid            driver                    subsystem
3100.qcom,pm8x41-adc-usr  gpios.18                  uevent
6000.qcom,rtc             power



$ ls /sys/bus/platform/devices/soc.2/
f9000000.interrupt-controller  fc4281d0.qcom,mpm
f9011000.smem                  fc4ab000.restart
f9012000.regulator             fc4cf000.qcom,spmi
f9020000.timer                 fd484000.hwlock
f9088000.clock-controller      fd510000.pinctrl
f9098000.clock-controller      fd8c0000.clock-controller
f90a8000.clock-controller      gpio_keys.5
f90b8000.clock-controller      iio-thermal.4
f9824900.sdhc                  modalias
f991e000.serial                power
f9924000.i2c2                  subsystem
f9928000.i2c6                  timer.3
f9bff000.rng                   uevent
fc400000.clock-controller

$ ls /sys/bus/platform/devices/soc.2/fc4cf000.qcom,spmi/
driver     modalias   power      spmi-0     subsystem  uevent

$ ls /sys/bus/platform/devices/soc.2/fc4cf000.qcom,spmi/spmi-0/
0-00       0-01       0-04       power      subsystem  uevent

$ ls /sys/bus/platform/devices/soc.2/fc4cf000.qcom,spmi/spmi-0/0-00/
100.qcom,revid            driver                    subsystem
3100.qcom,pm8x41-adc-usr  gpios.18                  uevent
6000.qcom,rtc             power

$ ls /sys/bus/platform/devices/soc.2/fc4cf000.qcom,spmi/spmi-0/0-01/
b040.pm8xxx-pwm      driver               uevent
d000.pm8xxx-pwm-led  power
d800.pm8xxx-wled     subsystem

$ ls /sys/bus/platform/devices/soc.2/fc4cf000.qcom,spmi/spmi-0/0-04/
driver     power      subsystem  uevent



$ ls /sys/bus/spmi/devices/
0-00    0-01    0-04    spmi-0

$ ls /sys/bus/platform/devices/
100.qcom,revid                 fc4cf000.qcom,spmi
3100.qcom,pm8x41-adc-usr       fd484000.hwlock
6000.qcom,rtc                  fd510000.pinctrl
alarmtimer                     fd8c0000.clock-controller
b040.pm8xxx-pwm                gpio_keys.5
cpu-pmu.1                      gpios.18
cpus.0                         iio-thermal.4
d000.pm8xxx-pwm-led            pm8841-s1.6
d800.pm8xxx-wled               pm8841-s2.7
f9000000.interrupt-controller  pm8941-l3.11
f9011000.smem                  pm8941-l6.12
f9012000.regulator             reg-dummy
f9020000.timer                 regulator-l11.14
f9088000.clock-controller      regulator-l19.15
f9098000.clock-controller      regulator-l20.16
f90a8000.clock-controller      regulator-l22.17
f90b8000.clock-controller      regulator-l9.13
f9824900.sdhc                  regulator-s1.8
f991e000.serial                regulator-s2.9
f9924000.i2c2                  regulator-s3.10
f9928000.i2c6                  regulatory.0
f9bff000.rng                   snd-soc-dummy
fc400000.clock-controller      soc.2
fc4281d0.qcom,mpm              timer.3
fc4ab000.restart


=====  all three patches applied:

$ ls /sys/devices/
ARMv7 Krait  cpu-pmu.1    platform     software     tracepoint
breakpoint   cpus.0       soc.2        system       virtual

$ ls /sys/devices/soc.2/
f9000000.interrupt-controller  fc4281d0.qcom,mpm
f9011000.smem                  fc4ab000.restart
f9012000.regulator             fc4cf000.qcom,spmi
f9020000.timer                 fd484000.hwlock
f9088000.clock-controller      fd510000.pinctrl
f9098000.clock-controller      fd8c0000.clock-controller
f90a8000.clock-controller      gpio_keys.5
f90b8000.clock-controller      iio-thermal.4
f9824900.sdhc                  modalias
f991e000.serial                power
f9924000.i2c2                  subsystem
f9928000.i2c6                  timer.3
f9bff000.rng                   uevent
fc400000.clock-controller

$ ls /sys/devices/soc.2/fc4cf000.qcom,spmi/
driver     modalias   power      spmi-0     subsystem  uevent

$ ls /sys/devices/soc.2/fc4cf000.qcom,spmi/spmi-0/
0-00       0-01       0-04       power      subsystem  uevent

$ ls /sys/devices/soc.2/fc4cf000.qcom,spmi/spmi-0/0-00/
0-00:100.qcom,revid            driver
0-00:3100.qcom,pm8x41-adc-usr  power
0-00:6000.qcom,rtc             subsystem
0-00:gpios                     uevent
 
 

$ ls /sys/bus/platform/devices/soc.2/
f9000000.interrupt-controller  fc4281d0.qcom,mpm
f9011000.smem                  fc4ab000.restart
f9012000.regulator             fc4cf000.qcom,spmi
f9020000.timer                 fd484000.hwlock
f9088000.clock-controller      fd510000.pinctrl
f9098000.clock-controller      fd8c0000.clock-controller
f90a8000.clock-controller      gpio_keys.5
f90b8000.clock-controller      iio-thermal.4
f9824900.sdhc                  modalias
f991e000.serial                power
f9924000.i2c2                  subsystem
f9928000.i2c6                  timer.3
f9bff000.rng                   uevent
fc400000.clock-controller

$ ls /sys/bus/platform/devices/soc.2/fc4cf000.qcom,spmi/
driver     modalias   power      spmi-0     subsystem  uevent

$ ls /sys/bus/platform/devices/soc.2/fc4cf000.qcom,spmi/spmi-0/
0-00       0-01       0-04       power      subsystem  uevent

$ ls /sys/bus/platform/devices/soc.2/fc4cf000.qcom,spmi/spmi-0/0-00/
0-00:100.qcom,revid            driver
0-00:3100.qcom,pm8x41-adc-usr  power
0-00:6000.qcom,rtc             subsystem
0-00:gpios                     uevent

$ ls /sys/bus/platform/devices/soc.2/fc4cf000.qcom,spmi/spmi-0/0-01/
0-01:b040.pm8xxx-pwm      driver                    uevent
0-01:d000.pm8xxx-pwm-led  power
0-01:d800.pm8xxx-wled     subsystem

$ ls /sys/bus/platform/devices/soc.2/fc4cf000.qcom,spmi/spmi-0/0-04/
0-04:100.qcom,revid  power                uevent
driver               subsystem



$ ls /sys/bus/spmi/devices/
0-00                           0-01:b040.pm8xxx-pwm
0-00:100.qcom,revid            0-01:d000.pm8xxx-pwm-led
0-00:3100.qcom,pm8x41-adc-usr  0-01:d800.pm8xxx-wled
0-00:6000.qcom,rtc             0-04
0-00:gpios                     0-04:100.qcom,revid
0-01                           spmi-0

$ ls /sys/bus/platform/devices/
alarmtimer                     f9bff000.rng
cpu-pmu.1                      fc400000.clock-controller
cpus.0                         fc4281d0.qcom,mpm
f9000000.interrupt-controller  fc4ab000.restart
f9011000.smem                  fc4cf000.qcom,spmi
f9012000.regulator             fd484000.hwlock
f9020000.timer                 fd510000.pinctrl
f9088000.clock-controller      fd8c0000.clock-controller
f9098000.clock-controller      gpio_keys.5
f90a8000.clock-controller      iio-thermal.4
f90b8000.clock-controller      reg-dummy
f9824900.sdhc                  regulatory.0
f991e000.serial                snd-soc-dummy
f9924000.i2c2                  soc.2
f9928000.i2c6                  timer.3


=====  patches 2 and 3 applied:

$ ls /sys/devices/
ARMv7 Krait  cpu-pmu.1    platform     software     tracepoint
breakpoint   cpus.0       soc.2        system       virtual

$ ls /sys/devices/soc.2/
f9000000.interrupt-controller  fc4281d0.qcom,mpm
f9011000.smem                  fc4ab000.restart
f9012000.regulator             fc4cf000.qcom,spmi
f9020000.timer                 fd484000.hwlock
f9088000.clock-controller      fd510000.pinctrl
f9098000.clock-controller      fd8c0000.clock-controller
f90a8000.clock-controller      gpio_keys.5
f90b8000.clock-controller      iio-thermal.4
f9824900.sdhc                  modalias
f991e000.serial                power
f9924000.i2c2                  subsystem
f9928000.i2c6                  timer.3
f9bff000.rng                   uevent
fc400000.clock-controller

$ ls /sys/devices/soc.2/fc4cf000.qcom,spmi/
driver     modalias   power      spmi-0     subsystem  uevent

$ ls /sys/devices/soc.2/fc4cf000.qcom,spmi/spmi-0/
0-00       0-01       0-04       power      subsystem  uevent

$ ls /sys/devices/soc.2/fc4cf000.qcom,spmi/spmi-0/0-00/
0-00:100.qcom,revid            driver
0-00:3100.qcom,pm8x41-adc-usr  power
0-00:6000.qcom,rtc             subsystem
0-00:gpios                     uevent
 
 
$ ls /sys/bus/platform/devices/soc.2/
f9000000.interrupt-controller  fc4281d0.qcom,mpm
f9011000.smem                  fc4ab000.restart
f9012000.regulator             fc4cf000.qcom,spmi
f9020000.timer                 fd484000.hwlock
f9088000.clock-controller      fd510000.pinctrl
f9098000.clock-controller      fd8c0000.clock-controller
f90a8000.clock-controller      gpio_keys.5
f90b8000.clock-controller      iio-thermal.4
f9824900.sdhc                  modalias
f991e000.serial                power
f9924000.i2c2                  subsystem
f9928000.i2c6                  timer.3
f9bff000.rng                   uevent
fc400000.clock-controller

$ ls /sys/bus/platform/devices/soc.2/fc4cf000.qcom,spmi/
driver     modalias   power      spmi-0     subsystem  uevent

$ ls /sys/bus/platform/devices/soc.2/fc4cf000.qcom,spmi/spmi-0/
0-00       0-01       0-04       power      subsystem  uevent

$ ls /sys/bus/platform/devices/soc.2/fc4cf000.qcom,spmi/spmi-0/0-00/
0-00:100.qcom,revid            driver
0-00:3100.qcom,pm8x41-adc-usr  power
0-00:6000.qcom,rtc             subsystem
0-00:gpios                     uevent

$ ls /sys/bus/platform/devices/soc.2/fc4cf000.qcom,spmi/spmi-0/0-01/
0-01:b040.pm8xxx-pwm      driver                    uevent
0-01:d000.pm8xxx-pwm-led  power
0-01:d800.pm8xxx-wled     subsystem

$ ls /sys/bus/platform/devices/soc.2/fc4cf000.qcom,spmi/spmi-0/0-04/
0-04:100.qcom,revid  power                uevent
driver               subsystem
 

$ ls /sys/bus/spmi/devices/
0-00    0-01    0-04    spmi-0

$ ls /sys/bus/platform/devices/
0-00:100.qcom,revid            fc4281d0.qcom,mpm
0-00:3100.qcom,pm8x41-adc-usr  fc4ab000.restart
0-00:6000.qcom,rtc             fc4cf000.qcom,spmi
0-00:gpios                     fd484000.hwlock
0-01:b040.pm8xxx-pwm           fd510000.pinctrl
0-01:d000.pm8xxx-pwm-led       fd8c0000.clock-controller
0-01:d800.pm8xxx-wled          gpio_keys.5
0-04:100.qcom,revid            iio-thermal.4
alarmtimer                     pm8841-s1.6
cpu-pmu.1                      pm8841-s2.7
cpus.0                         pm8941-l3.11
f9000000.interrupt-controller  pm8941-l6.12
f9011000.smem                  reg-dummy
f9012000.regulator             regulator-l11.14
f9020000.timer                 regulator-l19.15
f9088000.clock-controller      regulator-l20.16
f9098000.clock-controller      regulator-l22.17
f90a8000.clock-controller      regulator-l9.13
f90b8000.clock-controller      regulator-s1.8
f9824900.sdhc                  regulator-s2.9
f991e000.serial                regulator-s3.10
f9924000.i2c2                  regulatory.0
f9928000.i2c6                  snd-soc-dummy
f9bff000.rng                   soc.2
fc400000.clock-controller      timer.3


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
