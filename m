From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 5/7] tegra: fdt: Add NAND definitions to fdt
Date: Tue, 17 Apr 2012 11:50:12 -0700
Message-ID: <1334688614-4977-6-git-send-email-sjg@chromium.org>
References: <1334688614-4977-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1334688614-4977-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a flash node to handle the NAND, including memory timings and
page / block size information.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Update NAND binding to add "nvidia," prefix

Changes in v3:
- Add reg property for unit address (should be used for chip select)
- Update fdt binding to make everything Nvidia-specific

 board/nvidia/dts/tegra2-seaboard.dts |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts/tegra2-seaboard.dts
index 08ada8c..72a5f5d 100644
--- a/board/nvidia/dts/tegra2-seaboard.dts
+++ b/board/nvidia/dts/tegra2-seaboard.dts
@@ -126,4 +126,20 @@
 				0x00000000 0x00000000 0x00000000 0x00000000 >;
 		};
 	};
+
+	nand-controller@70008000 {
+		nvidia,wp-gpios = <&gpio 59 0>;		/* PH3 */
+		nvidia,width = <8>;
+		nvidia,timing = <26 100 20 80 20 10 12 10 70>;
+		nand@0 {
+			reg = <0>;
+			compatible = "hynix,hy27uf4g2b", "nand-flash";
+			nvidia,page-data-bytes = <2048>;
+			nvidia,tag-ecc-bytes = <4>;
+			nvidia,tag-bytes = <20>;
+			nvidia,data-ecc-bytes = <36>;
+			nvidia,skipped-spare-bytes = <4>;
+			nvidia,page-spare-bytes = <64>;
+		};
+	};
 };
-- 
1.7.7.3
