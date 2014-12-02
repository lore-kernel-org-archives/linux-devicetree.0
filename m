From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 2/2] of: Use ovti for Omnivision
Date: Tue,  2 Dec 2014 01:09:04 -0200
Message-ID: <1417489744-31152-2-git-send-email-festevam@gmail.com>
References: <1417489744-31152-1-git-send-email-festevam@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417489744-31152-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

The correct symbol for OmniVision Technologies is 'ovti', so let's convert it.

Signed-off-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
Changes since v2:
- Newly introduced on v3

 Documentation/devicetree/bindings/media/atmel-isi.txt        | 2 +-
 Documentation/devicetree/bindings/media/video-interfaces.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/atmel-isi.txt b/Documentation/devicetree/bindings/media/atmel-isi.txt
index 17e71b7..251f008 100644
--- a/Documentation/devicetree/bindings/media/atmel-isi.txt
+++ b/Documentation/devicetree/bindings/media/atmel-isi.txt
@@ -38,7 +38,7 @@ Example:
 
 	i2c1: i2c@f0018000 {
 		ov2640: camera@0x30 {
-			compatible = "omnivision,ov2640";
+			compatible = "ovti,ov2640";
 			reg = <0x30>;
 
 			port {
diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
index ce719f8..d87a902 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.txt
+++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
@@ -159,7 +159,7 @@ pipelines can be active: ov772x -> ceu0 or imx074 -> csi2 -> ceu0.
 	i2c0: i2c@0xfff20000 {
 		...
 		ov772x_1: camera@0x21 {
-			compatible = "omnivision,ov772x";
+			compatible = "ovti,ov772x";
 			reg = <0x21>;
 			vddio-supply = <&regulator1>;
 			vddcore-supply = <&regulator2>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
