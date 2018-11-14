From: Janek Kotas <jank@cadence.com>
Subject: [PATCH 1/2] dt-bindings: clk: Add bindings for Fixed MMIO clock
Date: Wed, 14 Nov 2018 15:24:21 +0000
Message-ID: <1B94C733-F941-4403-9498-4BBB35B25345@global.cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <D3BF9F34C8A14849A087F9E343802EB8@namprd07.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This patch adds a DT binding documentation for Fixed
Memory Mapped IO clocks.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 .../devicetree/bindings/clock/fixed-mmio-clock.txt | 22 ++++++++++++++++++=
++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/fixed-mmio-cloc=
k.txt

diff --git a/Documentation/devicetree/bindings/clock/fixed-mmio-clock.txt b=
/Documentation/devicetree/bindings/clock/fixed-mmio-clock.txt
new file mode 100644
index 0000000000..6441821688
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/fixed-mmio-clock.txt
@@ -0,0 +1,22 @@
+Binding for simple memory mapped io fixed-rate clock sources.
+The driver reads a clock frequency value from a single 32-bit memory mappe=
d
+register and registers it as a fixed rate clock.
+
+This binding uses the common clock binding[1].
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+Required properties:
+- compatible : shall be "fixed-mmio-clock".
+- #clock-cells : from common clock binding; shall be set to 0.
+- reg : Address and length of the clock value register set.
+
+Optional properties:
+- clock-output-names : From common clock binding.
+
+Example:
+sysclock: sysclock@fd020004 {
+	#clock-cells =3D <0>;
+	compatible =3D "fixed-mmio-clock";
+	reg =3D <0xfd020004 0x4>;
+};
--=20
2.15.0
