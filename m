From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: iio: stm32-lptimer-counter: document
 pinctrl sleep state
Date: Sun, 3 Mar 2019 14:39:48 +0000
Message-ID: <20190303143948.2ab9dff3@archlinux>
References: <1551091367-21718-1-git-send-email-fabrice.gasnier@st.com>
        <1551091367-21718-2-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551091367-21718-2-git-send-email-fabrice.gasnier@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: robh+dt@kernel.org, alexandre.torgue@st.com, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, lars@metafoo.de, knaack.h@gmx.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, benjamin.gaignard@linaro.org, arnaud.pouliquen@st.com
List-Id: devicetree@vger.kernel.org

On Mon, 25 Feb 2019 11:42:46 +0100
Fabrice Gasnier <fabrice.gasnier@st.com> wrote:

> Add documentation for optional pinctrl sleep state that can be used by
> STM32 LPTimer encoder/counter.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to play with it.

Note we are too late for the coming merge window so this will be
for the next one now.

Thanks,

Jonathan

> ---
>  .../devicetree/bindings/iio/counter/stm32-lptimer-cnt.txt         | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/counter/stm32-lptimer-cnt.txt b/Documentation/devicetree/bindings/iio/counter/stm32-lptimer-cnt.txt
> index a04aa5c..e90bc47 100644
> --- a/Documentation/devicetree/bindings/iio/counter/stm32-lptimer-cnt.txt
> +++ b/Documentation/devicetree/bindings/iio/counter/stm32-lptimer-cnt.txt
> @@ -10,8 +10,9 @@ See ../mfd/stm32-lptimer.txt for details about the parent node.
>  
>  Required properties:
>  - compatible:		Must be "st,stm32-lptimer-counter".
> -- pinctrl-names: 	Set to "default".
> -- pinctrl-0: 		List of phandles pointing to pin configuration nodes,
> +- pinctrl-names: 	Set to "default". An additional "sleep" state can be
> +			defined to set pins in sleep state.
> +- pinctrl-n: 		List of phandles pointing to pin configuration nodes,
>  			to set IN1/IN2 pins in mode of operation for Low-Power
>  			Timer input on external pin.
>  
> @@ -21,7 +22,8 @@ Example:
>  		...
>  		counter {
>  			compatible = "st,stm32-lptimer-counter";
> -			pinctrl-names = "default";
> +			pinctrl-names = "default", "sleep";
>  			pinctrl-0 = <&lptim1_in_pins>;
> +			pinctrl-1 = <&lptim1_sleep_in_pins>;
>  		};
>  	};
