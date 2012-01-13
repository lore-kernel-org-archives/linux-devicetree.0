From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 4/6] tegra: fdt: Add NAND definitions to fdt
Date: Fri, 13 Jan 2012 15:10:54 -0800
Message-ID: <1326496256-5559-5-git-send-email-sjg@chromium.org>
References: <1326496256-5559-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326496256-5559-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
Cc: Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a flash node to handle the NAND, including memory timings and
page / block size information.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 board/nvidia/dts/tegra2-seaboard.dts |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts/tegra2-seaboard.dts
index 33260a4..cc9abe2 100644
--- a/board/nvidia/dts/tegra2-seaboard.dts
+++ b/board/nvidia/dts/tegra2-seaboard.dts
@@ -125,4 +125,19 @@
 				0x00000000 0x00000000 0x00000000 0x00000000 >;
 		};
 	};
+
+	nand-controller@0x70008000 {
+		wp-gpios = <&gpio 59 0>;		/* PH3 */
+		width = <8>;
+		nvidia,timing = <26 100 20 80 20 10 12 10 70>;
+		nand@0 {
+			compatible = "hynix,hy27uf4g2b", "nand-flash";
+			page-data-bytes = <2048>;
+			tag-ecc-bytes = <4>;
+			tag-bytes = <20>;
+			data-ecc-bytes = <36>;
+			skipped-spare-bytes = <4>;
+			page-spare-bytes = <64>;
+		};
+	};
 };
-- 
1.7.7.3
