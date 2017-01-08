From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH RFC 0/4] SolidRun Hummingboard 2 support
Date: Sun, 8 Jan 2017 15:02:01 +0000
Message-ID: <20170108150201.GS14217@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Nettleton <jon-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These patches add support for SolidRun's Hummingboard 2 to mainline.
The first is the official SolidRun DTS file supplied by Jon, the
remainder are cleanups to it for mainline.

These can be found in my HB2 branch.

 arch/arm/boot/dts/Makefile                   |   2 +
 arch/arm/boot/dts/imx6dl-hummingboard2.dts   |  52 +++
 arch/arm/boot/dts/imx6q-hummingboard2.dts    |  60 +++
 arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi | 562 +++++++++++++++++++++++++++
 4 files changed, 676 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-hummingboard2.dts
 create mode 100644 arch/arm/boot/dts/imx6q-hummingboard2.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-hummingboard2.dtsi

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
