From: Patrick Venture <venture@google.com>
Subject: [PATCH] arm: dts: aspeed: quanta-q71l: Enable adc & ibt nodes
Date: Tue,  4 Sep 2018 08:53:29 -0700
Message-ID: <20180904155329.258447-1-venture@google.com>
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
To: venture@google.com, joel@jms.id.au, robh+dt@kernel.org, andrew@aj.id.au, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

ADC node is disabled by default in 4.13 tree onward and
needs to be enabled explicitly in separate device trees.

ibt(ipmi-bt-host) node is disabled by default in 4.13 tree onward and
needs to be enabled explicitly in separate device trees.

Signed-off-by: Patrick Venture <venture@google.com>
---
 arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
index c655564e6c6d..385c0f4b69ee 100644
--- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
@@ -112,6 +112,10 @@
 			&pinctrl_ddcclk_default &pinctrl_ddcdat_default>;
 };
 
+&ibt {
+	status = "okay";
+};
+
 &lpc_snoop {
 	status = "okay";
 	snoop-ports = <0x80>;
@@ -384,6 +388,10 @@
 	status = "okay";
 };
 
+&adc {
+	status = "okay";
+};
+
 &pwm_tacho {
 	status = "okay";
 
-- 
2.19.0.rc1.350.ge57e33dbd1-goog
