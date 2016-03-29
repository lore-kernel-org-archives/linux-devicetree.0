From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/4] Few more updates for NS2 DT
Date: Tue, 29 Mar 2016 12:57:30 +0530
Message-ID: <1459236454-26285-1-git-send-email-anup.patel@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Mason <jon.mason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset primarily adds more PL330 and PL022 DT nodes for
NS2 SVK. It also moves clock DT nodes to separate file to be
consistent with other Broadcom SoCs DT files.

The patchset is based on v4.6-rc1 tag and is available in ns2_dt3_v1
branch of https://github.com/Broadcom/arm64-linux.git

All patches have been tested on Broadcom NS2 SVK.

Anup Patel (4):
  arm64: dts: Add ARM PL330 DMA DT node for NS2
  arm64: dts: Add maintenance interrupt for GIC in NS2 DT
  arm64: dts: Move NS2 clock DT nodes to separate DT file
  arm64: dts: Add ARM PL022 SPI DT nodes for NS2

 arch/arm64/boot/dts/broadcom/ns2-clock.dtsi | 105 +++++++++++++++++++++++
 arch/arm64/boot/dts/broadcom/ns2-svk.dts    |  45 ++++++++++
 arch/arm64/boot/dts/broadcom/ns2.dtsi       | 124 +++++++++++-----------------
 3 files changed, 196 insertions(+), 78 deletions(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/ns2-clock.dtsi

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
