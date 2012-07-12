From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 16/18] tegra: fdt: Add LCD definitions for Seaboard
Date: Thu, 12 Jul 2012 08:25:16 -0700
Message-ID: <1342106718-3058-17-git-send-email-sjg@chromium.org>
References: <1342106718-3058-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1342106718-3058-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
Changes in v2:
- Update seaboard LCD definitions for new fdt binding

Changes in v3:
- Use new upstream proposed LCD definitions

 board/nvidia/dts/tegra2-seaboard.dts |   32 ++++++++++++++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts/tegra2-seaboard.dts
index 3352539..bfb835f 100644
--- a/board/nvidia/dts/tegra2-seaboard.dts
+++ b/board/nvidia/dts/tegra2-seaboard.dts
@@ -153,4 +153,36 @@
 			0x1f04008a>;
 		linux,fn-keymap = <0x05040002>;
 	};
+
+	host1x {
+		dc@54200000 {
+			rgb {
+				status = "okay";
+				/* Seaboard has 1366x768 */
+				clock = <70600000>;
+				xres = <1366>;
+				yres = <768>;
+				left-margin = <58>;
+				right-margin = <58>;
+				hsync-len = <58>;
+				lower-margin = <4>;
+				upper-margin = <4>;
+				vsync-len = <4>;
+				hsync-active-high;
+				nvidia,frame-buffer = <0x2f680000>;
+				nvidia,bits-per-pixel = <16>;
+				nvidia,panel = <&lcd_panel>;
+			};
+		};
+	};
+
+	lcd_panel: panel {
+		nvidia,pwm = <&pwm 2 0>;
+		nvidia,backlight-enable-gpios = <&gpio 28 0>;	/* PD4 */
+		nvidia,lvds-shutdown-gpios = <&gpio 10 0>;	/* PB2 */
+		nvidia,backlight-vdd-gpios = <&gpio 176 0>;	/* PW0 */
+		nvidia,panel-vdd-gpios = <&gpio 22 0>;		/* PC6 */
+		nvidia,panel-timings = <4 203 17 15>;
+	};
+
 };
-- 
1.7.7.3
