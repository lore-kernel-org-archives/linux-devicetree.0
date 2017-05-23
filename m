From: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 1/3] dt-bindings: mt8173: Fix mdp device tree
Date: Tue, 23 May 2017 11:24:09 +0800
Message-ID: <1495509851-29159-2-git-send-email-minghsiu.tsai@mediatek.com>
References: <1495509851-29159-1-git-send-email-minghsiu.tsai@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1495509851-29159-1-git-send-email-minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Houlong Wei <houlong.wei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Wu-Cheng Li <wuchengli-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

If the mdp_* nodes are under an mdp sub-node, their corresponding
platform device does not automatically get its iommu assigned properly.

Fix this by moving the mdp component nodes up a level such that they are
siblings of mdp and all other SoC subsystems.  This also simplifies the
device tree.

Although it fixes iommu assignment issue, it also break compatibility
with old device tree. So, the patch in driver is needed to iterate over
sibling mdp device nodes, not child ones, to keep driver work properly.

Signed-off-by: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

---
 Documentation/devicetree/bindings/media/mediatek-mdp.txt | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp.txt b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
index 4182063..0d03e3a 100644
--- a/Documentation/devicetree/bindings/media/mediatek-mdp.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
@@ -2,7 +2,7 @@
 
 Media Data Path is used for scaling and color space conversion.
 
-Required properties (controller (parent) node):
+Required properties (controller node):
 - compatible: "mediatek,mt8173-mdp"
 - mediatek,vpu: the node of video processor unit, see
   Documentation/devicetree/bindings/media/mediatek-vpu.txt for details.
@@ -32,21 +32,16 @@ Required properties (DMA function blocks, child node):
   for details.
 
 Example:
-mdp {
-	compatible = "mediatek,mt8173-mdp";
-	#address-cells = <2>;
-	#size-cells = <2>;
-	ranges;
-	mediatek,vpu = <&vpu>;
-
 	mdp_rdma0: rdma@14001000 {
 		compatible = "mediatek,mt8173-mdp-rdma";
+			     "mediatek,mt8173-mdp";
 		reg = <0 0x14001000 0 0x1000>;
 		clocks = <&mmsys CLK_MM_MDP_RDMA0>,
 			 <&mmsys CLK_MM_MUTEX_32K>;
 		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 		iommus = <&iommu M4U_PORT_MDP_RDMA0>;
 		mediatek,larb = <&larb0>;
+		mediatek,vpu = <&vpu>;
 	};
 
 	mdp_rdma1: rdma@14002000 {
@@ -106,4 +101,3 @@ mdp {
 		iommus = <&iommu M4U_PORT_MDP_WROT1>;
 		mediatek,larb = <&larb4>;
 	};
-};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
