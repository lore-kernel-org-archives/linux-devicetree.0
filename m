From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 2/2] ARM: dts: stm32: Reorder nodes in stm32mp157c-ed1
Date: Tue, 26 Jun 2018 18:19:01 +0200
Message-ID: <1530029941-26089-3-git-send-email-alexandre.torgue@st.com>
References: <1530029941-26089-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1530029941-26089-1-git-send-email-alexandre.torgue@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: ludovic.barre@st.com, devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Nodes should be ordered in alphabetic order.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
index 050c30d..de8b8a1 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -49,17 +49,6 @@
 	};
 };
 
-&rng1 {
-	status = "okay";
-};
-
-&timers6 {
-	status = "okay";
-	timer@5 {
-		status = "okay";
-	};
-};
-
 &i2c4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c4_pins_a>;
@@ -68,10 +57,21 @@
 	status = "okay";
 };
 
+&rng1 {
+	status = "okay";
+};
+
 &rtc {
 	status = "okay";
 };
 
+&timers6 {
+	status = "okay";
+	timer@5 {
+		status = "okay";
+	};
+};
+
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_a>;
-- 
2.7.4
