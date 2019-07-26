From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/5] Add missing vdda-supply to STM32 ADC
Date: Fri, 26 Jul 2019 18:00:06 +0200
Message-ID: <b91163f5-ad6f-0a22-eb8a-ceb0b0c056c6@st.com>
References: <1560947398-11592-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1560947398-11592-1-git-send-email-fabrice.gasnier@st.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>, jic23@kernel.org, robh+dt@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de, mcoquelin.stm32@gmail.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, pmeerw@pmeerw.net, knaack.h@gmx.de, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Fabrice

On 6/19/19 2:29 PM, Fabrice Gasnier wrote:
> Add missing vdda-supply, analog power supply, to STM32 ADC. When vdda is
> an independent supply, it needs to be properly turned on or off to supply
> the ADC.
> This series proposes fixes for the dt-bindings, IIO driver and relevant
> device tree files.
> 
> Fabrice Gasnier (5):
>    dt-bindings: iio: adc: stm32: add missing vdda supply
>    iio: adc: stm32-adc: add missing vdda-supply
>    ARM: dts: stm32: remove fixed regulator unit address on stm32429i-eval
>    ARM: dts: stm32: add missing vdda-supply to adc on stm32429i-eval
>    ARM: dts: stm32: add missing vdda-supply to adc on stm32h743i-eval
> 
>   .../devicetree/bindings/iio/adc/st,stm32-adc.txt   |  1 +
>   arch/arm/boot/dts/stm32429i-eval.dts               | 25 +++++++++++-----------
>   arch/arm/boot/dts/stm32h743i-eval.dts              |  1 +
>   drivers/iio/adc/stm32-adc-core.c                   | 21 +++++++++++++++++-
>   4 files changed, 35 insertions(+), 13 deletions(-)
> 

DT patches applied on stm32-next. I plan to add them in my PR for v5.4.
However those patches are marked as "fixes", do you see an issue to only 
send it for v5.4 ?

Regards
alex
