From: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 3/5] ARM64: dts: meson-axg: uart: Add the pinctrl
 info description
Date: Mon, 08 Jan 2018 09:42:54 +0100
Message-ID: <1515400974.5048.58.camel@baylibre.com>
References: <20180106001044.108163-1-yixun.lan@amlogic.com>
         <20180106001044.108163-4-yixun.lan@amlogic.com>
         <CAFBinCCuQ-NK747+GHDkhZty_UMMgzCYOYFcNTrRDJgU8OM=Gw@mail.gmail.com>
         <b2571e30-d543-9288-68cf-1af86bb5f4bc@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b2571e30-d543-9288-68cf-1af86bb5f4bc-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Xingyun Chen <xingyu.chen-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2018-01-08 at 14:07 +0800, Yixun Lan wrote:
> > (the following question just came up while I was looking at this
> > patch, but I guess it's more a question towards the pinctrl driver)
> > the name of the function looks a bit "weird" since below you are also
> > using "uart_ao_b"
> 
> you right here, it's a question related to pinctrl subsystem.
> from my point of view, it's even weird from the hardware perspective:
>  that, the UART function of AO domain route the pin of EE domain..
> 
> > did you choose "uart_ao_b_gpioz" here because we cannot have the same
> > function name for the periphs and AO pinctrl or is there some other
> > reason?
> > 
> 
> Current there is a conflict in the code level which both two pinctrl
> tree (EE, AO) are using the same macro[1] to expand the definitions, so
> there would be conflict symbol if we name both as 'uart_ao_b'
> 
> I think your idea of having an uniform function 'uart_ao_b' for both
> pinctrl subsystem is actually possible/positive..
> 
> I will think about your suggestion and come up with a patch later,
> thanks a lot!
> 
> 
> [1] drivers/pinctrl/meson/pinctrl-meson.h
> 
> #define FUNCTION(fn)                                                    \
>         {                                                               \
>                 .name = #fn,                                            \
>                 .groups = fn ## _groups,                                \
>                 .num_groups = ARRAY_SIZE(fn ## _groups),                \
>         }

The name feels weird because it should have been uart_ao_b_z ... We missed it in
the initial review. Except for correcting the function name, I don't think this
justify a change a pinctrl
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
