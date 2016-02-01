From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V5 3/5] pinctrl: max77620: add pincontrol driver for
 MAX77620/MAX20024
Date: Mon, 1 Feb 2016 07:58:17 -0600
Message-ID: <20160201135817.GA25324@rob-hp-laptop>
References: <1453903808-29788-1-git-send-email-ldewangan@nvidia.com>
 <1453903808-29788-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1453903808-29788-4-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 27, 2016 at 07:40:06PM +0530, Laxman Dewangan wrote:
> MAXIM Semiconductor's PMIC, MAX77620/MAX20024 has 8 GPIO pins
> which also act as the special function in alternate mode. Also
> there is configuration like push-pull, open drain, FPS timing
> etc for these pins.
> 
> Add pincontrol driver to configure these parameters through
> pincontrol APIs.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes from V1:
> - Cleanup code based on comment received on mfd/rtc.
> - Avoid duplication on error message.
>  
> Changes form V2:
> - Run coccicheck and checkpatch in strict mode for the alignment.
> - update based on api changes from core.
> 
> Changes from V3: 
> - Change all sys initcall to module driver.
> - change the max77620_read argument to unisgned int from u8.
> 
> Changes from V4: 
> - Added DT binding document as devicetree/bindings/pinctrl/pinctrl-max77620.txt
> - Detail out properties.
> 
>  .../bindings/pinctrl/pinctrl-max77620.txt          |  87 +++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/pinctrl/Kconfig                            |  10 +
>  drivers/pinctrl/Makefile                           |   1 +
>  drivers/pinctrl/pinctrl-max77620.c                 | 693 +++++++++++++++++++++
>  4 files changed, 791 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-max77620.txt
>  create mode 100644 drivers/pinctrl/pinctrl-max77620.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
