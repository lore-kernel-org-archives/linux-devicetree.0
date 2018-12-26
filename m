From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 01/97] ARM: dts: sun8i: a83t: bananapi-m3: increase vcc-pd voltage to 3.3V
Date: Wed, 26 Dec 2018 17:34:21 -0500
Message-ID: <20181226223557.149329-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Corentin Labbe <clabbe@baylibre.com>, Chen-Yu Tsai <wens@csie.org>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Corentin Labbe <clabbe@baylibre.com>

[ Upstream commit 5f8208f557065163f9a8089ea2ea7888f9d96922 ]

Since commit d7c5f6863550 ("ARM: dts: sun8i: a83t: bananapi-m3: Add
AXP813 regulator nodes") my BPIM3 no longer works at gigabit speed.

With the default setting, dldo3 is regulated at 2.9v which seems
sufficient for the PHY but the aforementioned commit drops it to 2.5V
which is insufficient. Note that this behaviour is random for all BPIM3.
Some work with 2.5V, but some don't.

Finnaly, someone from Bananapi confirmed that this regulator must be set
to 3.3V.

Fixes: d7c5f6863550 ("ARM: dts: sun8i: a83t: bananapi-m3: Add AXP813
		      regulator nodes")
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
[wens@csie.org: Reworked commit message]
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
index c7ce4158d6c8..f250b20af493 100644
--- a/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
+++ b/arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts
@@ -309,8 +309,8 @@
 
 &reg_dldo3 {
 	regulator-always-on;
-	regulator-min-microvolt = <2500000>;
-	regulator-max-microvolt = <2500000>;
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
 	regulator-name = "vcc-pd";
 };
 
-- 
2.19.1
