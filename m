From: Anand Moon <linux.amoon@gmail.com>
Subject: [RFCv1 5/5] arm64/ARM: configs: Change CONFIG_PWM_MESON from m to y
Date: Mon,  7 Oct 2019 13:16:49 +0000
Message-ID: <20191007131649.1768-6-linux.amoon@gmail.com>
References: <20191007131649.1768-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007131649.1768-1-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Using microSD card we cannot get the mainline kernel to boot
using mainline u-boot it fails with below logs.
Build PWM_MESSON as build-in solve the issue.

[    1.569240] meson-gx-mmc ffe05000.sd: Got CD GPIO
[    1.599227] pwm-regulator regulator-vddcpu-a: Failed to get PWM: -517
[    1.600605] pwm-regulator regulator-vddcpu-b: Failed to get PWM: -517
[    1.607166] pwm-regulator regulator-vddcpu-a: Failed to get PWM: -517
[    1.613273] pwm-regulator regulator-vddcpu-b: Failed to get PWM: -517
[    1.619931] hctosys: unable to open rtc device (rtc0)

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Odroid N2 Schematics says "GPIOC_6 should not pulled low if GPIOC is not
work as SDCARD"
Is their any other approch to help resolve this issue.

Boot log failed with cold boot:
[0] https://pastebin.com/cEtWq2iX
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c9a867ac32d4..72f6a7dca0d6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -774,7 +774,7 @@ CONFIG_MPL3115=m
 CONFIG_PWM=y
 CONFIG_PWM_BCM2835=m
 CONFIG_PWM_CROS_EC=m
-CONFIG_PWM_MESON=m
+CONFIG_PWM_MESON=y
 CONFIG_PWM_RCAR=m
 CONFIG_PWM_ROCKCHIP=y
 CONFIG_PWM_SAMSUNG=y
-- 
2.23.0
