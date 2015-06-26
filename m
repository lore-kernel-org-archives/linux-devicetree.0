From: bjorn@kryo.se
Subject: [PATCH v2 09/11] ARM: dts: msm8974: Add smem reservation and node
Date: Fri, 26 Jun 2015 14:50:17 -0700
Message-ID: <1435355419-23602-10-git-send-email-bjorn.andersson@sonymobile.com>
References: <1435355419-23602-1-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1435355419-23602-1-git-send-email-bjorn.andersson@sonymobile.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andy Gross <agross@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 7c7b7dc..d7c99b8 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -9,6 +9,17 @@
 	compatible = "qcom,msm8974";
 	interrupt-parent = <&intc>;
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		smem_region: smem@fa00000 {
+			reg = <0xfa00000 0x200000>;
+			no-map;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -239,6 +250,15 @@
 			#hwlock-cells = <1>;
 		};
 
+		smem@fa00000 {
+			compatible = "qcom,smem";
+
+			memory-region = <&smem_region>;
+			reg = <0xfc428000 0x4000>;
+
+			hwlocks = <&tcsr_mutex 3>;
+		};
+
 		serial@f991e000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0xf991e000 0x1000>;
-- 
1.9.3 (Apple Git-50)
