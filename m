From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/5] mfd: arizona: Update GPIO binding for newly
 supported specifiers
Date: Tue, 30 May 2017 08:17:58 +0100
Message-ID: <20170530071758.gqwu7jkg6akss2kf@dell>
References: <1495550852-3672-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1495550852-3672-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1495550852-3672-5-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 23 May 2017, Charles Keepax wrote:

> Link to the generic GPIO specifier bindings now that the second cell of
> the binding has some support in the driver.
> 
> Signed-off-by: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> ---
> 
> Changes since v1:
>  - Now just points at the standard gpio binding stuff
> 
> Thanks,
> Charles
> 
>  Documentation/devicetree/bindings/mfd/arizona.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
> index 8f2e282..b37bdde 100644
> --- a/Documentation/devicetree/bindings/mfd/arizona.txt
> +++ b/Documentation/devicetree/bindings/mfd/arizona.txt
> @@ -30,7 +30,8 @@ Required properties:
>  
>    - gpio-controller : Indicates this device is a GPIO controller.
>    - #gpio-cells : Must be 2. The first cell is the pin number and the
> -    second cell is used to specify optional parameters (currently unused).
> +    second cell is used to specify optional parameters, see ../gpio/gpio.txt
> +    for details.
>  
>    - AVDD-supply, DBVDD1-supply, CPVDD-supply : Power supplies for the device,
>      as covered in Documentation/devicetree/bindings/regulator/regulator.txt

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
