Return-Path: <SRS0=HRCn=TA=renesas.com=prvs=40235708d9=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 3/7] dt-bindings: i2c: riic: document r7s9210 support
Date: Tue, 30 Apr 2019 08:23:05 -0500
Message-ID: <20190430132309.12473-4-chris.brandt@renesas.com>
In-Reply-To: <20190430132309.12473-1-chris.brandt@renesas.com>
References: <20190430132309.12473-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark
Cc: devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Document support for the R7S9210 (RZ/A2) SoC. Also explicitly document
bindings for the R7S72100 (RZ/A1) SoC.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 Documentation/devicetree/bindings/i2c/i2c-riic.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-riic.txt b/Documentation/devicetree/bindings/i2c/i2c-riic.txt
index 0bcc4716c319..e26fe3ad86a9 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-riic.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-riic.txt
@@ -1,7 +1,10 @@
 Device tree configuration for Renesas RIIC driver
 
 Required properties:
-- compatible      : "renesas,riic-<soctype>". "renesas,riic-rz" as fallback
+- compatible      :
+	"renesas,riic-r7s72100" if the device is a part of a R7S72100 SoC.
+	"renesas,riic-r7s9210" if the device is a part of a R7S9210 SoC.
+	"renesas,riic-rz" for a generic RZ/A compatible device.
 - reg             : address start and address range size of device
 - interrupts      : 8 interrupts (TEI, RI, TI, SPI, STI, NAKI, ALI, TMOI)
 - clock-frequency : frequency of bus clock in Hz
-- 
2.16.1
