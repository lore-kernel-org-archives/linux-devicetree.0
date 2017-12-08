From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?=
        <mylene.josserand@free-electrons.com>
Subject: [PATCH 2/5] arm: dts: sun8i: a83t: Add I2C0 pins group
Date: Fri,  8 Dec 2017 22:54:16 +0100
Message-ID: <20171208215419.30396-3-mylene.josserand@free-electrons.com>
References: <20171208215419.30396-1-mylene.josserand@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20171208215419.30396-1-mylene.josserand@free-electrons.com>
Sender: linux-input-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, maxime.ripard@free-electrons.com, wens@csie.org, dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Cc: simon.budig@kernelconcepts.de, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mylene.josserand@free-electrons.com, thomas.petazzoni@free-electrons.com
List-Id: devicetree@vger.kernel.org

Add pins group to configure it as I2C0.

Signed-off-by: Mylène Josserand <mylene.josserand@free-electrons.com>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 848cf3f19962..3bce6bd3dc79 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -347,6 +347,11 @@
 			#interrupt-cells = <3>;
 			#gpio-cells = <3>;
 
+			i2c0_pins: i2c0-pins {
+				pins = "PH0", "PH1";
+				function = "i2c0";
+			};
+
 			mmc0_pins: mmc0-pins {
 				pins = "PF0", "PF1", "PF2",
 				       "PF3", "PF4", "PF5";
-- 
2.11.0

