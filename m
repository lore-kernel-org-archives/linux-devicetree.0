From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: [PATCH 5/5] ARM: at91: sam9m10g45ek add udc DT support
Date: Fri, 17 May 2013 16:42:10 +0200
Message-ID: <1368801730-31383-5-git-send-email-plagnioj@jcrosoft.com>
References: <20130517141443.GB16804@game.jcrosoft.org>
 <1368801730-31383-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1368801730-31383-1-git-send-email-plagnioj@jcrosoft.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, devicetree-discuss@lists.ozlabs.org, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
---
 arch/arm/boot/dts/at91sam9m10g45ek.dts |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/at91sam9m10g45ek.dts b/arch/arm/boot/dts/at91sam9m10g45ek.dts
index 89c50d1..17665ef 100644
--- a/arch/arm/boot/dts/at91sam9m10g45ek.dts
+++ b/arch/arm/boot/dts/at91sam9m10g45ek.dts
@@ -112,6 +112,11 @@
 					reg = <0>;
 				};
 			};
+
+			usb2: gadget@fff78000 {
+				atmel,vbus-gpio = <&pioB 19 GPIO_ACTIVE_HIGH>;
+				status = "okay";
+			};
 		};
 
 		nand0: nand@40000000 {
-- 
1.7.10.4
