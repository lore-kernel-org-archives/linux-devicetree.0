From: Alexandre TORGUE <alexandre.torgue@gmail.com>
Subject: [RESEND PATCH v6 6/6] ARM: dts: stm32f429: Update Ethernet node on Eval board
Date: Mon,  9 May 2016 12:31:39 +0200
Message-ID: <1462789899-13153-7-git-send-email-alexandre.torgue@gmail.com>
References: <1462789899-13153-1-git-send-email-alexandre.torgue@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1462789899-13153-1-git-send-email-alexandre.torgue@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh@kernel.org, manabian@gmail.com, wens@csie.org
List-Id: devicetree@vger.kernel.org

Update new pinctrl phandle name and use new node name.

Signed-off-by: Alexandre TORGUE <alexandre.torgue@gmail.com>

diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
index 6bfc595..9a72445 100644
--- a/arch/arm/boot/dts/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/stm32429i-eval.dts
@@ -94,9 +94,9 @@
 	clock-frequency = <25000000>;
 };
 
-&ethernet0 {
+&mac {
 	status = "okay";
-	pinctrl-0	= <&ethernet0_mii>;
+	pinctrl-0	= <&ethernet_mii>;
 	pinctrl-names	= "default";
 	phy-mode	= "mii-id";
 	mdio0 {
-- 
1.9.1
