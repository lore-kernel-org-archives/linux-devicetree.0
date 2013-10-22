From: Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] Devicetree description for Voipac i.MX53 module
Date: Tue, 22 Oct 2013 19:07:19 +0200
Message-ID: <1382461643-16790-1-git-send-email-lisovy@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: pisa-/N2ztlQkxE7Ub/6JBqosbQ@public.gmane.org, Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds devicetree description for Voipac X53-DMM-668 module
which uses i.MX53 CPU. More information about the module may be found at:
http://www.voipac.com/#X53-DMM-668
The support for the baseboard used with this module is also provided.
More information about the baseboard: http://www.voipac.com/#X25-BSB-000

Working peripherals are:
* UART0
* Ethernet
* Buttons (with keyboard controller)
* Sound (headphone output)
* SD-card
* LEDs (through GPIOs)


Rostislav Lisovy (4):
  ARM: dts: i.MX53: Add alternate pinmux option for i2c_3
  ARM: dts: i.MX53: Internal keyboard controller
  ARM: dts: i.MX53: dts for Voipac x53-dmm-668 module
  ARM: dts: i.MX53: Devicetree for Voipac Baseboard using x53-dmm-668
    module

 arch/arm/boot/dts/imx53-voipac-bsb.dts      |  135 +++++++++++++++++++
 arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi |  195 +++++++++++++++++++++++++++
 arch/arm/boot/dts/imx53.dtsi                |   15 +++
 3 files changed, 345 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx53-voipac-bsb.dts
 create mode 100644 arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi

-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
