From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.20 02/81] ARM: dts: omap4-droid4: Fix typo in cpcap IRQ flags
Date: Thu, 28 Feb 2019 10:06:54 -0500
Message-ID: <20190228150813.10256-2-sashal@kernel.org>
References: <20190228150813.10256-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190228150813.10256-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Tony Lindgren <tony@atomide.com>, Sebastian Reichel <sre@kernel.org>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Tony Lindgren <tony@atomide.com>

[ Upstream commit ef4a55b9197a8f844ea0663138e902dcce3e2f36 ]

We're now getting the following error:

genirq: Setting trigger mode 1 for irq 230 failed
(regmap_irq_set_type+0x0/0x15c)
cpcap-usb-phy cpcap-usb-phy.0: could not get irq dp: -524

Cc: Sebastian Reichel <sre@kernel.org>
Reported-by: Pavel Machek <pavel@ucw.cz>
Tested-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
index ddc7a7bb33c0d..f57acf8f66b95 100644
--- a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
@@ -105,7 +105,7 @@
 			interrupts-extended = <
 				&cpcap 15 0 &cpcap 14 0 &cpcap 28 0 &cpcap 19 0
 				&cpcap 18 0 &cpcap 17 0 &cpcap 16 0 &cpcap 49 0
-				&cpcap 48 1
+				&cpcap 48 0
 			>;
 			interrupt-names =
 				"id_ground", "id_float", "se0conn", "vbusvld",
-- 
2.19.1
