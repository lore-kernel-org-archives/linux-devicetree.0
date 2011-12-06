From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 2/6] tegra: fdt: Add keyboard definitions for Seaboard
Date: Tue,  6 Dec 2011 13:54:45 -0800
Message-ID: <1323208489-17830-3-git-send-email-sjg@chromium.org>
References: <1323208489-17830-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1323208489-17830-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
Cc: Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Anton Staff <robotboy-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Seaboard uses a QUERTY keyboard. We add key codes for this to
enable key scanning to work.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Remove status = "okay" since this is the default anyway

 board/nvidia/dts/tegra2-seaboard.dts |   70 ++++++++++++++++++++++++++++++++++
 1 files changed, 70 insertions(+), 0 deletions(-)

diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts/tegra2-seaboard.dts
index 839e761..ce2c1ec 100644
--- a/board/nvidia/dts/tegra2-seaboard.dts
+++ b/board/nvidia/dts/tegra2-seaboard.dts
@@ -44,4 +44,74 @@
 	usb@c5004000 {
 		status = "disabled";
 	};
+
+	kbc@7000e200 {
+		keycode-plain = [00  00  'w' 's' 'a' 'z' 00  DE
+				 00  00  00  00  00  00  00  00
+				 00  00  00  00  00  00  00  00
+				 '5' '4' 'r' 'e' 'f' 'd' 'x' 00
+				 '7' '6' 't' 'h' 'g' 'v' 'c' ' '
+				 '9' '8' 'u' 'y' 'j' 'n' 'b' 5C
+				 '-' '0' 'o' 'i' 'l' 'k' ',' 'm'
+				 00  '=' ']' 0D  00  00  00  00
+				 00  00  00  00  DF  DF  00  00
+				 00  00  00  00  00  00  00  00
+				 00  00  00  00  00  00  00  00
+				 '[' 'p' 27  ';' '/' '.' 00  00
+				 00  00  08  '3' '2' 1E  00  00
+				 00  7F  00  00  00  1D  1F  1C
+				 00  00  00  'q' 00  00  '1' 00
+				 1B  '`' 00  09  00  00  00  00];
+
+		keycode-shift = [00  00  'W' 'S' 'A' 'Z' 00  00
+				 00  00  00  00  00  00  00  00
+				 00  00  00  00  00  00  00  00
+				 '%' '$' 'R' 'E' 'F' 'D' 'X' 00
+				 '&' '^' 'T' 'H' 'G' 'V' 'C' ' '
+				 '(' '*' 'U' 'Y' 'J' 'N' 'B' '|'
+				 '_' ')' 'O' 'I' 'L' 'K' '<' 'M'
+				 00  '+' '}' 0D  00  00  00  00
+				 00  00  00  00  00  00  00  00
+				 00  00  00  00  00  00  00  00
+				 00  00  00  00  00  00  00  00
+				 '{' 'P' '"' ':' '?' '>' 00  00
+				 00  00  08  '#' '@' 00  00  00
+				 00  7F  00  00  00  00  00  00
+				 00  00  00  'Q' 00  00  '!' 00
+				 1B  '~' 00  09  00  00  00  00];
+
+		keycode-fn =    [00  00  00  00  00  00  00  00
+				 00  00  00  00  00  00  00  00
+				 00  00  00  00  00  00  00  00
+				 00  00  00  00  00  00  00  00
+				 '7' 00  00  00  00  00  00  00
+				 '9' '8' '4' 00  '1' 00  00  00
+				 00  '/' '6' '5' '3' '2' 00  '0'
+				 00  00  00  00  00  00  00  00
+				 00  00  00  00  00  00  00  00
+				 00  00  00  00  00  00  00  00
+				 00  00  00  00  00  00  00  00
+				 00  27  00  '-' '+' '.' 00  00
+				 00  00  00  00  00  00  00  00
+				 00  00  00  00  00  00  00  00
+				 00  00  00  00  00  00  00  00
+				 00  00  00  00  '?' 00  00  00];
+
+		keycode-ctrl =  [00  00  17  13  01  1a  00  00
+				 00  00  00  00  00  00  00  00
+				 00  00  00  00  00  00  00  00
+				 00  00  12  05  06  04  18  00
+				 00  00  14  08  07  16  03  00
+				 00  00  15  19  0a  0e  02  00
+				 00  00  0f  09  0c  0b  00  0d
+				 00  00  00  00  00  00  00  00
+				 00  00  00  00  00  00  00  00
+				 00  00  00  00  00  00  00  00
+				 00  00  00  00  00  00  00  00
+				 00  10  00  00  00  00  00  00
+				 00  00  00  00  00  00  00  00
+				 00  00  00  00  00  00  00  00
+				 00  00  00  11  00  00  00  00
+				 00  00  00  00  00  00  00  00];
+	};
 };
-- 
1.7.3.1
