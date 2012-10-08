From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v6 14/16] tegra: fdt: Add LCD definitions for Seaboard
Date: Mon,  8 Oct 2012 15:28:11 -0700
Message-ID: <1349735293-18832-15-git-send-email-sjg@chromium.org>
References: <1349735293-18832-5-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1349735293-18832-5-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Seaboard has a 1366x768 16bpp LCD. The backlight is controlled
by one of the PWMs.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v6:
- Add 400ms delay before enabling panel VDD

Changes in v5:
- Enable required LCD fdt nodes (which are now disabled by default)

Changes in v4:
- Adjust LCD fdt nodes for new binding
- Remove LCD frame buffer address property hack

Changes in v3:
- Use new upstream proposed LCD definitions

Changes in v2:
- Update seaboard LCD definitions for new fdt binding

 board/nvidia/dts/tegra20-seaboard.dts |   33 +++++++++++++++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/board/nvidia/dts/tegra20-seaboard.dts b/board/nvidia/dts/tegra20-seaboard.dts
index 25a63a0..dd98ca4 100644
--- a/board/nvidia/dts/tegra20-seaboard.dts
+++ b/board/nvidia/dts/tegra20-seaboard.dts
@@ -163,4 +163,37 @@
 			compatible = "hynix,hy27uf4g2b", "nand-flash";
 		};
 	};
+
+	host1x {
+		status = "okay";
+		dc@54200000 {
+			status = "okay";
+			rgb {
+				status = "okay";
+				nvidia,panel = <&lcd_panel>;
+			};
+		};
+	};
+
+	lcd_panel: panel {
+		/* Seaboard has 1366x768 */
+		clock = <70600000>;
+		xres = <1366>;
+		yres = <768>;
+		left-margin = <58>;
+		right-margin = <58>;
+		hsync-len = <58>;
+		lower-margin = <4>;
+		upper-margin = <4>;
+		vsync-len = <4>;
+		hsync-active-high;
+		nvidia,bits-per-pixel = <16>;
+		nvidia,pwm = <&pwm 2 0>;
+		nvidia,backlight-enable-gpios = <&gpio 28 0>;	/* PD4 */
+		nvidia,lvds-shutdown-gpios = <&gpio 10 0>;	/* PB2 */
+		nvidia,backlight-vdd-gpios = <&gpio 176 0>;	/* PW0 */
+		nvidia,panel-vdd-gpios = <&gpio 22 0>;		/* PC6 */
+		nvidia,panel-timings = <400 4 203 17 15>;
+	};
+
 };
-- 
1.7.7.3
