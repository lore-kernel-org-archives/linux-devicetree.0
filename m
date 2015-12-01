From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [linux-meson] Re: [PATCH v2 4/5] pinctrl: dt-binding: Extend
 meson documentation with GPIO IRQs support
Date: Tue, 1 Dec 2015 17:02:21 +0100
Message-ID: <20151201160221.GA28755@caronte>
References: <1448273816-11290-1-git-send-email-carlo@caione.org>
 <1448273816-11290-5-git-send-email-carlo@caione.org>
 <20151123234720.GA879@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151123234720.GA879@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, drake-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, jerry.cao-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, victor.wan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On lun, nov 23, 2015 at 05:47:20 -0600, Rob Herring wrote:
> On Mon, Nov 23, 2015 at 11:16:55AM +0100, Carlo Caione wrote:
> > From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> > 
> > Extend the pinctrl binding documentation with the support for external
> > GPIO interrupts.
> > 
> > Signed-off-by: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> > index 3f6a524..56743eb 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> > +++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> > @@ -3,6 +3,12 @@
> >  Required properties for the root node:
> >   - compatible: "amlogic,meson8-pinctrl" or "amlogic,meson8b-pinctrl"
> >   - reg: address and size of registers controlling irq functionality
> > + - reg-names: should be "irq"
> 
> You don't really need names when there is only one. Otherwise:
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

I missed this reply sorry. The name is conveniently used so that I can
use the meson_map_resource() helper function to map that and get back
the regmap struct in one shot.

I'm going to submit v3 soon without this modification leaving out your
Acked-by. Let me know if your ACK is still valid without this code
change.

-- 
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
