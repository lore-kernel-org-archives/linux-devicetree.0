From: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v8 3/8] arm64: dts: mediatek: Add node for Mediatek Video
 Processor Unit
Date: Mon, 25 Apr 2016 20:30:33 +0800
Message-ID: <1461587438-59886-4-git-send-email-tiffany.lin@mediatek.com>
References: <1461587438-59886-1-git-send-email-tiffany.lin@mediatek.com>
 <1461587438-59886-2-git-send-email-tiffany.lin@mediatek.com>
 <1461587438-59886-3-git-send-email-tiffany.lin@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1461587438-59886-3-git-send-email-tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
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
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, PoChun.Lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Add VPU drivers for MT8173

Signed-off-by: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Signed-off-by: Tiffany Lin <tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi |   23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index eab7efc..ae147bb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -125,6 +125,18 @@
 		clock-output-names = "cpum_ck";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		vpu_dma_reserved: vpu_dma_mem_region {
+			compatible = "shared-dma-pool";
+			reg = <0 0xb7000000 0 0x500000>;
+			alignment = <0x1000>;
+			no-map;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&gic>;
@@ -269,6 +281,17 @@
 			clock-names = "spi", "wrap";
 		};
 
+		vpu: vpu@10020000 {
+			compatible = "mediatek,mt8173-vpu";
+			reg = <0 0x10020000 0 0x30000>,
+			      <0 0x10050000 0 0x100>;
+			reg-names = "tcm", "cfg_reg";
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topckgen CLK_TOP_SCP_SEL>;
+			clock-names = "main";
+			memory-region = <&vpu_dma_reserved>;
+		};
+
 		sysirq: intpol-controller@10200620 {
 			compatible = "mediatek,mt8173-sysirq",
 				     "mediatek,mt6577-sysirq";
-- 
1.7.9.5
