From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v3 4/7] palmetto: Request relevant mux functions in devicetree
Date: Tue, 13 Sep 2016 22:11:29 +0930
Message-ID: <CACPK8Xe-dowcwXkO8rDH2reMzGadUMSq5ZtV=23FP4virt+DUQ@mail.gmail.com>
References: <20160830075600.11559-1-andrew@aj.id.au> <20160830075600.11559-5-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160830075600.11559-5-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 30, 2016 at 5:25 PM, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org> wrote:
> +&pinctrl {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
> +                       &pinctrl_vgahs_default &pinctrl_vgavs_default
> +                       &pinctrl_ddcclk_default &pinctrl_ddcdat_default
> +
> +                       &pinctrl_pwm1_default &pinctrl_pwm2_default
> +                       &pinctrl_pwm3_default &pinctrl_pwm4_default
> +                       &pinctrl_pwm5_default &pinctrl_pwm6_default
> +                       &pinctrl_pwm7_default
> +
> +                       &pinctrl_bmcint_default &pinctrl_flack_default>;
> +};

It's not clear that all systems use these pins in that way. I will not
include this one for now.

Cheers,

Joel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
