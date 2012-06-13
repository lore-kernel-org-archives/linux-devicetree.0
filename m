From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 17/19] tegra: fdt: Add LCD definitions for Seaboard
Date: Wed, 13 Jun 2012 09:19:53 -0700
Message-ID: <1339604395-6621-18-git-send-email-sjg@chromium.org>
References: <1339604395-6621-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1339604395-6621-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Seaboard has a 1366x768 16bpp LCD. The backlight is controlled
by one of the PWMs.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Update seaboard LCD definitions for new fdt binding

 board/nvidia/dts/tegra2-seaboard.dts |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts/tegra2-seaboard.dts
index 3352539..3b16f84 100644
--- a/board/nvidia/dts/tegra2-seaboard.dts
+++ b/board/nvidia/dts/tegra2-seaboard.dts
@@ -153,4 +153,25 @@
 			0x1f04008a>;
 		linux,fn-keymap = <0x05040002>;
 	};
+
+	display@0x54200000 {
+		nvidia,pwfm = <&pwfm2>;
+		nvidia,frame-buffer = <0x2f680000>;
+		nvidia,backlight-enable-gpios = <&gpio 28 0>;	/* PD4 */
+		nvidia,lvds-shutdown-gpios = <&gpio 10 0>;	/* PB2 */
+		nvidia,backlight-vdd-gpios = <&gpio 176 0>;	/* PW0 */
+		nvidia,panel-vdd-gpios = <&gpio 22 0>;		/* PC6 */
+		nvidia,panel-timings = <4 203 17 15>;
+
+		lcd {
+			compatible = "nvidia,lcd";
+			nvidia,width = <1366>;
+			nvidia,height = <768>;
+			nvidia,bits-per-pixel = <16>;
+			nvidia,pixel-clock = <70600000>;
+
+			nvidia,horiz-timing = <11 58 58 58>;
+			nvidia,vert-timing = <1 4 4 4>;
+		};
+	};
 };
-- 
1.7.7.3
