From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH 1/2] ARM: dts: uniphier: add pinctrl groups of ethernet for
 second instance
Date: Tue, 27 Mar 2018 19:32:45 +0900
Message-ID: <1522146766-14435-2-git-send-email-hayashi.kunihiko@socionext.com>
References: <1522146766-14435-1-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1522146766-14435-1-git-send-email-hayashi.kunihiko@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Jassi Brar <jaswinder.singh@linaro.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Add pinctrl groups of ethernet, such as "ether1_rgmii" and "ether1_rmii".
These are used for second ethernet instance.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 arch/arm/boot/dts/uniphier-pinctrl.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/uniphier-pinctrl.dtsi b/arch/arm/boot/dts/uniphier-pinctrl.dtsi
index de481c3..c094377 100644
--- a/arch/arm/boot/dts/uniphier-pinctrl.dtsi
+++ b/arch/arm/boot/dts/uniphier-pinctrl.dtsi
@@ -33,6 +33,16 @@
 		function = "ether_rmii";
 	};
 
+	pinctrl_ether1_rgmii: ether1-rgmii {
+		groups = "ether1_rgmii";
+		function = "ether1_rgmii";
+	};
+
+	pinctrl_ether1_rmii: ether1-rmii {
+		groups = "ether1_rmii";
+		function = "ether1_rmii";
+	};
+
 	pinctrl_i2c0: i2c0 {
 		groups = "i2c0";
 		function = "i2c0";
-- 
2.7.4
