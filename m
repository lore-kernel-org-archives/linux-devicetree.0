From: Mathieu Olivari <mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH 0/3] qcom: Add SMEM MTD parser
Date: Thu, 13 Aug 2015 14:33:37 -0700
Message-ID: <1439501620-24073-1-git-send-email-mathieu@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mathieu Olivari <mathieu-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

QCOM platforms such as IPQ806x are using SMEM to store their flash
layout. This patch set adds the DT nodes required to instanciate SMEM
on IPQ806x and add an MTD parser using it.

This change is based on the SMEM driver posted here:
*https://lkml.org/lkml/2015/7/27/1125

Mathieu Olivari (3):
  ARM: qcom: add SFPB nodes to IPQ806x dts
  ARM: qcom: add SMEM device node to IPQ806x dts
  mtd: add SMEM parser for QCOM platforms

 arch/arm/boot/dts/qcom-ipq8064.dtsi |  23 +++-
 drivers/mtd/Kconfig                 |   7 ++
 drivers/mtd/Makefile                |   1 +
 drivers/mtd/qcom_smem_part.c        | 224 ++++++++++++++++++++++++++++++++++++
 4 files changed, 254 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/qcom_smem_part.c

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
