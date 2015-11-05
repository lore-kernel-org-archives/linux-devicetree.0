From: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 00/10] ARM: dts: Add Advantech board support
Date: Thu,  5 Nov 2015 13:13:34 -0500
Message-ID: <1446747224-32514-1-git-send-email-akshay.bhat@timesys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, justin.waters-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org, martin.donnelly-JJi787mZWgc@public.gmane.org, peter.stretz-ELdSlb/RfAS1Z/+hSey0Gg@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series aims to add Advantech BA-16 module (iMX6 based) and GE board support.
Patches 7 to 10 correspond to the v2 changes.

This series has been tested against linux-next tag next-20151105.

Modifications:
v1->v2:
- Move entries from pinctrl_hog to relevant groups as suggested by Lucas Stash
- Remove unused PCIe power-on-gpio entry as suggested by Lucas Stash
- Remove always-on from regulators that do not need to be always-on as suggested by Lucas Stash
- Enable support for mma8453
- Add vendor prefix for General Electric Company as suggested by Martin Donnelly
- Update Copyright information as suggest by Martin Donnelly

History:
--------
[v1]: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-October/381872.html

Akshay Bhat (8):
  of: Add vendor prefix for Advantech Corporation
  ARM: dts: imx: Add support for Advantech/GE B450v3
  ARM: dts: imx: Add support for Advantech/GE B650v3
  ARM: dts: imx: Add support for Advantech/GE B850v3
  of: Add vendor prefix for General Electric Company
  ARM: dts: imx: Update vendor info for GE Bx50v3 boards
  ARM: dts: imx: Add mma8453 support
  ARM: dts: imx6q-ba16: Cleanup pinctrl and LDO

Justin Waters (2):
  ARM: dts: imx: Add Advantech BA-16 Qseven module
  ARM: dts: imx: Add support for Advantech/GE Bx50v3

 .../devicetree/bindings/vendor-prefixes.txt        |   2 +
 arch/arm/boot/dts/Makefile                         |   3 +
 arch/arm/boot/dts/imx6q-b450v3.dts                 |  75 +++
 arch/arm/boot/dts/imx6q-b650v3.dts                 |  74 +++
 arch/arm/boot/dts/imx6q-b850v3.dts                 | 122 +++++
 arch/arm/boot/dts/imx6q-ba16.dtsi                  | 584 +++++++++++++++++++++
 arch/arm/boot/dts/imx6q-bx50v3.dtsi                | 211 ++++++++
 7 files changed, 1071 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6q-b450v3.dts
 create mode 100644 arch/arm/boot/dts/imx6q-b650v3.dts
 create mode 100644 arch/arm/boot/dts/imx6q-b850v3.dts
 create mode 100644 arch/arm/boot/dts/imx6q-ba16.dtsi
 create mode 100644 arch/arm/boot/dts/imx6q-bx50v3.dtsi

-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
