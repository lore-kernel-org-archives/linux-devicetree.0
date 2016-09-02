From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] iio: sx9500: add final devicetree support
Date: Fri, 2 Sep 2016 11:53:52 -0300
Message-ID: <CAOMZO5BeL1EKOQvZQoXXObttHSKxL7UQ1s2r8H4EOuROOb_YnQ@mail.gmail.com>
References: <1472827740.1929.26.camel@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472827740.1929.26.camel-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Fritz <chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vlad Dogaru <ddvlad-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 2, 2016 at 11:49 AM, Christoph Fritz
<chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:

> +sx9500@28 {
> +       compatible = "semtech,sx9500";
> +       reg = <0x28>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_sx9500>;
> +       interrupt-parent = <&gpio2>;
> +       interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
> +       reset-gpios = <&gpio2 10 GPIO_ACTIVE_HIGH>;

Datasheet says the reset is active low.
