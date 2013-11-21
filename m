From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v1 1/1] dt: binding: reword PowerPC 8xxx GPIO
 documentation
Date: Thu, 21 Nov 2013 09:30:14 +0100
Message-ID: <20131121083014.GT17929@book.gsilab.sittig.org>
References: <201311182328.40743.arnd@arndb.de>
 <1384983293-11002-1-git-send-email-gsi@denx.de>
 <CAL_JsqJvxA240QEreWPp2L+eNFQmhp0XV=qmO4QXqTga+RFuCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJvxA240QEreWPp2L+eNFQmhp0XV=qmO4QXqTga+RFuCQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "Rob Herring@" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 20, 2013 at 17:50 -0600, Rob Herring wrote:
> 
> On Wed, Nov 20, 2013 at 3:34 PM, Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org> wrote:
> > re-format and re-word the device tree binding documentation for MPC8xxx
> > and compatibles, reference the common document for interrupt controllers
> > and remove outdated duplicate SoC specific information
> >
> > [ ... ]
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/8xxx_gpio.txt b/Documentation/devicetree/bindings/gpio/8xxx_gpio.txt
> > index b0019eb5330e..7788e8df3a15 100644
> > --- a/Documentation/devicetree/bindings/gpio/8xxx_gpio.txt
> > +++ b/Documentation/devicetree/bindings/gpio/8xxx_gpio.txt
> > @@ -5,16 +5,41 @@ This is for the non-QE/CPM/GUTs GPIO controllers as found on
> >
> > [ ... ]
> >
> >  Required properties:
> > -- compatible : "fsl,<CHIP>-gpio" followed by "fsl,mpc8349-gpio" for
> > -  83xx, "fsl,mpc8572-gpio" for 85xx and "fsl,mpc8610-gpio" for 86xx.
> > -- #gpio-cells : Should be two. The first cell is the pin number and the
> > -  second cell is used to specify optional parameters (currently unused).
> > - - interrupts : Interrupt mapping for GPIO IRQ.
> > - - interrupt-parent : Phandle for the interrupt controller that
> > -   services interrupts for this device.
> > -- gpio-controller : Marks the port as GPIO controller.
> > +- compatible:          "fsl,<CHIP>-gpio" followed by "fsl,mpc8349-gpio"
> 
> Can you use <chip> here. Only because I'm developing some
> documentation checking scripts and handle that already.

will do

> 
> > +                       for 83xx, "fsl,mpc8572-gpio" for 85xx and
> 
> s/and/or/

will do

> 
> > +                       "fsl,mpc8610-gpio" for 86xx.
> > +- #gpio-cells:         Should be two. The first cell is the pin number
> > +                       and the second cell is used to specify optional
> > +                       parameters (currently unused).
> > +- interrupt-parent:    Phandle for the interrupt controller that
> > +                       services interrupts for this device.
> > +- interrupts:          Interrupt mapping for GPIO IRQ.
> > +- gpio-controller:     Marks the port as GPIO controller.
> > +
> > +Optional properties:
> > +- interrupt-controller:        Empty boolean property which marks the GPIO
> > +                       module as an IRQ controller.
> > +- #interrupt-cells:    Number of integer cells required to specify an
> 
> Should start with "Should be two."

will do

> 
> > +                       interrupt within this interrupt controller.  The
> > +                       first cell defines the pin number, the second
> > +                       cell defines additional flags (trigger type,
> > +                       trigger polarity).  Note that the specific set
> > +                       of trigger conditions supported by the GPIO
> > +                       module depends on the actual SoC.
> 
> You mean what values are supported vary, not the meaning of the values right?

yes, encoding of trigger conditions is specified in the common
document and the values remain the same, but the set of possible
values which apply to a SoC are individual


thank you for the feedback


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office-ynQEQJNshbs@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
