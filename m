From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: [PATCH 5/5] iio: adc: stm32: add exti11 gpio trigger source
Date: Mon, 30 Jan 2017 14:57:43 +0100
Message-ID: <1485784663-19505-6-git-send-email-fabrice.gasnier@st.com>
References: <1485784663-19505-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1485784663-19505-1-git-send-email-fabrice.gasnier@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jic23@kernel.org, linux@armlinux.org.uk, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, benjamin.gaignard@linaro.org, lars@metafoo.de, alexandre.torgue@st.com, linux-iio@vger.kernel.org, pmeerw@pmeerw.net, mcoquelin.stm32@gmail.com, knaack.h@gmx.de, fabrice.gasnier@st.com, benjamin.gaignard@st.com
List-Id: devicetree@vger.kernel.org

STM32F4 ADC can use exti11 (gpio) signal as trigger source for
conversions.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 drivers/iio/adc/stm32-adc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index be0e457..0118c9c 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -26,6 +26,7 @@
 #include <linux/iio/iio.h>
 #include <linux/iio/buffer.h>
 #include <linux/iio/timer/stm32-timer-trigger.h>
+#include <linux/iio/trigger/stm32-exti-trigger.h>
 #include <linux/iio/trigger.h>
 #include <linux/iio/trigger_consumer.h>
 #include <linux/iio/triggered_buffer.h>
@@ -240,6 +241,7 @@ struct stm32_adc_chan_spec {
 	{ TIM5_CH3, STM32_EXT12 },
 	{ TIM8_CH1, STM32_EXT13 },
 	{ TIM8_TRGO, STM32_EXT14 },
+	{ STM32_EXTI(11), STM32_EXT15 },
 	{}, /* sentinel */
 };
 
@@ -409,6 +411,11 @@ static int stm32_adc_get_trig_extsel(struct iio_trigger *trig)
 		    !strcmp(stm32f4_adc_trigs[i].name, trig->name)) {
 			return stm32f4_adc_trigs[i].extsel;
 		}
+
+		if (is_stm32_exti_trigger(trig) &&
+		    !strcmp(stm32f4_adc_trigs[i].name, trig->name)) {
+			return stm32f4_adc_trigs[i].extsel;
+		}
 	}
 
 	return -EINVAL;
-- 
1.9.1
