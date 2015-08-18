From: Mathieu Olivari <mathieu@codeaurora.org>
Subject: [PATCH v4 1/3] ARM: qcom: add SFPB nodes to IPQ806x dts
Date: Tue, 18 Aug 2015 14:04:18 -0700
Message-ID: <1439931860-7473-2-git-send-email-mathieu@codeaurora.org>
References: <1439931860-7473-1-git-send-email-mathieu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439931860-7473-1-git-send-email-mathieu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dwmw2@infradead.org, computersforpeace@gmail.com, agross@codeaurora.org, sboyd@codeaurora.org, bjorn.andersson@sonymobile.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Mathieu Olivari <mathieu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add one new node to the ipq806x.dtsi file to declare & register the
hardware spinlock devices. This mechanism is required to be used by
other drivers such as SMEM.

Signed-off-by: Mathieu Olivari <mathieu@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 9f727d8..8d366ae 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -329,5 +329,16 @@
 			#reset-cells = <1>;
 		};
 
+		sfpb_mutex_block: syscon@1200600 {
+			compatible = "syscon";
+			reg = <0x01200600 0x100>;
+		};
+	};
+
+	sfpb_mutex: sfpb-mutex {
+		compatible = "qcom,sfpb-mutex";
+		syscon = <&sfpb_mutex_block 4 4>;
+
+		#hwlock-cells = <1>;
 	};
 };
-- 
2.1.4
