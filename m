From: Christoph Fritz <chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] iio: sx9500: add final devicetree support
Date: Fri, 02 Sep 2016 17:04:31 +0200
Message-ID: <1472828671.1929.32.camel@googlemail.com>
References: <1472827740.1929.26.camel@googlemail.com>
         <CAOMZO5BeL1EKOQvZQoXXObttHSKxL7UQ1s2r8H4EOuROOb_YnQ@mail.gmail.com>
Reply-To: chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5BeL1EKOQvZQoXXObttHSKxL7UQ1s2r8H4EOuROOb_YnQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vlad Dogaru <ddvlad-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2016-09-02 at 11:53 -0300, Fabio Estevam wrote:
> On Fri, Sep 2, 2016 at 11:49 AM, Christoph Fritz
> <chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> 
> > +sx9500@28 {
> > +       compatible = "semtech,sx9500";
> > +       reg = <0x28>;
> > +       pinctrl-names = "default";
> > +       pinctrl-0 = <&pinctrl_sx9500>;
> > +       interrupt-parent = <&gpio2>;
> > +       interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
> > +       reset-gpios = <&gpio2 10 GPIO_ACTIVE_HIGH>;
> 
> Datasheet says the reset is active low.

Here on my board I'm using the reset pin as an open-drain with external
pullup, so GPIO_ACTIVE_HIGH is valid.

As this is an example, I don't care if it says _HIGH or _LOW.
