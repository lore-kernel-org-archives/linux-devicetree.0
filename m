From: huang lin <hl@rock-chips.com>
Subject: [PATCH 1/2] Documentation: devicetree: add backlight-boot-off property in pwm-backlight
Date: Thu, 26 Feb 2015 11:12:45 +0800
Message-ID: <1424920366-7626-2-git-send-email-hl@rock-chips.com>
References: <1424920366-7626-1-git-send-email-hl@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424920366-7626-1-git-send-email-hl@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: djkurtz@chromium.org
Cc: linux-rockchip@lists.infradead.org, huang lin <hl@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the backlight-boot-ff property, so we can keeping the backlight
disabled at boot until it is enabled implicitly by a panel driver,
or explicitly by userspace.

Signed-off-by: huang lin <hl@rock-chips.com>

---

 Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt b/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt
index 764db86..28b0b4d 100644
--- a/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt
+++ b/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt
@@ -17,6 +17,7 @@ Optional properties:
                "pwms" property (see PWM binding[0])
   - enable-gpios: contains a single GPIO specifier for the GPIO which enables
                   and disables the backlight (see GPIO binding[1])
+  - backlight-boot-off: turn off backlight when pwm backlight probe
 
 [0]: Documentation/devicetree/bindings/pwm/pwm.txt
 [1]: Documentation/devicetree/bindings/gpio/gpio.txt
-- 
1.9.1
