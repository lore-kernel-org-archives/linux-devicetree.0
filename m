From: Andrew Glen <andrewtaneglen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Query regarding shared memory addresses defined for d_can devices in /arch/arm/boot/dts/am33xx.dtsi
Date: Fri, 15 Nov 2013 14:18:04 +1300
Message-ID: <CAHKgOt6v5Xdrtak9_uFsauQ0nDwQomn-kenjSyFxQThU9n_=4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Using the new 3.12 mainline kernel I've been able to get both CAN
devices working reliably on an AM335x platform (the Beaglbone Black).

However, I get a warning when the device boots:

c_can_platform 481d0000.d_can: can't request region for resource [mem
0x44e10644-0x44e10647]

What this is referring to is the fact that in definitions for each of
the two can devices in 'am33xx.dtsi', the same register address is
being requested. They are defined as follows:

        dcan0: d_can@481cc000 {
            compatible = "bosch,d_can";
            ti,hwmods = "d_can0";
            reg = <0x481cc000 0x2000
                0x44e10644 0x4>;
            interrupts = <52>;
            status = "disabled";
        };

        dcan1: d_can@481d0000 {
            compatible = "bosch,d_can";
            ti,hwmods = "d_can1";
            reg = <0x481d0000 0x2000
                0x44e10644 0x4>;
            interrupts = <55>;
            status = "disabled";
        };

For both items the address '0x44e10644 0x4', referring to the register
'dcan_raminit' (Pg 793 of spruh73h.pdf), is being reserved for use.
The devicetree interpreter considers any overlap between device 'reg'
mappings as a problem, hence the message seen on boot.

The register 'dcan_raminit' is in fact used by both can devices, so it
does make sense for both to have access to it. It appears however,
this register is only used in the d_can driver, which is not in use
with this latest kernel release, and both devices work flawlessly (as
far as I can tell) regardless of the error message.

I thought I'd have a go at tidying this part of the 'am33xx.dtsi'
devicetree file up a bit in order to get rid of this message - and
this is where my question comes in. I thought I could make a single
parent node for d_can with this shared register defined at the top
level, and then add the two can devices as child nodes. I came up
variations of the following:

        dcan {
            #address-cells = <1>;
            #size-cells = <1>;
            reg = <0x44e10644 0x4>;

            dcan0: d_can@481cc000 {
                compatible = "bosch,d_can";
                ti,hwmods = "d_can0";
                reg = <0x481cc000 0x2000>;
                interrupts = <52>;
                status = "disabled";
            };

            dcan1: d_can@481d0000 {
                compatible = "bosch,d_can";
                ti,hwmods = "d_can1";
                reg = <0x481d0000 0x2000>;
                interrupts = <55>;
                status = "disabled";
            };
        };

I tried various iterations along this line (and modified the
am335x-boneblack.dts file with the corresponding 'status = 'okay'
entries for these devices), all of which would compile fine, and the
device would then boot with no error messages, but for whatever reason
the devices would never show up as they had previously, albeit with
the earlier error message.

I was wondering if anyone with a better understanding of devicetree
syntax could suggest the correct structure for these parent/child
nodes I am trying to create - or suggest a different/better solution.

Any help or suggestions would be greatly appreciated.


Regards,
Andrew Glen.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
