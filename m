From: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/4] ARM: dts: bcm590xx: add support for GPLDO and
 VBUS regulators
Date: Wed, 21 May 2014 08:02:57 -0400
Message-ID: <20140521120257.GV32082@beef>
References: <1398295293-11033-1-git-send-email-mporter@linaro.org>
 <1398295293-11033-5-git-send-email-mporter@linaro.org>
 <20140521092913.GG6679@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140521092913.GG6679@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tim Kryger <tim.kryger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Markus Mayer <markus.mayer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 21, 2014 at 10:29:13AM +0100, Lee Jones wrote:
> > Adds additional nodes to support GPLDO1-6 and VBUS regulators which
> > are now supported in the bcm590xx regulator driver.
> > 
> > Signed-off-by: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/bcm59056.dtsi | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> 
> I'm not going to apply this with the rest of the set.  It will have to
> go in via your normal arch/arm route.

Ok

> > diff --git a/arch/arm/boot/dts/bcm59056.dtsi b/arch/arm/boot/dts/bcm59056.dtsi
> > index dfadaaa..066adfb 100644
> > --- a/arch/arm/boot/dts/bcm59056.dtsi
> > +++ b/arch/arm/boot/dts/bcm59056.dtsi
> > @@ -70,5 +70,26 @@
> >  
> >  		vsr_reg: vsr {
> >  		};
> > +
> > +		gpldo1_reg: gpldo1 {
> > +		};
> 
> What do these empty nodes do in any case?

They instantiate regulators. The bcm590xx binding specifies the
allowable subnode names permitted here. This replaces the old method
of specifying an index or the deprecated regulator-compatible property.
The board-specific dts includes this dtsi and applies any board
constraints to a subset of regulators that need them. Unused regulators
are all disabled which is what we want.

> Don't you at least need a status property in there or something?

Not necessary for these subnodes.

-Matt

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
