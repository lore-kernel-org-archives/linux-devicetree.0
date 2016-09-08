From: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v6 2/6] dt-bindings: Add a binding for Mediatek MDP
Date: Thu, 8 Sep 2016 21:09:02 +0800
Message-ID: <1473340146-6598-3-git-send-email-minghsiu.tsai@mediatek.com>
References: <1473340146-6598-1-git-send-email-minghsiu.tsai@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1473340146-6598-1-git-send-email-minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Pawel Osciak <posciak-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a DT binding documentation of MDP for the MT8173 SoC
from Mediatek

Signed-off-by: Minghsiu Tsai <minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/media/mediatek-mdp.txt     |  109 ++++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp.txt b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
new file mode 100644
index 0000000..4182063
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
@@ -0,0 +1,109 @@
+* Mediatek Media Data Path
+
+Media Data Path is used for scaling and color space conversion.
+
+Required properties (controller (parent) node):
+- compatible: "mediatek,mt8173-mdp"
+- mediatek,vpu: the node of video processor unit, see
+  Documentation/devicetree/bindings/media/mediatek-vpu.txt for details.
+
+Required properties (all function blocks, child node):
+- compatible: Should be one of
+        "mediatek,mt8173-mdp-rdma"  - read DMA
+        "mediatek,mt8173-mdp-rsz"   - resizer
+        "mediatek,mt8173-mdp-wdma"  - write DMA
+        "mediatek,mt8173-mdp-wrot"  - write DMA with rotation
+- reg: Physical base address and length of the function block register space
+- clocks: device clocks, see
+  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
+- power-domains: a phandle to the power domain, see
+  Documentation/devicetree/bindings/power/power_domain.txt for details.
+
+Required properties (DMA function blocks, child node):
+- compatible: Should be one of
+        "mediatek,mt8173-mdp-rdma"
+        "mediatek,mt8173-mdp-wdma"
+        "mediatek,mt8173-mdp-wrot"
+- iommus: should point to the respective IOMMU block with master port as
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+- mediatek,larb: must contain the local arbiters in the current Socs, see
+  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+  for details.
+
+Example:
+mdp {
+	compatible = "mediatek,mt8173-mdp";
+	#address-cells = <2>;
+	#size-cells = <2>;
+	ranges;
+	mediatek,vpu = <&vpu>;
+
+	mdp_rdma0: rdma@14001000 {
+		compatible = "mediatek,mt8173-mdp-rdma";
+		reg = <0 0x14001000 0 0x1000>;
+		clocks = <&mmsys CLK_MM_MDP_RDMA0>,
+			 <&mmsys CLK_MM_MUTEX_32K>;
+		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+		iommus = <&iommu M4U_PORT_MDP_RDMA0>;
+		mediatek,larb = <&larb0>;
+	};
+
+	mdp_rdma1: rdma@14002000 {
+		compatible = "mediatek,mt8173-mdp-rdma";
+		reg = <0 0x14002000 0 0x1000>;
+		clocks = <&mmsys CLK_MM_MDP_RDMA1>,
+			 <&mmsys CLK_MM_MUTEX_32K>;
+		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+		iommus = <&iommu M4U_PORT_MDP_RDMA1>;
+		mediatek,larb = <&larb4>;
+	};
+
+	mdp_rsz0: rsz@14003000 {
+		compatible = "mediatek,mt8173-mdp-rsz";
+		reg = <0 0x14003000 0 0x1000>;
+		clocks = <&mmsys CLK_MM_MDP_RSZ0>;
+		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+	};
+
+	mdp_rsz1: rsz@14004000 {
+		compatible = "mediatek,mt8173-mdp-rsz";
+		reg = <0 0x14004000 0 0x1000>;
+		clocks = <&mmsys CLK_MM_MDP_RSZ1>;
+		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+	};
+
+	mdp_rsz2: rsz@14005000 {
+		compatible = "mediatek,mt8173-mdp-rsz";
+		reg = <0 0x14005000 0 0x1000>;
+		clocks = <&mmsys CLK_MM_MDP_RSZ2>;
+		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+	};
+
+	mdp_wdma0: wdma@14006000 {
+		compatible = "mediatek,mt8173-mdp-wdma";
+		reg = <0 0x14006000 0 0x1000>;
+		clocks = <&mmsys CLK_MM_MDP_WDMA>;
+		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+		iommus = <&iommu M4U_PORT_MDP_WDMA>;
+		mediatek,larb = <&larb0>;
+	};
+
+	mdp_wrot0: wrot@14007000 {
+		compatible = "mediatek,mt8173-mdp-wrot";
+		reg = <0 0x14007000 0 0x1000>;
+		clocks = <&mmsys CLK_MM_MDP_WROT0>;
+		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+		iommus = <&iommu M4U_PORT_MDP_WROT0>;
+		mediatek,larb = <&larb0>;
+	};
+
+	mdp_wrot1: wrot@14008000 {
+		compatible = "mediatek,mt8173-mdp-wrot";
+		reg = <0 0x14008000 0 0x1000>;
+		clocks = <&mmsys CLK_MM_MDP_WROT1>;
+		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
+		iommus = <&iommu M4U_PORT_MDP_WROT1>;
+		mediatek,larb = <&larb4>;
+	};
+};
-- 
1.7.9.5
