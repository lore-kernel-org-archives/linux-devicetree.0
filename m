From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v4 15/15] dt-bindings: Add documentation for Rockchip dw-hdmi-audio
Date: Sat, 28 Feb 2015 22:07:53 -0500
Message-ID: <1425179273-2881-1-git-send-email-ykk@rock-chips.com>
References: <1425175834-24661-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425175834-24661-1-git-send-email-ykk@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, djkurtz@chromium.org, dianders@chromium.org, linux-rockchip@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Yakir Yang <ykk@rock-chips.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mmind00@googlemail.com, marcheu@chromium.org, mark.yao@rock-chips.com
List-Id: devicetree@vger.kernel.org

Required properties:
- compatible: platform specific
- i2s-controller: the i2s controller device node

Signed-off-by: Yakir Yang <ykk@rock-chips.com>
---
Changes in v4: None
Changes in v3:
- modify cpu-of-node to i2s-controller

Changes in v2:
- remove codec-name and codec-dai-name
- rename rockchip,rockchip-hdmi-audio.txt to rockchip,rockchip-dw-hdmi-audio.txt

 .../bindings/sound/rockchip,rockchip-dw-hdmi-audio.txt       | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rockchip-dw-hdmi-audio.txt

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rockchip-dw-hdmi-audio.txt b/Documentation/devicetree/bindings/sound/rockchip,rockchip-dw-hdmi-audio.txt
new file mode 100644
index 0000000..f0d23c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rockchip-dw-hdmi-audio.txt
@@ -0,0 +1,12 @@
+Rockchip hdmi audio bindings
+
+Required properties:
+- compatible: platform specific
+- i2s-controller: the i2s controller device node
+
+Example:
+
+sound {
+	compatible = "rockchip,rk3288-hdmi-audio";
+	i2s-controller = <&i2s>;
+};
-- 
2.1.2
