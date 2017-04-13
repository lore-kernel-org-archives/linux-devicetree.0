From: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/8] ARM: dts: imx7s: Add node for GPC
Date: Thu, 13 Apr 2017 14:20:59 -0700
Message-ID: <CAHQ1cqGsB5vb4iFRq2c0DRrNGnLravF8jO83jjSTDi7j8trjHg@mail.gmail.com>
References: <20170413133242.5068-1-andrew.smirnov@gmail.com>
 <20170413133242.5068-5-andrew.smirnov@gmail.com> <CANMBJr5sFeVxVq2w2uUd-ehXi9SpaJ7W9S_PTS_VN25YZEdXvQ@mail.gmail.com>
 <CAOMZO5CgLP7P+Q2Mvzpnx6u5ryb1TjAvaj9xDKXpD+8fMmn7MQ@mail.gmail.com>
 <CANMBJr4BWtU7SXEa0-4LFLx+ydVWas0Cx18kRn-=-Bz8pPZ=fg@mail.gmail.com>
 <CAOMZO5BaKBsXean8-560HUuZbhjef9dpMNku0SRUVtkv+XsZ6w@mail.gmail.com>
 <CANMBJr7We9uOyE6=BCWoe9L7xRKjOG6ScgtDGEgQ-hPawPeppg@mail.gmail.com> <CAOMZO5BjzSJws7zjJ5+aZkfeF+15twEu9zS3V+g6wQrtUiNyqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5BjzSJws7zjJ5+aZkfeF+15twEu9zS3V+g6wQrtUiNyqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Andrey Yurovsky <yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 13, 2017 at 1:49 PM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Apr 13, 2017 at 5:13 PM, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
>> I've rebased this series on the next-20170413 for sanity sake, and
>> realized there doesn't appear to be a way to select CONFIG_IMX_GPCV2.
>> I forced it using 'default y' and configured with imx_v6_v7_defconfig.
>> Now my board is booting. Before this series is applied, it may be good
>> to have CONFIG_IMX_GPCV2 selected specifically for iMX7 platform,
>> otherwise there will be boot regressions.
>
> Something like this?
>
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index f03ef43..fe99a48 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -253,6 +253,7 @@ config RENESAS_H8S_INTC
>
>  config IMX_GPCV2
>   bool
> + def_bool y if SOC_IMX7D
>   select IRQ_DOMAIN
>   help
>    Enables the wakeup IRQs for IMX platforms with GPCv2 block
>

FWIW, there's a patch for this that I haven't submitted yet (I plan to
submit it tomorrow):

https://github.com/ndreys/linux/commit/bd2de5be5c74bb35a0b8090f473862c9298a48b3

Thanks,
Andrey Smirnov
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
