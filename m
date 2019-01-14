From: <Eugen.Hristev@microchip.com>
Subject: [PATCH v2 2/3] dt-bindings: drm/panel: simple: add support for PDA
 91-00156-A0
Date: Mon, 14 Jan 2019 09:43:28 +0000
Message-ID: <1547458584-29548-3-git-send-email-eugen.hristev@microchip.com>
References: <1547458584-29548-1-git-send-email-eugen.hristev@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547458584-29548-1-git-send-email-eugen.hristev@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, thierry.reding@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Nicolas.Ferre@microchip.com
Cc: Eugen.Hristev@microchip.com, Cristian.Birsan@microchip.com
List-Id: devicetree@vger.kernel.org

From: Cristian Birsan <cristian.birsan@microchip.com>

PDA 91-00156-A0 5.0 is a 5.0" WVGA TFT LCD panel.
This panel with backlight is found in PDA 5" LCD screen (TM5000 series or
AC320005-5).
Adding Device Tree bindings for this panel.

Signed-off-by: Cristian Birsan <cristian.birsan@microchip.com>
[eugen.hristev@microchip.com]: specified backlight and supply bindings
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v2:
- added binding explanations for required properties from simple-panel:
backlight and power supply which are mandatory

 .../devicetree/bindings/display/panel/pda,91-00156-a0.txt  | 14 ++++++++++=
++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/pda,91-=
00156-a0.txt

diff --git a/Documentation/devicetree/bindings/display/panel/pda,91-00156-a=
0.txt b/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.txt
new file mode 100644
index 0000000..1639fb1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.txt
@@ -0,0 +1,14 @@
+PDA 91-00156-A0 5.0" WVGA TFT LCD panel
+
+Required properties:
+- compatible: should be "pda,91-00156-a0"
+- power-supply: this panel requires a single power supply. A phandle to a
+regulator needs to be specified here. Compatible with panel-common binding=
 which
+is specified in the panel-common.txt in this directory.
+- backlight: this panel's backlight is controlled by an external backlight
+controller. A phandle to this controller needs to be specified here.
+Compatible with panel-common binding which is specified in the panel-commo=
n.txt
+in this directory.
+
+This binding is compatible with the simple-panel binding, which is specifi=
ed
+in simple-panel.txt in this directory.
--=20
2.7.4
