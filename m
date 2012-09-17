From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: [PATCH 13/16] arm: at91: dt: sam9g20ek: use rts/cts/dtr/dsr/dcd/ri
 pinctrl group for uart0
Date: Mon, 17 Sep 2012 17:27:10 +0200
Message-ID: <1347895633-1763-13-git-send-email-plagnioj@jcrosoft.com>
References: <20120917140423.GA17667@game.jcrosoft.org>
 <1347895633-1763-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1347895633-1763-1-git-send-email-plagnioj@jcrosoft.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
List-Id: devicetree@vger.kernel.org

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
---
 arch/arm/boot/dts/at91sam9g20ek_common.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/at91sam9g20ek_common.dtsi b/arch/arm/boot/dts/at91sam9g20ek_common.dtsi
index b06c0db..e33ab0a 100644
--- a/arch/arm/boot/dts/at91sam9g20ek_common.dtsi
+++ b/arch/arm/boot/dts/at91sam9g20ek_common.dtsi
@@ -35,6 +35,12 @@
 			};
 
 			usart0: serial@fffb0000 {
+				pinctrl-0 =
+					<&pinctrl_uart0
+					 &pinctrl_uart0_rts_cts
+					 &pinctrl_uart0_dtr_dsr
+					 &pinctrl_uart0_dcd
+					 &pinctrl_uart0_ri>;
 				status = "okay";
 			};
 
-- 
1.7.10.4
