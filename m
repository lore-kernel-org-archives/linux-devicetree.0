Return-Path: <moinejf@free.fr>
Message-Id: <54cb2c84.2516460a.4687.ffffdc69SMTPIN_ADDED_MISSING@mx.google.com>
From: Jean-Francois Moine <moinejf@free.fr>
Date: Fri, 30 Jan 2015 07:06:31 +0100
Subject: [PATCH] ARM: dts: mvebu: add ethernet to the cm-a510 board
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This patch enables the ethernet device by default, permitting CM-A510
boards to access the network when an ethernet connector is present.

Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
Tested-by: Gabriel Dobato <dobatog@gmail.com>
---
 arch/arm/boot/dts/dove-cm-a510.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/dove-cm-a510.dts b/arch/arm/boot/dts/dove-cm-a510.dts
index 50c0d69..404e983 100644
--- a/arch/arm/boot/dts/dove-cm-a510.dts
+++ b/arch/arm/boot/dts/dove-cm-a510.dts
@@ -21,6 +21,8 @@
 &sdio0 { status = "okay"; };
 &sdio1 { status = "okay"; };
 &sata0 { status = "okay"; };
+&eth { status = "okay"; };
+&mdio { status ="okay";};
 
 &spi0 {
 	status = "okay";
-- 
2.1.4
