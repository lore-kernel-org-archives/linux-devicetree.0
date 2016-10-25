From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 07/10] ARM: configs: stm32: enable IIO ADC driver
Date: Tue, 25 Oct 2016 18:25:19 +0200
Message-ID: <1477412722-24061-8-git-send-email-fabrice.gasnier@st.com>
References: <1477412722-24061-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477412722-24061-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, linux@armlinux.org.uk, robh+dt@kernel.org, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, lars@metafoo.de, knaack.h@gmx.de, pmeerw@pmeerw.net, fabrice.gasnier@st.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 arch/arm/configs/stm32_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/stm32_defconfig b/arch/arm/configs/stm32_defconfig
index 1e5ec2a..5a5f50c 100644
--- a/arch/arm/configs/stm32_defconfig
+++ b/arch/arm/configs/stm32_defconfig
@@ -57,6 +57,8 @@ CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_DMADEVICES=y
 CONFIG_STM32_DMA=y
+CONFIG_IIO=y
+CONFIG_STM32F4_ADC=y
 # CONFIG_FILE_LOCKING is not set
 # CONFIG_DNOTIFY is not set
 # CONFIG_INOTIFY_USER is not set
-- 
1.9.1
