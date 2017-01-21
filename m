From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/7] Documentation: dt: iio: stm32-adc: optional dma
 support
Date: Sat, 21 Jan 2017 14:54:40 -0600
Message-ID: <20170121205440.s32egtpu5tmlbkdi@rob-hp-laptop>
References: <1484832854-6314-1-git-send-email-fabrice.gasnier@st.com>
 <1484832854-6314-5-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1484832854-6314-5-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: jic23@kernel.org, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, lars@metafoo.de, knaack.h@gmx.de, pmeerw@pmeerw.net, benjamin.gaignard@linaro.org, benjamin.gaignard@st.com
List-Id: devicetree@vger.kernel.org

On Thu, Jan 19, 2017 at 02:34:11PM +0100, Fabrice Gasnier wrote:
> STM32 ADC can use dma. Add dt documentation for optional dma support.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/st,stm32-adc.txt | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
