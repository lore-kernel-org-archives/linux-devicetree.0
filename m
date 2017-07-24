From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH v2 0/2] ARM: dts: sabrelite/nitrogen6x: fix USB PHY reset
Date: Mon, 24 Jul 2017 14:59:56 +0200
Message-ID: <20170724125958.11939-1-gary.bisson@boundarydevices.com>
References: <20170724085005.22101-1-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170724085005.22101-1-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This series is follow-up to those two patches:
https://patchwork.kernel.org/patch/9395531/
https://patchwork.kernel.org/patch/9395539/

At the time they were refused because a pwrseq library was supposed to
get in. Unfortunately that plan hasn't succeeded yet so re-submitting
the original two patches with the following modifications:
- Rebase on top of v4.13-rc2
- Reword the title to make it clear this is a fix
- Reword the changelog so it is clearly a temporary workaround

Changelog v1->v2:
- Remove 'regulator-always-on' property as suggested by Fabio

Let me know if you have any question.

Regards,
Gary

Gary Bisson (2):
  ARM: dts: imx6qdl-sabrelite: fix USB PHY reset
  ARM: dts: imx6qdl-nitrogen6x: fix USB PHY reset

 arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi | 19 +++++++++++++++++++
 arch/arm/boot/dts/imx6qdl-sabrelite.dtsi  | 19 +++++++++++++++++++
 2 files changed, 38 insertions(+)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
