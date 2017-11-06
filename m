From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v2 1/4] arm64: defconfig: enable new trigger modes for leds
Date: Mon,  6 Nov 2017 12:38:13 +0530
Message-ID: <266d889176a4f39617abbfb08177d4cbed89cdf2.1509951550.git.amit.kucheria@linaro.org>
References: <cover.1509951550.git.amit.kucheria@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <cover.1509951550.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1509951550.git.amit.kucheria@linaro.org>
References: <cover.1509951550.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: amit.kucheria@linaro.org, linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, xuwei5@hisilicon.com, andy.gross@linaro.org, manivannan.sadhasivam@linaro.org, devicetree@vger.kernel.org, timur@codeaurora.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: devicetree@vger.kernel.org

Most development boards and devices have one or more LEDs. It is useful
during debugging if they can be wired to show different behaviours such as
disk or cpu activity or a load-average dependent heartbeat. Enable panic
and disk activity triggers so they can be tied to LED activity during
debugging as well.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 34480e9..4ed357f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -460,6 +460,8 @@ CONFIG_LEDS_SYSCON=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_LEDS_TRIGGER_CPU=y
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
+CONFIG_LEDS_TRIGGER_PANIC=y
+CONFIG_LEDS_TRIGGER_DISK=y
 CONFIG_EDAC=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_MAX77686=y
-- 
2.7.4
