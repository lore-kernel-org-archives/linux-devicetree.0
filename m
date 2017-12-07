From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v4 13/15] ARM: dts: sun8i: a83t: Add the PWM pin group
Date: Thu,  7 Dec 2017 16:58:58 +0100
Message-ID: <b58547cd03f88c65162f362361023b44a4b6fc89.1512662253.git-series.maxime.ripard@free-electrons.com>
References: <cover.e46a07c0e181d735c807dc94fe0ce0ea013788be.1512662253.git-series.maxime.ripard@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.e46a07c0e181d735c807dc94fe0ce0ea013788be.1512662253.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.e46a07c0e181d735c807dc94fe0ce0ea013788be.1512662253.git-series.maxime.ripard@free-electrons.com>
References: <cover.e46a07c0e181d735c807dc94fe0ce0ea013788be.1512662253.git-series.maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, plaes@plaes.org, icenowy@aosc.io, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, jernej.skrabec@siol.net, devicetree@vger.kernel.org, thierry.reding@gmail.com
List-Id: devicetree@vger.kernel.org

The A83T has a PWM that can be output from the SoC. Let's add a pinctrl
group for it.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index e200df5a9058..a37517d4472a 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -446,6 +446,11 @@
 				bias-pull-up;
 			};
 
+			pwm_pin: pwm-pin {
+				pins = "PD28";
+				function = "pwm";
+			};
+
 			spdif_tx_pin: spdif-tx-pin {
 				pins = "PE18";
 				function = "spdif";
-- 
git-series 0.9.1
