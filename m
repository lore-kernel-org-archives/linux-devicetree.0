From: Zhao Qiang <B45475-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] powerpc/p1010rdb-pa: modify phy interrupt.
Date: Thu, 5 Dec 2013 14:00:03 +0800
Message-ID: <1386223203-22353-1-git-send-email-B45475@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Zhao Qiang <B45475-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It is not correct according to p1010rdb-pa user guide.
So modify it.

Signed-off-by: Zhao Qiang <B45475-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/powerpc/boot/dts/p1010rdb-pa.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/dts/p1010rdb-pa.dtsi b/arch/powerpc/boot/dts/p1010rdb-pa.dtsi
index 3d275e0..0cf6c34 100644
--- a/arch/powerpc/boot/dts/p1010rdb-pa.dtsi
+++ b/arch/powerpc/boot/dts/p1010rdb-pa.dtsi
@@ -39,7 +39,7 @@
 };
 
 &phy0 {
-	interrupts = <3 1 0 0>;
+	interrupts = <1 1 0 0>;
 };
 
 &phy1 {
@@ -47,5 +47,5 @@
 };
 
 &phy2 {
-	interrupts = <2 1 0 0>;
+	interrupts = <4 1 0 0>;
 };
-- 
1.8.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
