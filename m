From: <Andrei.Stefanescu@microchip.com>
Subject: [PATCH 1/2] regulator: dt-bindings: add regulator-state-standby
 bindings
Date: Tue, 13 Nov 2018 14:47:33 +0000
Message-ID: <1542120469-15450-2-git-send-email-andrei.stefanescu@microchip.com>
References: <1542120469-15450-1-git-send-email-andrei.stefanescu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542120469-15450-1-git-send-email-andrei.stefanescu@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: Nicolas.Ferre@microchip.com, Cristian.Birsan@microchip.com, Claudiu.Beznea@microchip.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrei.Stefanescu@microchip.com
List-Id: devicetree@vger.kernel.org

For state-mem and state-disk regulators can have
various parameters applied such as enabled/disabled,
current mode, voltage etc.

This patch adds documentation on how to set these parameters
in the device tree for the standby state.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@microchip.com>
---
 Documentation/devicetree/bindings/regulator/regulator.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.txt b/Do=
cumentation/devicetree/bindings/regulator/regulator.txt
index 0c3a243..0a3f087 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/regulator.txt
@@ -33,13 +33,16 @@ Optional properties:
   decreases of any level. This is useful for regulators with exponential
   voltage changes.
 - regulator-soft-start: Enable soft start so that voltage ramps slowly
+- regulator-state-standby sub-root node for Standby mode
+  : equivalent with standby Linux sleep state, which provides energy savin=
gs
+  with a relatively quick transition back time.
 - regulator-state-mem sub-root node for Suspend-to-RAM mode
   : suspend to memory, the device goes to sleep, but all data stored in me=
mory,
   only some external interrupt can wake the device.
 - regulator-state-disk sub-root node for Suspend-to-DISK mode
   : suspend to disk, this state operates similarly to Suspend-to-RAM,
   but includes a final step of writing memory contents to disk.
-- regulator-state-[mem/disk] node has following common properties:
+- regulator-state-[mem/disk/standby] node has following common properties:
 	- regulator-on-in-suspend: regulator should be on in suspend state.
 	- regulator-off-in-suspend: regulator should be off in suspend state.
 	- regulator-suspend-min-microvolt: minimum voltage may be set in
--=20
2.7.4
