From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v2 2/2] dt-bindings: sound: add devicetree document for rt5616
Date: Tue, 22 Dec 2015 13:45:03 +0800
Message-ID: <1450763103-21073-2-git-send-email-wxt@rock-chips.com>
References: <1450763103-21073-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450763103-21073-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.or, heiko@sntech.de, bardliao@realtek.com, Caesar Wang <wxt@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Add the description for rt5616 codec.

Signed-off-by: Caesar Wang <wxt@rock-chips.com>

---

Changes in v2:
- As Frank comments, rt5616@1b to instead of rt5616.
- Update the Pins device from Bard.

Changes in v1:
- As Heiko comments, remove the not exist option properties.

 Documentation/devicetree/bindings/sound/rt5616.txt | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/rt5616.txt

diff --git a/Documentation/devicetree/bindings/sound/rt5616.txt b/Documentation/devicetree/bindings/sound/rt5616.txt
new file mode 100644
index 0000000..efc48c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rt5616.txt
@@ -0,0 +1,26 @@
+RT5616 audio CODEC
+
+This device supports I2C only.
+
+Required properties:
+
+- compatible : "realtek,rt5616".
+
+- reg : The I2C address of the device.
+
+Pins on the device (for linking into audio routes) for RT5616:
+
+  * IN1P
+  * IN2P
+  * IN2N
+  * LOUTL
+  * LOUTR
+  * HPOL
+  * HPOR
+
+Example:
+
+codec: rt5616@1b {
+	compatible = "realtek,rt5616";
+	reg = <0x1b>;
+};
-- 
1.9.1
