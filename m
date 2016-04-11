From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 3/3] mfd: dt-bindings: Add RK818 device tree bindings
 document
Date: Mon, 11 Apr 2016 11:03:18 -0500
Message-ID: <20160411160318.GA6478@rob-hp-laptop>
References: <1460108861-32818-1-git-send-email-w.egorov@phytec.de>
 <1460108861-32818-4-git-send-email-w.egorov@phytec.de>
 <20160411084434.GJ4592@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160411084434.GJ4592@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 11, 2016 at 09:44:34AM +0100, Lee Jones wrote:
> On Fri, 08 Apr 2016, Wadim Egorov wrote:
> 
> > Add device tree bindings documentation for rockchip's RK818 pmic.
> > 
> > Signed-off-by: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/mfd/rk808.txt | 37 +++++++++++++++++++++++--
> >  1 file changed, 34 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/rk808.txt b/Documentation/devicetree/bindings/mfd/rk808.txt
> > index 4ca6aab..8cceb07 100644
> > --- a/Documentation/devicetree/bindings/mfd/rk808.txt
> > +++ b/Documentation/devicetree/bindings/mfd/rk808.txt
> > @@ -1,7 +1,11 @@
> > -RK808 Power Management Integrated Circuit
> > +RK8xx Power Management Integrated Circuit
> 
> s/xx/XX/

And others say this bikeshed should be lowercase...

I say fine as is for bindings. Uppercase for actual part letters, 
lowercase for wildcards.

> 
> > +The rk8xx family current members:
> > +rk808
> > +rk818
> >  
> >  Required properties:
> > -- compatible: "rockchip,rk808"
> > +- compatible: "rockchip,rk808", "rockchip,rk818"
> >  - reg: I2C slave address
> >  - interrupt-parent: The parent interrupt controller.
> >  - interrupts: the interrupt outputs of the controller.
> > @@ -13,6 +17,8 @@ Optional properties:
> >    default output clock name
> >  - rockchip,system-power-controller: Telling whether or not this pmic is controlling
> >    the system power.
> > +
> > +Optional rk808 properties:
> 
> When mentioning the chip by name, you should always do so using
> uppercase, as it is in the datasheet.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
