From: Anand Moon <linux.amoon@gmail.com>
Subject: [RFCv1 0/5] Odroid N2 failes to boot using upstream kernel & u-boot
Date: Mon,  7 Oct 2019 13:16:44 +0000
Message-ID: <20191007131649.1768-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

We am trying to build the upstream u-boot and upstream kernel,
but it fails to pass the initialization of PWM_MESON driver.
So these patches help boot the kernel on microSD card.

Patchs based on Linux 5.4-rc2

Boot log failed are shown below.
[0] https://pastebin.com/cEtWq2iX

[    1.569240] meson-gx-mmc ffe05000.sd: Got CD GPIO
[    1.599227] pwm-regulator regulator-vddcpu-a: Failed to get PWM: -517
[    1.600605] pwm-regulator regulator-vddcpu-b: Failed to get PWM: -517
[    1.607166] pwm-regulator regulator-vddcpu-a: Failed to get PWM: -517
[    1.613273] pwm-regulator regulator-vddcpu-b: Failed to get PWM: -517
[    1.619931] hctosys: unable to open rtc device (rtc0)

My guess their is not much issue with eMMC module, if their is
other approach to resolve this issue, I will give this a try.

Best Regards
-Anand

Anand Moon (5):
  arm64: dts: meson: Add missing 5V_EN gpio signal for VCC5V regulator
  arm64: dts: meson: Add missing pwm control gpio signal for
    pwm-regulator
  arm64: dts: meson: Add missing regulator linked to VDDAO_3V3 regulator
    to FLASH_VDD
  arm64: dts: meson: Add missing regulator linked to VCCV5 regulator to
    VDDIO_C/TF_IO
  arm64/ARM: configs: Change CONFIG_PWM_MESON from m to y

 .../arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 13 +++++++++++++
 arch/arm64/configs/defconfig                        |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.23.0
