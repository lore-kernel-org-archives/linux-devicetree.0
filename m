From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.2 33/76] ARM: dts: imx6ul: fix clock frequency property name of I2C buses
Date: Fri,  2 Aug 2019 09:19:07 -0400
Message-ID: <20190802131951.11600-33-sashal@kernel.org>
References: <20190802131951.11600-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190802131951.11600-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>, Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Sébastien Szymanski <sebastien.szymanski@armadeus.com>

[ Upstream commit 2ca99396333999b9b5c5b91b36cbccacfe571aaf ]

A few boards set clock frequency of their I2C buses with
"clock_frequency" property. The right property is "clock-frequency".

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/imx6ul-14x14-evk.dtsi  | 2 +-
 arch/arm/boot/dts/imx6ul-geam.dts        | 2 +-
 arch/arm/boot/dts/imx6ul-isiot.dtsi      | 2 +-
 arch/arm/boot/dts/imx6ul-pico-hobbit.dts | 2 +-
 arch/arm/boot/dts/imx6ul-pico-pi.dts     | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi b/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
index 9207d5d071f11..d556f7c541ce6 100644
--- a/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
+++ b/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
@@ -112,7 +112,7 @@
 };
 
 &i2c2 {
-	clock_frequency = <100000>;
+	clock-frequency = <100000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/imx6ul-geam.dts b/arch/arm/boot/dts/imx6ul-geam.dts
index bc77f26a2f1de..6157a058feec9 100644
--- a/arch/arm/boot/dts/imx6ul-geam.dts
+++ b/arch/arm/boot/dts/imx6ul-geam.dts
@@ -156,7 +156,7 @@
 };
 
 &i2c2 {
-	clock_frequency = <100000>;
+	clock-frequency = <100000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/imx6ul-isiot.dtsi b/arch/arm/boot/dts/imx6ul-isiot.dtsi
index 213e802bf35c5..23e6e2e7ace9d 100644
--- a/arch/arm/boot/dts/imx6ul-isiot.dtsi
+++ b/arch/arm/boot/dts/imx6ul-isiot.dtsi
@@ -148,7 +148,7 @@
 };
 
 &i2c2 {
-	clock_frequency = <100000>;
+	clock-frequency = <100000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/imx6ul-pico-hobbit.dts b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
index 39eeeddac39e3..09f7ffa9ad8c4 100644
--- a/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
+++ b/arch/arm/boot/dts/imx6ul-pico-hobbit.dts
@@ -43,7 +43,7 @@
 };
 
 &i2c2 {
-	clock_frequency = <100000>;
+	clock-frequency = <100000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/imx6ul-pico-pi.dts b/arch/arm/boot/dts/imx6ul-pico-pi.dts
index de07357b27fc2..6cd7d5877d20c 100644
--- a/arch/arm/boot/dts/imx6ul-pico-pi.dts
+++ b/arch/arm/boot/dts/imx6ul-pico-pi.dts
@@ -43,7 +43,7 @@
 };
 
 &i2c2 {
-	clock_frequency = <100000>;
+	clock-frequency = <100000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
@@ -58,7 +58,7 @@
 };
 
 &i2c3 {
-	clock_frequency = <100000>;
+	clock-frequency = <100000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
-- 
2.20.1
