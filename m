From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 0/3] Add support for STM32MP1 ADC
Date: Sun, 6 May 2018 18:54:04 +0100
Message-ID: <20180506185404.1e2b1d7a@archlinux>
References: <1525247091-18143-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525247091-18143-1-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: robh+dt@kernel.org, alexandre.torgue@st.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, lars@metafoo.de, knaack.h@gmx.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, benjamin.gaignard@linaro.org
List-Id: devicetree@vger.kernel.org

On Wed, 2 May 2018 09:44:48 +0200
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> Add support for STM32MP1 Analog to Digital Converter variant.
> It's quite similar to STM32H7 ADC and re-use most of existing driver.
This series looks good to me. I just want to give Rob in particular
time to have another look if he likes.

Give me a poke if I seem to have forgotten it in a week or so.

Thanks,

Jonathan

> 
> ---
> Changes in v2:
> - Update dt-bindings following Rob's remark: STM32MP1 ADC has two
>   interrupt lines
> 
> Fabrice Gasnier (3):
>   dt-bindings: iio: stm32-adc: add support for STM32MP1
>   iio: adc: stm32-adc: add support for STM32MP1
>   ARM: dts: stm32: Add ADC support to stm32mp157c
> 
>  .../devicetree/bindings/iio/adc/st,stm32-adc.txt   |  6 +-
>  arch/arm/boot/dts/stm32mp157c.dtsi                 | 32 +++++++++++
>  drivers/iio/adc/stm32-adc-core.c                   | 66 ++++++++++++++++------
>  drivers/iio/adc/stm32-adc.c                        | 47 +++++++++++++--
>  4 files changed, 128 insertions(+), 23 deletions(-)
> 
