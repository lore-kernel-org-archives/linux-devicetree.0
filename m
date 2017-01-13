From: David Lechner <david@lechnology.com>
Subject: [PATCH v4 3/4] dt-bindings: add "microchip,24c128" compatible string
Date: Fri, 13 Jan 2017 13:03:41 -0600
Message-ID: <1484334222-14223-4-git-send-email-david@lechnology.com>
References: <1484334222-14223-1-git-send-email-david@lechnology.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484334222-14223-1-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds "microchip,24c128" to the list of compatible strings for i2c
eeproms.

Signed-off-by: David Lechner <david@lechnology.com>
---
 Documentation/devicetree/bindings/eeprom/eeprom.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/eeprom/eeprom.txt b/Documentation/devicetree/bindings/eeprom/eeprom.txt
index 735bc94..5696eb5 100644
--- a/Documentation/devicetree/bindings/eeprom/eeprom.txt
+++ b/Documentation/devicetree/bindings/eeprom/eeprom.txt
@@ -10,6 +10,8 @@ Required properties:
 
 	"catalyst,24c32"
 
+	"microchip,24c128"
+
 	"ramtron,24c64"
 
 	"renesas,r1ex24002"
-- 
2.7.4
