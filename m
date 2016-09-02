From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iio: sx9500: add final devicetree support
Date: Fri, 2 Sep 2016 13:16:34 -0300
Message-ID: <CAOMZO5DbJLnH1wm2KuML+O36O-eSYWeGwrxE5pdKSRtB-Js-yA@mail.gmail.com>
References: <1472827740.1929.26.camel@googlemail.com> <CAOMZO5BeL1EKOQvZQoXXObttHSKxL7UQ1s2r8H4EOuROOb_YnQ@mail.gmail.com>
 <1472828671.1929.32.camel@googlemail.com> <CAOMZO5BVDS=AaSyRS0ELBiEKx3RxdstXgA_xJ6ANUzKDxdyBxg@mail.gmail.com>
 <1472829819.12668.3.camel@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472829819.12668.3.camel-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Fritz <chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vlad Dogaru <ddvlad-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 2, 2016 at 12:23 PM, Christoph Fritz
<chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:

> What do you mean by "software command", to send a reset command by i2c?

Yes, by writing 0xDE into RegReset register.

>
> The reset GPIO is fetched in sx9500 here:
>
> See sx9500_gpio_probe():
> ...
>         data->gpiod_rst = devm_gpiod_get_index(dev, SX9500_GPIO_RESET,
>                                                0, GPIOD_OUT_HIGH);

but there is no code that actually reads the "reset-gpios" dt property.

Does your board work well without passing "reset-gpios" property?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
