From: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/4] Add some DT nodes for Mediatek MT2701
Date: Thu, 22 Jun 2017 16:43:35 +0800
Message-ID: <1498121019-21984-1-git-send-email-erin.lo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series based on v4.12-rc1, include MT2701 ethernet/disp bls/display function DT nodes.

Change in v2:
1. Add reset properties in ethernet nodes
2. Split bls nodes into two patches for dtsi and actual board
3. Remove redundant dispsys@14000000 node

Sean Wang (1):
  arm: dts: mt2701: Add ethernet device node

Weiqing Kong (2):
  arm: dts: mt2701: Add display bls related nodes for MT2701
  arm: dts: mt2701: Add display bls related nodes for MT2701

YT Shen (1):
  arm: dts: mt2701: Add display subsystem related nodes for MT2701

 arch/arm/boot/dts/mt2701-evb.dts |  29 ++++++++++
 arch/arm/boot/dts/mt2701.dtsi    | 117 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 146 insertions(+)

--
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
