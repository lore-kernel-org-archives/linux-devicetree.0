From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.14 01/43] ARM: dts: bcm283x: Fix hdmi hpd gpio pull
Date: Mon, 22 Apr 2019 15:46:45 -0400
Message-ID: <20190422194727.12495-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Helen Koike <helen.koike@collabora.com>, Eric Anholt <eric@anholt.net>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Helen Koike <helen.koike@collabora.com>

[ Upstream commit 544e784188f1dd7c797c70b213385e67d92005b6 ]

Raspberry pi board model B revison 2 have the hot plug detector gpio
active high (and not low as it was in the dts).

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Fixes: 49ac67e0c39c ("ARM: bcm2835: Add VC4 to the device tree.")
Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Sasha Levin (Microsoft) <sashal@kernel.org>
---
 arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts b/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
index 4bc70efe43d6..3178a5664942 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
@@ -93,7 +93,7 @@
 };
 
 &hdmi {
-	hpd-gpios = <&gpio 46 GPIO_ACTIVE_LOW>;
+	hpd-gpios = <&gpio 46 GPIO_ACTIVE_HIGH>;
 };
 
 &uart0 {
-- 
2.19.1
