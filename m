From: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 6/6] arm64: dts: Add SBA-RAID DT nodes for Stingray SoC
Date: Wed, 26 Jul 2017 11:06:44 +0530
Message-ID: <1501047404-14456-7-git-send-email-anup.patel@broadcom.com>
References: <1501047404-14456-1-git-send-email-anup.patel@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501047404-14456-1-git-send-email-anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds Broadcom SBA-RAID DT nodes for Stingray SoC.

The Stingray SoC has total 32 SBA-RAID FlexRM rings and it has
8 CPUs so we create 8 SBA-RAID instances (one for each CPU).
This way Linux DMAENGINE will have one SBA-RAID DMA device for
each CPU.

Signed-off-by: Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
---
 .../boot/dts/broadcom/stingray/stingray-fs4.dtsi   | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi
index 1f927c4..8bf1dc6 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray-fs4.dtsi
@@ -51,4 +51,68 @@
 			msi-parent = <&gic_its 0x4300>;
 			#mbox-cells = <3>;
 		};
+
+		raid0: raid@0 {
+			compatible = "brcm,iproc-sba-v2";
+			mboxes = <&raid_mbox 0 0x1 0xff00>,
+				 <&raid_mbox 1 0x1 0xff00>,
+				 <&raid_mbox 2 0x1 0xff00>,
+				 <&raid_mbox 3 0x1 0xff00>;
+		};
+
+		raid1: raid@1 {
+			compatible = "brcm,iproc-sba-v2";
+			mboxes = <&raid_mbox 4 0x1 0xff00>,
+				 <&raid_mbox 5 0x1 0xff00>,
+				 <&raid_mbox 6 0x1 0xff00>,
+				 <&raid_mbox 7 0x1 0xff00>;
+		};
+
+		raid2: raid@2 {
+			compatible = "brcm,iproc-sba-v2";
+			mboxes = <&raid_mbox 8 0x1 0xff00>,
+				 <&raid_mbox 9 0x1 0xff00>,
+				 <&raid_mbox 10 0x1 0xff00>,
+				 <&raid_mbox 11 0x1 0xff00>;
+		};
+
+		raid3: raid@3 {
+			compatible = "brcm,iproc-sba-v2";
+			mboxes = <&raid_mbox 12 0x1 0xff00>,
+				 <&raid_mbox 13 0x1 0xff00>,
+				 <&raid_mbox 14 0x1 0xff00>,
+				 <&raid_mbox 15 0x1 0xff00>;
+		};
+
+		raid4: raid@4 {
+			compatible = "brcm,iproc-sba-v2";
+			mboxes = <&raid_mbox 16 0x1 0xff00>,
+				 <&raid_mbox 17 0x1 0xff00>,
+				 <&raid_mbox 18 0x1 0xff00>,
+				 <&raid_mbox 19 0x1 0xff00>;
+		};
+
+		raid5: raid@5 {
+			compatible = "brcm,iproc-sba-v2";
+			mboxes = <&raid_mbox 20 0x1 0xff00>,
+				 <&raid_mbox 21 0x1 0xff00>,
+				 <&raid_mbox 22 0x1 0xff00>,
+				 <&raid_mbox 23 0x1 0xff00>;
+		};
+
+		raid6: raid@6 {
+			compatible = "brcm,iproc-sba-v2";
+			mboxes = <&raid_mbox 24 0x1 0xff00>,
+				 <&raid_mbox 25 0x1 0xff00>,
+				 <&raid_mbox 26 0x1 0xff00>,
+				 <&raid_mbox 27 0x1 0xff00>;
+		};
+
+		raid7: raid@7 {
+			compatible = "brcm,iproc-sba-v2";
+			mboxes = <&raid_mbox 28 0x1 0xff00>,
+				 <&raid_mbox 29 0x1 0xff00>,
+				 <&raid_mbox 30 0x1 0xff00>,
+				 <&raid_mbox 31 0x1 0xff00>;
+		};
 	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
