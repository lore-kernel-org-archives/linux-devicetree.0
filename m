From: <xuelin.shi-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH] powerpc/p5040: Add device node for RAID Engine
Date: Thu, 25 Feb 2016 09:14:05 +0800
Message-ID: <1456362845-12169-1-git-send-email-xuelin.shi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, scott.wood-3arQi8VN3Tc@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xuelin Shi <xuelin.shi-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Xuelin Shi <xuelin.shi-3arQi8VN3Tc@public.gmane.org>

add the missing RAID Engine device node for p5040.
otherwise, the device can not be detected.

Signed-off-by: Xuelin Shi <xuelin.shi-3arQi8VN3Tc@public.gmane.org>
---
 arch/powerpc/boot/dts/fsl/p5040si-post.dtsi | 1 +
 arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi  | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/arch/powerpc/boot/dts/fsl/p5040si-post.dtsi b/arch/powerpc/boot/dts/fsl/p5040si-post.dtsi
index 2f227b1..e2bd931 100644
--- a/arch/powerpc/boot/dts/fsl/p5040si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p5040si-post.dtsi
@@ -420,6 +420,7 @@
 		fsl,iommu-parent = <&pamu4>;
 	};
 
+/include/ "qoriq-raid1.0-0.dtsi"
 /include/ "qoriq-qman1.dtsi"
 /include/ "qoriq-bman1.dtsi"
 
diff --git a/arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi b/arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi
index 0659d5b..dbd5775 100644
--- a/arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p5040si-pre.dtsi
@@ -73,6 +73,12 @@
 		rtic_d = &rtic_d;
 		sec_mon = &sec_mon;
 
+		raideng = &raideng;
+		raideng_jr0 = &raideng_jr0;
+		raideng_jr1 = &raideng_jr1;
+		raideng_jr2 = &raideng_jr2;
+		raideng_jr3 = &raideng_jr3;
+
 		fman0 = &fman0;
 		fman1 = &fman1;
 		ethernet0 = &enet0;
-- 
1.8.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
