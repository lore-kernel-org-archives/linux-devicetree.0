From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 0/2] i.MX6QP GPC fixes
Date: Thu, 23 Mar 2017 15:44:16 +0100
Message-ID: <20170323144418.30977-1-l.stach@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Dong Aisheng <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Shawn,

those 2 patches implement the necessary workaround for the PU power
domain on the i.MX6QP. Both are on top of Dong Aishengs GPC fixes
series.

I'll submit the DT change to make use of the new compatible when
the GPC driver branch has been merged upstream.

Regards,
Lucas

Lucas Stach (2):
  dt-bindings: imx-gpc: add i.MX6 QuadPlus compatible
  soc/imx: add workaround for i.MX6QP to the GPC PD driver

 .../devicetree/bindings/power/fsl,imx-gpc.txt         |  5 ++++-
 drivers/soc/imx/gpc.c                                 | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
