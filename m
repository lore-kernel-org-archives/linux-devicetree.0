From: Philip Avinash <avinashphilip-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 1/3] ARM: davinci: da850: Add LCDC DT entries
Date: Wed, 27 Mar 2013 13:13:57 +0530
Message-ID: <1364370239-18390-2-git-send-email-avinashphilip@ti.com>
References: <1364370239-18390-1-git-send-email-avinashphilip@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1364370239-18390-1-git-send-email-avinashphilip-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: nsekhar-l0cyMroinI0@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philip Avinash <avinashphilip-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add LCDC DT entries in da850 dts file.

Signed-off-by: Philip Avinash <avinashphilip-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/da850.dtsi |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index a6cbf89..087b4ea 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -62,6 +62,21 @@
 					0x10 0x00002200 0x0000ff00
 				>;
 			};
+			lcdc_pins:pinmux_lcdc_pins {
+				pinctrl-single,bits = <
+					/* LCD_D[2], LCD_D[3], LCD_D[4],
+					   LCD_D[5], LCD_D[6], LCD_D[7] */
+					0x40 0x22222200 0xffffff00
+					/* LCD_D[10], LCD_D[11], LCD_D[12],
+					   LCD_D[13], LCD_D[14], LCD_D[15],
+					   LCD_D[0], LCD_D[1] */
+					0x44 0x22222222 0xffffffff
+					/* LCD_PCLK, LCD_D[8], LCD_D[9] */
+					0x48 0x02000022 0x0f0000ff
+					/* LCD_AC_ENB_CS, LCD_VSYNC, LCD_HSYNC*/
+					0x4c 0x02000022 0x0f0000ff
+				>;
+			};
 		};
 		serial0: serial@1c42000 {
 			compatible = "ns16550a";
@@ -137,6 +152,12 @@
 			reg = <0x308000 0x80>;
 			status = "disabled";
 		};
+		lcdc: lcdc@01e13000 {
+			compatible = "ti,da830-lcdc";
+			reg = <0x213000 0x1000>;
+			interrupts = <52>;
+			status = "disabled";
+		};
 	};
 	nand_cs3@62000000 {
 		compatible = "ti,davinci-nand";
-- 
1.7.9.5
