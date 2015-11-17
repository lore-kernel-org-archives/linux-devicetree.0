From: Cory Tusar <cory.tusar@pid1solutions.com>
Subject: [PATCH 4/7] misc: eeprom: 93xx46: Add DT binding for Atmel AT93C46D devices.
Date: Mon, 16 Nov 2015 23:16:33 -0500
Message-ID: <1447733796-15546-5-git-send-email-cory.tusar@pid1solutions.com>
References: <1447733796-15546-1-git-send-email-cory.tusar@pid1solutions.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447733796-15546-1-git-send-email-cory.tusar@pid1solutions.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, agust@denx.de, gregkh@linuxfoundation.org
Cc: jic23@kernel.org, vz@mleia.com, broonie@kernel.org, afd@ti.com, andrew@lunn.ch, Chris.Healy@zii.aero, Keith.Vennel@zii.aero, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Cory Tusar <cory.tusar@pid1solutions.com>
List-Id: devicetree@vger.kernel.org

This commit adds a compatible string to the eeprom_93xx46 devicetree
bindings in support of Atmel AT93C46D devices.

Signed-off-by: Cory Tusar <cory.tusar@pid1solutions.com>
---
 Documentation/devicetree/bindings/misc/eeprom-93xx46.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
index ba493a8..34a0cc2 100644
--- a/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
+++ b/Documentation/devicetree/bindings/misc/eeprom-93xx46.txt
@@ -1,7 +1,7 @@
 EEPROMs (SPI) compatible with Microchip Technology 93xx46 family.
 
 Required properties:
-- compatible : "eeprom-93xx46"
+- compatible : "eeprom-93xx46", "atmel,at93c46d"
 - data-size : number of data bits per word (either 8 or 16)
 
 Optional properties:
-- 
2.4.10
