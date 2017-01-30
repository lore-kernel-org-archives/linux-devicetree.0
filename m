From: Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: Re: [PATCH 0/5] Add EXTI GPIO trigger support to STM32 ADC
Date: Mon, 30 Jan 2017 15:09:54 +0100
Message-ID: <0472f001-eee8-74a8-f078-2fb71904be58@st.com>
References: <1485784663-19505-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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
Cc: mark.rutland@arm.com, benjamin.gaignard@linaro.org, lars@metafoo.de, alexandre.torgue@st.com, linux-iio@vger.kernel.org, pmeerw@pmeerw.net, mcoquelin.stm32@gmail.com, knaack.h@gmx.de, benjamin.gaignard@st.com
List-Id: devicetree@vger.kernel.org

Hi all,

Please discard this series. I'll send a V2.
Sorry for the noise.

Best regards,
Fabrice

On 01/30/2017 02:57 PM, Fabrice Gasnier wrote:
> STM32 ADC, can use GPIOs configured as EXTI line (external interrupt)
> as trigger source for conversions.
> This patchset is based on latest IIO testing branch, and adds support
> for EXTi GPIO triggers in IIO.
> It also adds a dt option to configure default trigger polarity in
> STM32 ADC driver.
>
> Fabrice Gasnier (5):
>    Documentation: dt: iio: document stm32 adc trigger polarity
>    iio: adc: stm32: add dt option to set default trigger polarity
>    Documentation: dt: iio: document stm32 exti trigger
>    iio: trigger: add support for STM32 EXTI triggers
>    iio: adc: stm32: add exti11 gpio trigger source
>
>   .../devicetree/bindings/iio/adc/st,stm32-adc.txt   |   3 +
>   .../bindings/iio/trigger/st,stm32-exti-trigger.txt |  17 +++
>   drivers/iio/adc/stm32-adc.c                        |  14 +++
>   drivers/iio/trigger/Kconfig                        |  10 ++
>   drivers/iio/trigger/Makefile                       |   1 +
>   drivers/iio/trigger/stm32-exti-trigger.c           | 124 +++++++++++++++++++++
>   include/linux/iio/trigger/stm32-exti-trigger.h     |  26 +++++
>   7 files changed, 195 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/iio/trigger/st,stm32-exti-trigger.txt
>   create mode 100644 drivers/iio/trigger/stm32-exti-trigger.c
>   create mode 100644 include/linux/iio/trigger/stm32-exti-trigger.h
>
