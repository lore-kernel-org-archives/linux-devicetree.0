From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend] ARM: dts: atlas7: Use generic uart-has-rtscts DT
 property
Date: Fri,  2 Mar 2018 15:02:45 +0100
Message-ID: <1519999365-15201-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Barry Song <baohua@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

As of commit 7f60830ab1511d94 ("serial: sirf: Use generic
uart-has-rtscts DT property property"), the SiRF UART driver recognizes
the generic "uart-has-rtscts" DT property, deprecating the
vendor-specific "sirf,uart-has-rtscts" DT property. Hence replace the
latter by the former in all DTS files.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/atlas7-evb.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/atlas7-evb.dts b/arch/arm/boot/dts/atlas7-evb.dts
index 1e9cd1a8508e17c2..900e03b7a7b21011 100644
--- a/arch/arm/boot/dts/atlas7-evb.dts
+++ b/arch/arm/boot/dts/atlas7-evb.dts
@@ -73,7 +73,7 @@
 		btm {
 			uart6: uart@11000000 {
 				status = "okay";
-				sirf,uart-has-rtscts;
+				uart-has-rtscts;
 			};
 		};
 
-- 
2.7.4
