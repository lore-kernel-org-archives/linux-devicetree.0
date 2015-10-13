From: Marek Belisko <marek@goldelico.com>
Subject: [PATCH] ARM: dts: twl4030: Add iio properties for bci subnode
Date: Tue, 13 Oct 2015 22:08:51 +0200
Message-ID: <1444766931-25362-1-git-send-email-marek@goldelico.com>
References: <1443212447-5841-1-git-send-email-marek@goldelico.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443212447-5841-1-git-send-email-marek@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tony@atomide.com, sre@kernel.org, dbaryshkov@gmail.com, dwmw2@infradead.org
Cc: neilb@suse.de, hns@goldelico.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Marek Belisko <marek@goldelico.com>
List-Id: devicetree@vger.kernel.org

Added new iio properties which are required for twl4030-charger driver and
allow to use twl4030-madc indirectly.

Signed-off-by: Marek Belisko <marek@goldelico.com>
---
 arch/arm/boot/dts/twl4030.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/twl4030.dtsi b/arch/arm/boot/dts/twl4030.dtsi
index 36ae916..c8197f2 100644
--- a/arch/arm/boot/dts/twl4030.dtsi
+++ b/arch/arm/boot/dts/twl4030.dtsi
@@ -22,6 +22,8 @@
 	charger: bci {
 		compatible = "ti,twl4030-bci";
 		interrupts = <9>, <2>;
+		io-channels = <&twl_madc 11>;
+		io-channel-name = "vac";
 		bci3v1-supply = <&vusb3v1>;
 	};
 
-- 
1.9.1
