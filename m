From: Stefan Monnier <monnier@iro.umontreal.ca>
Subject: [PATCH 2/2] ARM: dts: sun7i: Enable audio codec on BananaPi
Date: Mon, 23 Nov 2015 13:50:17 -0500
Message-ID: <1448304618-3488-2-git-send-email-monnier@iro.umontreal.ca>
References: <1448304618-3488-1-git-send-email-monnier@iro.umontreal.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448304618-3488-1-git-send-email-monnier@iro.umontreal.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Cc: Stefan Monnier <monnier@iro.umontreal.ca>
List-Id: devicetree@vger.kernel.org

Enable the on-chip audio codec

Signed-off-by: Stefan Monnier <monnier@iro.umontreal.ca>
---
 arch/arm/boot/dts/sun7i-a20-bananapi.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
index fd7594f..67c8a76 100644
--- a/arch/arm/boot/dts/sun7i-a20-bananapi.dts
+++ b/arch/arm/boot/dts/sun7i-a20-bananapi.dts
@@ -92,6 +92,10 @@
 	status = "okay";
 };
 
+&codec {
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 	operating-points = <
-- 
2.1.4
