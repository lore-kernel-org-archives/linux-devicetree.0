From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] dt-bindings: iio: stm32-dac: add support for
 STM32F4
Date: Mon, 10 Jul 2017 21:51:05 +0100
Message-ID: <20170710215105.126409dc@kernel.org>
References: <1499693040-12994-1-git-send-email-fabrice.gasnier@st.com>
        <1499693040-12994-2-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1499693040-12994-2-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 10 Jul 2017 15:23:57 +0200
Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org> wrote:

> Introduce new compatible to support STM32F4 DAC (Digital-To-Analog
> converter) variant.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Applied to the togreg branch of iio.git and pushed out as testing
for the autobuilders to ignore it.

Simple addition of a supported part so, whilst welcome review
from Rob / Mark isn't really necessary I think.

Jonathan
> ---
>  Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt
> index bcee71f..bf2925c 100644
> --- a/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt
> +++ b/Documentation/devicetree/bindings/iio/dac/st,stm32-dac.txt
> @@ -10,7 +10,9 @@ current.
>  Contents of a stm32 dac root node:
>  -----------------------------------
>  Required properties:
> -- compatible: Must be "st,stm32h7-dac-core".
> +- compatible: Should be one of:
> +  "st,stm32f4-dac-core"
> +  "st,stm32h7-dac-core"
>  - reg: Offset and length of the device's register set.
>  - clocks: Must contain an entry for pclk (which feeds the peripheral bus
>    interface)
