From: Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v8 0/7] ARM: dts: Add Advantech board support
Date: Fri, 19 Feb 2016 18:35:24 -0500
Message-ID: <1455924931-13784-1-git-send-email-akshay.bhat@timesys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, justin.waters-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org, Akshay Bhat <akshay.bhat-jEh4hwF5bVhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series aims to add Advantech BA-16 module (iMX6 based) and GE board support.

This series has been tested against linux-next tag next-20160216.

Modifications:
v7->v8:
Incorporate comments made by Shawn Guo
- BA16:
Remove invalid i2s-master property in ssi1 node
- Bx50v3:
Remove redundant address-cells/size-cells properties in clocks node
Update stgl5000 node name to codec to better match DT convention
Remove unused igb entries
Fix unit address for wlcore
Move status to last property in usdhc4 node

History:
--------
[v1]: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-October/381872.html
[v2]: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-November/383276.html
[v3]: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-November/384202.html
[v4]: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-December/390373.html
[v5]: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-December/390788.html
[v6]: http://lists.infradead.org/pipermail/linux-arm-kernel/2015-December/396131.html
[v7]: http://lists.infradead.org/pipermail/linux-arm-kernel/2016-January/403429.html

Akshay Bhat (5):
  of: Add vendor prefix for Advantech Corporation
  of: Add vendor prefix for General Electric Company
  ARM: dts: imx: Add support for Advantech/GE B450v3
  ARM: dts: imx: Add support for Advantech/GE B650v3
  ARM: dts: imx: Add support for Advantech/GE B850v3

Justin Waters (2):
  ARM: dts: imx: Add Advantech BA-16 Qseven module
  ARM: dts: imx: Add support for Advantech/GE Bx50v3

 .../devicetree/bindings/vendor-prefixes.txt        |   2 +
 arch/arm/boot/dts/Makefile                         |   3 +
 arch/arm/boot/dts/imx6q-b450v3.dts                 |  88 +++
 arch/arm/boot/dts/imx6q-b650v3.dts                 |  88 +++
 arch/arm/boot/dts/imx6q-b850v3.dts                 | 157 +++++
 arch/arm/boot/dts/imx6q-ba16.dtsi                  | 632 +++++++++++++++++++++
 arch/arm/boot/dts/imx6q-bx50v3.dtsi                | 225 ++++++++
 7 files changed, 1195 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6q-b450v3.dts
 create mode 100644 arch/arm/boot/dts/imx6q-b650v3.dts
 create mode 100644 arch/arm/boot/dts/imx6q-b850v3.dts
 create mode 100644 arch/arm/boot/dts/imx6q-ba16.dtsi
 create mode 100644 arch/arm/boot/dts/imx6q-bx50v3.dtsi

-- 
2.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
