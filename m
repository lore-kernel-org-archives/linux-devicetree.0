From: Alan Martinovic <alan.martinovic-+NedCK/4fiIAvxtiuMwx3w@public.gmane.org>
Subject: Decompiled vs *tmp extended device tree
Date: Thu, 16 Nov 2017 13:12:55 +0100
Message-ID: <CAOT_U5bV1cWsXa-d7A5sbd0e+UuhD6NmwsmyjrQcuWceqtus_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,
I'm trying to modify a device tree to enable support of the second UART.
The actual device tree which is used for the example:

https://github.com/getsenic/senic-os-linux/blob/senic/4.13/arch/arm/boot/dt=
s/sun8i-h3-senic-hub.dts

The device tree includes and overrides some additional files:

    #include "sun8i-h3.dtsi"
    #include "sunxi-common-regulators.dtsi"
    #include <dt-bindings/gpio/gpio.h>
    #include <dt-bindings/input/input.h>
    #include <dt-bindings/pinctrl/sun4i-a10.h>

I would like to know to what does the extended device tree look like,
and use that as my base, because I don't really have the complete picture
by just looking at the sun8i-h3-senic-hub.dts

In this example I'm interested in where are "uart0_pins_a" defined.
sun8i-h3-senic-hub.dts references them but has no definitions,
so I'm assuming the definition is somewhere in the included files.

To help me out with this task I discovered the device tree decompiler.
Am expecting that the decompiled dts contains all the data that
end up in the dtb blob, and should, among other, contain all the informatio=
n
available in sun8i-h3-senic-hub.dts.

    scripts/dtc/dtc -I dtb -O dts -o expanded-devtree.dts
arch/arm/boot/dts/sun8i-h3-senic-hub.dtb

But the decompiled extended device tree also seems to have no
traces of "uart0_pins_a" at all :

    grep uart0_pins_a expanded-devtree.dts

I've also discovered the hidden .tmp files:

    =E2=9F=AB ls arch/arm/boot/dts/.sun8i-h3-*
    arch/arm/boot/dts/.sun8i-h3-senic-hub.dtb.cmd
    arch/arm/boot/dts/.sun8i-h3-senic-hub.dtb.d.dtc.tmp
    arch/arm/boot/dts/.sun8i-h3-senic-hub.dtb.d.pre.tmp
    arch/arm/boot/dts/.sun8i-h3-senic-hub.dtb.dts.tmp

and in one of them there is a definition to "uart0_pins_a":

    =E2=9F=AB grep uart0_pins_a  arch/arm/boot/dts/.sun8i-h3-*
    arch/arm/boot/dts/.sun8i-h3-senic-hub.dtb.dts.tmp:   uart0_pins_a: uart=
0@0 {
    arch/arm/boot/dts/.sun8i-h3-senic-hub.dtb.dts.tmp: pinctrl-0 =3D
<&uart0_pins_a>;

My question is, which one is a more accurate representation
of the final device tree that I should use as a basis?

Why isn't it correct to expect that everything from sun8i-h3-senic-hub.dts
will end up in the final device tree blob?


Be Well,
Alan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
