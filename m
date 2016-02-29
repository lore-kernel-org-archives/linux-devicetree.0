From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 0/8] ARM64: meson: GXBaby (S905) and Vega S95 enablement
Date: Tue,  1 Mar 2016 00:44:17 +0100
Message-ID: <1456789465-2962-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Nicolas Saenz <nicolassaenzj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

This series adds initial support for the Amlogic S905 based
Tronsmart Vega S95 Pro, Meta and Telos TV boxes.

Regards,
Andreas

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Andreas F=C3=A4rber (8):
  ARM64: Enable Amlogic Meson GXBaby platform
  Documentation: devicetree: amlogic: Document Meson GXBaby
  ARM64: dts: Prepare configs for Amlogic Meson GXBaby
  Documentation: devicetree: Document Tronsmart vendor prefix
  Documentation: devicetree: amlogic: Document Tronsmart Vega S95 board=
s
  ARM64: dts: amlogic: Add Tronsmart Vega S95 configs
  ARM64: dts: amlogic: Extend GXBaby GIC node
  ARM64: dts: amlogic: Add arch timer node for Meson GXBaby

 Documentation/devicetree/bindings/arm/amlogic.txt  |   7 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/arm64/Kconfig.platforms                       |   6 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/amlogic/Makefile               |   7 +
 .../boot/dts/amlogic/meson-gxbb-vega-s95-meta.dts  |  55 ++++++++
 .../boot/dts/amlogic/meson-gxbb-vega-s95-pro.dts   |  55 ++++++++
 .../boot/dts/amlogic/meson-gxbb-vega-s95-telos.dts |  55 ++++++++
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      |  73 +++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        | 142 +++++++++++++=
++++++++
 10 files changed, 402 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/Makefile
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-met=
a.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro=
=2Edts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-tel=
os.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dts=
i
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi

--=20
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
