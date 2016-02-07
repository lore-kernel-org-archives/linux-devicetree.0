From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH 1/1] ARM: kirkwood-ds112.dts: use unique machine name
Date: Sun,  7 Feb 2016 19:34:26 +0100
Message-ID: <1454870066-3353-1-git-send-email-xypron.glpk@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Ben Peddell <klightspeed@killerwolves.net>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>
List-Id: devicetree@vger.kernel.org

Downstream packages like Debian flash-kernel use
/proc/device-tree/model
to determine which dtb file to install.

Hence each dts in the Linux kernel should provide a unique model
identifier.

Commit 2d0a7addbd10 ("ARM: Kirkwood: Add support for many Synology NAS
devices") created the new files kirkwood-ds111.dts and kirkwood-ds112.dts
using the same model identifier.

This patch provides a unique model identifier for the
Synology DiskStation DS112.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
---
 arch/arm/boot/dts/kirkwood-ds112.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/kirkwood-ds112.dts b/arch/arm/boot/dts/kirkwood-ds112.dts
index bf4143c..b84af3d 100644
--- a/arch/arm/boot/dts/kirkwood-ds112.dts
+++ b/arch/arm/boot/dts/kirkwood-ds112.dts
@@ -14,7 +14,7 @@
 #include "kirkwood-synology.dtsi"
 
 / {
-	model = "Synology DS111";
+	model = "Synology DS112";
 	compatible = "synology,ds111", "marvell,kirkwood";
 
 	memory {
-- 
2.1.4
