From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [RFC] yamldt and dts2yaml.
Date: Mon, 04 Sep 2017 16:48:06 +0300
Message-ID: <1504532886.12356.17.camel@hp800z>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Phil Elwell <philip.j.elwell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi all,

yamldt has a new minor release out (v0.3)

The last minor release brought schema validation, and this one
bring dts2yaml an automatic DTS to YAML conversion tool.

The test-suite converts and compiles all the current DTS files in
the kernel and out of the 1.3 thousand DTS files only 6 fail to
convert (due to complex macro usage that make the source file look
nothing like DTS).

Conversion is extremely simple:

$ dts2yaml -r bcm2837-rpi-3-b.dts

Will convert the rpi-3 DTS file (and all the included files).

$ ls *.yaml*
bcm2835-rpi.yamli  bcm2837-rpi-3-b.yaml  bcm2837.yamli  bcm283x-rpi-smsc9514.yamli  bcm283x-rpi-usb-host.yamli  bcm283x.yamli

$ cat bcm2837-rpi-3-b.dts 
/dts-v1/;
#include "bcm2837.dtsi"
#include "bcm2835-rpi.dtsi"
#include "bcm283x-rpi-smsc9514.dtsi"
#include "bcm283x-rpi-usb-host.dtsi"

/ {
	compatible = "raspberrypi,3-model-b", "brcm,bcm2837";
	model = "Raspberry Pi 3 Model B";

	memory {
		reg = <0 0x40000000>;
	};

	leds {
		act {
			gpios = <&gpio 47 0>;
		};
	};
};

&uart1 {
	status = "okay";
};

/* SDHCI is used to control the SDIO for wireless */
&sdhci {
	pinctrl-names = "default";
	pinctrl-0 = <&emmc_gpio34>;
	status = "okay";
	bus-width = <4>;
	non-removable;
};

/* SDHOST is used to drive the SD card */
&sdhost {
	pinctrl-names = "default";
	pinctrl-0 = <&sdhost_gpio48>;
	status = "okay";
	bus-width = <4>;
};

$ cat bcm2837-rpi-3-b.yaml 
#include "bcm2837.yamli"
#include "bcm2835-rpi.yamli"
#include "bcm283x-rpi-smsc9514.yamli"
#include "bcm283x-rpi-usb-host.yamli"

compatible: [ "raspberrypi,3-model-b", "brcm,bcm2837" ]
model: "Raspberry Pi 3 Model B"

memory:
  reg: [ 0, 0x40000000 ]

leds:
  act:
    gpios: [ *gpio, 47, 0 ]

*uart1:
  status: "okay"

# SDHCI is used to control the SDIO for wireless
*sdhci:
  pinctrl-names: "default"
  pinctrl-0: *emmc_gpio34
  status: "okay"
  bus-width: 4
  non-removable: true

# SDHOST is used to drive the SD card
*sdhost:
  pinctrl-names: "default"
  pinctrl-0: *sdhost_gpio48
  status: "okay"
  bus-width: 4


For more take a look here.

https://github.com/pantoniou/yamldt

I am eagerly awaiting for your comments.

Regards

-- Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
