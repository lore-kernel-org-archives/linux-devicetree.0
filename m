From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH v2 0/5] ARM: dts: imx: update Boundary Devices boards support
Date: Tue,  1 Nov 2016 18:10:01 +0100
Message-ID: <20161101171006.24594-1-gary.bisson@boundarydevices.com>
References: <20161025211955.5345-1-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161025211955.5345-1-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This series includes several patches to update the support for our platforms.

Here are the main goals of this series:
1- Adding support for our latest SOM (SOM2)
2- Replace underscores in nodes name
3- Fix panel naming consistency across the boards

Changelog v1->v2:
- Drop the USB PHY reset changes, waiting for Peter's series [1] to get in.
- Replace underscores in nodes name

Let me know if you have any question.

Regards,
Gary

[1] https://www.spinics.net/lists/arm-kernel/msg536105.html

Gary Bisson (5):
  ARM: dts: imx: add Boundary Devices Nitrogen6_SOM2 support
  ARM: dts: imx6qdl-sabrelite: use hyphens for nodes name
  ARM: dts: imx6qdl-nitrogen6x: use hyphens for nodes name
  ARM: dts: imx6qdl-nit6xlite: use hyphens for nodes name
  ARM: dts: imx6qdl-nitrogen6_max: use hyphens for nodes name

 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/imx6q-nitrogen6_som2.dts    |  53 ++
 arch/arm/boot/dts/imx6qdl-nit6xlite.dtsi      |  32 +-
 arch/arm/boot/dts/imx6qdl-nitrogen6_max.dtsi  |  18 +-
 arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi | 770 ++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi     |  12 +-
 arch/arm/boot/dts/imx6qdl-sabrelite.dtsi      |  10 +-
 7 files changed, 849 insertions(+), 47 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6q-nitrogen6_som2.dts
 create mode 100644 arch/arm/boot/dts/imx6qdl-nitrogen6_som2.dtsi

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
