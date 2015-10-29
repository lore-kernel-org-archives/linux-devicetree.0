From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] Documentation: arm: Fixed typo in socfpga fpga mgr example
Date: Thu, 29 Oct 2015 13:47:02 -0700
Message-ID: <1446151622-7306-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Addresses should not be prefixed contain '0x' in nodes.

Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/fpga/altera-socfpga-fpga-mgr.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/fpga/altera-socfpga-fpga-mgr.txt b/Documentation/devicetree/bindings/fpga/altera-socfpga-fpga-mgr.txt
index 9b027a6..823f3d6 100644
--- a/Documentation/devicetree/bindings/fpga/altera-socfpga-fpga-mgr.txt
+++ b/Documentation/devicetree/bindings/fpga/altera-socfpga-fpga-mgr.txt
@@ -9,7 +9,7 @@ Required properties:
 
 Example:
 
-	hps_0_fpgamgr: fpgamgr@0xff706000 {
+	hps_0_fpgamgr: fpgamgr@0ff706000 {
 		compatible = "altr,socfpga-fpga-mgr";
 		reg = <0xFF706000 0x1000
 		       0xFFB90000 0x1000>;
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
