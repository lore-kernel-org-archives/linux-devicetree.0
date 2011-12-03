From: Simon Glass <sjg@chromium.org>
Subject: [PATCH 2/6] tegra: fdt: Add keyboard definitions for
	Seaboard
Date: Fri,  2 Dec 2011 18:57:47 -0800
Message-ID: <1322881071-11148-3-git-send-email-sjg@chromium.org>
References: <1322881071-11148-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1322881071-11148-1-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Anton Staff <robotboy@chromium.org>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

From: Anton Staff <robotboy@chromium.org>

Seaboard uses a QUERTY keyboard. We add key codes for this to
enable key scanning to work.

Signed-off-by: Simon Glass <sjg@chromium.org>
---
 board/nvidia/dts/tegra2-seaboard.dts |   71 ++++++++++++++++++++++++++++++++++
 1 files changed, 71 insertions(+), 0 deletions(-)

diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts/tegra2-seaboard.dts
index 19c6503..79de16b 100644
--- a/board/nvidia/dts/tegra2-seaboard.dts
+++ b/board/nvidia/dts/tegra2-seaboard.dts
@@ -45,4 +45,75 @@
 	usb@c5008000 {
 		status = "okay";
 	};
+
+	kbc@7000e200 {
+		status = "okay";
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
