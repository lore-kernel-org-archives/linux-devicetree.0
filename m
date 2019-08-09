From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 4/6] arm64: dts: ti: k3-j721e-common-proc-board: Disable
 unused gpio modules
Date: Fri, 9 Aug 2019 13:59:45 +0530
Message-ID: <20190809082947.30590-5-lokeshvutla@ti.com>
References: <20190809082947.30590-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190809082947.30590-1-lokeshvutla@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>, linus.walleij@linaro.org
Cc: Device Tree Mailing List <devicetree@vger.kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>, Keerthy <j-keerthy@ti.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

There are 10 gpio instances inside SoC with 3 groups as below:
- Group1: main_gpio0, main_gpio2, main_gpio4, main_gpio6
- Group2: main_gpio1, main_gpio3, main_gpio5, main_gpio7
- Group3: wkup_gpio0, wkup_gpio1

Only one instance can be used in each group at a time. So use main_gpio0,
main_gpio1 and wkup_gpio0 for the current linux context and mark other
gpio nodes as disabled.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 .../dts/ti/k3-j721e-common-proc-board.dts     | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index 63b47b839388..509579ca3db2 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -52,3 +52,31 @@
 	/* UART not brought out */
 	status = "disabled";
 };
+
+&main_gpio2 {
+	status = "disabled";
+};
+
+&main_gpio3 {
+	status = "disabled";
+};
+
+&main_gpio4 {
+	status = "disabled";
+};
+
+&main_gpio5 {
+	status = "disabled";
+};
+
+&main_gpio6 {
+	status = "disabled";
+};
+
+&main_gpio7 {
+	status = "disabled";
+};
+
+&wkup_gpio1 {
+	status = "disabled";
+};
-- 
2.22.0
