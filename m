From: Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v4 2/3] arm64: allwinner: axp803: Add drivevbus regulator
Date: Fri, 12 Jan 2018 12:00:17 +0530
Message-ID: <1515738618-3617-2-git-send-email-jagan@amarulasolutions.com>
References: <1515738618-3617-1-git-send-email-jagan@amarulasolutions.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1515738618-3617-1-git-send-email-jagan@amarulasolutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>
List-Id: devicetree@vger.kernel.org

Add reg_drivevbus regualtor for boards which are using
external regulator to drive the OTG VBus through N_VBUSEN
PMIC pin.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v4:
- rebase on master
Changes for v3:
- none

 arch/arm64/boot/dts/allwinner/axp803.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/axp803.dtsi b/arch/arm64/boot/dts/allwinner/axp803.dtsi
index ff8af52..e5eae8b 100644
--- a/arch/arm64/boot/dts/allwinner/axp803.dtsi
+++ b/arch/arm64/boot/dts/allwinner/axp803.dtsi
@@ -146,5 +146,10 @@
 			regulator-max-microvolt = <3000000>;
 			regulator-name = "rtc-ldo";
 		};
+
+		reg_drivevbus: drivevbus {
+			regulator-name = "drivevbus";
+			status = "disabled";
+		};
 	};
 };
-- 
2.7.4
