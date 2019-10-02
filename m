From: <Eugen.Hristev@microchip.com>
Subject: [PATCH 1/3] dt-bindings: watchdog: sam9x60_wdt: add bindings
Date: Wed, 2 Oct 2019 07:35:23 +0000
Message-ID: <1570001371-8174-1-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.or
Cc: Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Eugen.Hristev@microchip.com
List-Id: devicetree@vger.kernel.org

From: Eugen Hristev <eugen.hristev@microchip.com>

Add bindings for Microchip SAM9X60 Watchdog Timer

It has the same bindings as
Documentation/devicetree/bindings/watchdog/atmel-sama5d4-wdt.txt
except the compatible.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 .../devicetree/bindings/watchdog/sam9x60-wdt.txt   | 34 ++++++++++++++++++=
++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/sam9x60-wdt.=
txt

diff --git a/Documentation/devicetree/bindings/watchdog/sam9x60-wdt.txt b/D=
ocumentation/devicetree/bindings/watchdog/sam9x60-wdt.txt
new file mode 100644
index 00000000..74b4e2d
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/sam9x60-wdt.txt
@@ -0,0 +1,34 @@
+* Microchip SAM9X60 Watchdog Timer (WDT) Controller
+
+Required properties:
+- compatible: "microchip,sam9x60-wdt"
+- reg: base physical address and length of memory mapped region.
+
+Optional properties:
+- timeout-sec: watchdog timeout value (in seconds).
+- interrupts: interrupt number to the CPU.
+- atmel,watchdog-type: should be "hardware" or "software".
+	"hardware": enable watchdog fault reset. A watchdog fault triggers
+		    watchdog reset.
+	"software": enable watchdog fault interrupt. A watchdog fault asserts
+		    watchdog interrupt.
+- atmel,idle-halt: present if you want to stop the watchdog when the CPU i=
s
+		   in idle state.
+	CAUTION: This property should be used with care, it actually makes the
+	watchdog not counting when the CPU is in idle state, therefore the
+	watchdog reset time depends on mean CPU usage and will not reset at all
+	if the CPU stop working while it is in idle state, which is probably
+	not what you want.
+- atmel,dbg-halt: present if you want to stop the watchdog when the CPU is
+		  in debug state.
+
+Example:
+	watchdog@ffffff80 {
+		compatible =3D "microchip,sam9x60-wdt";
+		reg =3D <0xffffff80 0x24>;
+		interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH 5>;
+		timeout-sec =3D <10>;
+		atmel,watchdog-type =3D "hardware";
+		atmel,dbg-halt;
+		atmel,idle-halt;
+	};
--=20
2.7.4
