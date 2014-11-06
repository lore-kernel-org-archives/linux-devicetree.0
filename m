From: =?UTF-8?B?REFUQUNPTSAtIMOJcmljbyBOdW5lcw==?=
	<erico.nunes@datacom.ind.br>
Subject: Creating a new platform_bus inside a spi_driver
Date: Thu, 06 Nov 2014 18:02:52 -0200
Message-ID: <545BD3EC.6050503@datacom.ind.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, sameo@linux.intel.com, lee.jones@linaro.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


Hello,

In our board we have a FPGA whose programmable logic communicates with the main
processor via SPI. Inside the programmable logic we also have a range of
registers (writable via SPI commands) which implement functionality of several
distinct "devices".

Our approach to implement a driver framework for these devices was to have a
platform_bus embedded in a spi_device. This device tree source draft
illustrates the proposal:

{
    spi-master@2000 {
        #address-cells = <1>;
        #size-cells = <0>;
        compatible = "cpu-spi-master";
        reg = <0x2000 0x2000>;

        fpga@1 {
            #address-cells = <1>;
            #size-cells = <1>;
            compatible = "fpga-spi";
            reg = <1>;
            spi-max-frequency = <25000000>;

            fpga-device1@200 {
                compatible = "fpga-device1-driver";
                reg = <0x200 0x300>;
            };

            fpga-device2@500 {
                compatible = "fpga-device2-driver";
                reg = <0x500 0x100>;
            };

            fpga-device3@600 {
                compatible = "fpga-device3-driver";
                reg = <0x600 0x200>;
            };
        };
    };
}

The idea is that "fpga-spi" is a spi_driver which instantiates all of the
"fpga-deviceN" as platform_devices, through the use of
of_platform_populate(dev->of_node, NULL, NULL, dev).

The visible problem we're facing with this approach is that, as the internal
platform_devices have a "reg" property, of_platform_populate() eventually
triggers an address translation which is apparently trying to translate the
addresses of the internal platform_bus to addresses of the processor memory
map.
This translation is however not part of our intention, as we intend to have an
internal bus with its own memory map.
This fails when __of_translate_address() reaches the spi-master boundary
because (as it seems to make sense) it isn't possible to translate them past
that.
A KERN_ERR rated message like
"prom_parse: Bad cell count for /soc@f0000000/spi@2000/fpga@1"
is thrown by __of_translate_address() and later it is not possible to obtain
the "reg" address with platform_get_resource().

On this scenario, we have a few questions and, depending on the outcome of
these, possibly a patch.

1. Is it possible to have an internal platform_bus with a different memory map
as we intended? Or are platform_busses and platform_devices supposed to always
be mapped on the processor memory map?

2. If platform_bus and platform_device were actually designed to always be
mappable to the processor memory map, what would be a different approach to
this problem?  One alternative considered was to define a new "fpga_bus" and
"fpga_device" but that seemed as an overkill approach to the problem.

3. By searching for the ocurrences of of_platform_populate(), some uses which
look similar to our approach were found, in the following drivers:
drivers/mfd/smsc-ece1099.c
drivers/mfd/palmas.c
These have an i2c_driver which calls of_platform_populate() just like we
attempted.  Won't they run into a similar problem, if any of the children
platform_devices provide a "reg" property?

4. By applying the patch attached at the end of this mail, things start to work
as we intended. Basically instead of returning an error if we reach an
untranslatable boundary, we return the resulting address so far. This is
assuming that, for this case, we want an internal memory map for this device.
Is this patch/assumption breaking any design decisions regarding the platform
subsystem? It is of course not a widely tested patch, but could we be facing a
bug which needs a fix like the one presented?

Thanks in advance!

Erico



[PATCH] of/address: return partial translation when crossing
 untranslatable boundary

Signed-off-by: erico.nunes <erico.nunes@datacom.ind.br>
---
 drivers/of/address.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index afdb782..ab56d31 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -572,8 +572,9 @@ static u64 __of_translate_address(struct device_node *dev,
         pbus = of_match_bus(parent);
         pbus->count_cells(dev, &pna, &pns);
         if (!OF_CHECK_COUNTS(pna, pns)) {
-            printk(KERN_ERR "prom_parse: Bad cell count for %s\n",
+            pr_debug("OF: prom_parse: Bad cell count for %s\n",
                    of_node_full_name(dev));
+            result = of_read_number(addr, na);
             break;
         }
 
-- 
1.9.1
