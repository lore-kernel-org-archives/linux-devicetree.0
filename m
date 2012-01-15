From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 15/17] tegra: fdt: Add LCD definitions for Seaboard
Date: Sat, 14 Jan 2012 16:47:27 -0800
Message-ID: <1326588449-1794-16-git-send-email-sjg@chromium.org>
References: <1326588449-1794-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1326588449-1794-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
Cc: Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Seaboard has a 1366x768 16bpp LCD. The backlight is controlled
by one of the PWMs.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 board/nvidia/dts/tegra2-seaboard.dts |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts/tegra2-seaboard.dts
index b847215..710b254 100644
--- a/board/nvidia/dts/tegra2-seaboard.dts
+++ b/board/nvidia/dts/tegra2-seaboard.dts
@@ -210,4 +210,25 @@
 				 00  00  00  11  00  00  00  00
 				 00  00  00  00  00  00  00  00];
 	};
+
+	display@0x54200000 {
+		pwfm = <&pwfm2>;
+		frame-buffer = <0x2f680000>;
+		backlight-enable-gpio = <&gpio 28 0>;		/* PD4 */
+		lvds-shutdown-gpio = <&gpio 10 0>;		/* PB2 */
+		backlight-vdd-gpio = <&gpio 176 0>;		/* PW0 */
+		panel-vdd-gpio = <&gpio 22 0>;			/* PC6 */
+		panel-timings = <4 203 17 15>;
+
+		lcd {
+			compatible = "generic,lcd";
+			width = <1366>;
+			height = <768>;
+			bits-per-pixel = <16>;
+			pixel-clock = <70600000>;
+
+			horiz-timing = <11 58 58 58>;
+			vert-timing = <1 4 4 4>;
+		};
+	};
 };
-- 
1.7.7.3
