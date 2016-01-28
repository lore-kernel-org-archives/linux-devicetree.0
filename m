From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v4 6/9] ASoC: rt5616: add mclk property for rt5616 document
Date: Thu, 28 Jan 2016 16:43:35 +0800
Message-ID: <1453970618-4383-7-git-send-email-wxt@rock-chips.com>
References: <1453970618-4383-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453970618-4383-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org
Cc: hl@rock-chips.com, jay.xu@rock-chips.com, jeffy.chen@rock-chips.com, linux-rockchip@lists.infradead.org, keescook@google.com, cf@rock-chips.com, sonnyrao@chromium.org, leozwang@google.com, Caesar Wang <wxt@rock-chips.com>, devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

This patch add the mclk property for the CODEC driver,
since sometime the CODEC driver needs the clock enabled.

The system clock of ALC5616 can be selected from MCLK,
That's also make as the codec master clock provider,

Signed-off-by: Caesar Wang <wxt@rock-chips.com>

---

Changes in v4:
- Add this patch included in kylin series patches.

 Documentation/devicetree/bindings/sound/rt5616.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rt5616.txt b/Documentation/devicetree/bindings/sound/rt5616.txt
index efc48c6..e410858 100644
--- a/Documentation/devicetree/bindings/sound/rt5616.txt
+++ b/Documentation/devicetree/bindings/sound/rt5616.txt
@@ -8,6 +8,12 @@ Required properties:
 
 - reg : The I2C address of the device.
 
+Optional properties:
+
+- clocks: The phandle of the master clock to the CODEC.
+
+- clock-names: Should be "mclk".
+
 Pins on the device (for linking into audio routes) for RT5616:
 
   * IN1P
-- 
1.9.1
