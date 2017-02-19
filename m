From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: [PATCH 0/4] ARM: dts: Add Parvus Duracor C310 board support
Date: Sun, 19 Feb 2017 22:27:57 +0200
Message-ID: <20170219202801.2082-1-plaes@plaes.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add basic devicetree files for Parvus Duracor C310 which is a custom
carrier with MXM3 connector for SMARC module.

SMARC module used in C310 is manufactured by Kontron AG.


Priit Laes (4):
  arm: defconfig: imx6: Added CONFIG_FHANDLE
  devicetree: Add vendor prefix for Kontron AG
  arm: dts: imx: Add iMX6Q-based Kontron SMARC-sAMX6i module
  arm: dts: imx: Basic board definition for Parvus Duracor C310

 .../devicetree/bindings/vendor-prefixes.txt        |   3 +-
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/imx6q-parvus-duracor-310.dts     | 119 ++++++
 arch/arm/boot/dts/imx6q-smarc-sam6xi.dtsi          | 434 +++++++++++++++++++++
 arch/arm/configs/imx_v6_v7_defconfig               |   1 +
 5 files changed, 557 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/imx6q-parvus-duracor-310.dts
 create mode 100644 arch/arm/boot/dts/imx6q-smarc-sam6xi.dtsi

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
