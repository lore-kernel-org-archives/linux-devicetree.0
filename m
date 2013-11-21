From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v1 1/1] dt: binding: reword PowerPC 8xxx GPIO
 documentation
Date: Thu, 21 Nov 2013 09:34:38 +0100
Message-ID: <20131121083438.GU17929@book.gsilab.sittig.org>
References: <201311182328.40743.arnd@arndb.de>
 <1384983293-11002-1-git-send-email-gsi@denx.de>
 <201311210149.43944.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201311210149.43944.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "Rob Herring@" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 21, 2013 at 01:49 +0100, Arnd Bergmann wrote:
> 
> On Wednesday 20 November 2013, Gerhard Sittig wrote:
> > re-format and re-word the device tree binding documentation for MPC8xxx
> > and compatibles, reference the common document for interrupt controllers
> > and remove outdated duplicate SoC specific information
> > 
> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > Cc: Rob Herring@ <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> > Cc: Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>
> > Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > Cc: <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> > Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
> 
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

thank you for the feedback and for the ACK

> > +Optional properties:
> > +- interrupt-controller:	Empty boolean property which marks the GPIO
> > +			module as an IRQ controller.
> > +- #interrupt-cells:	Number of integer cells required to specify an
> > +			interrupt within this interrupt controller.  The
> > +			first cell defines the pin number, the second
> > +			cell defines additional flags (trigger type,
> > +			trigger polarity).  Note that the specific set
> > +			of trigger conditions supported by the GPIO
> > +			module depends on the actual SoC.
> 
> Nitpicking: I think you need to add that #interrupt-cells must be <2>
> if present. I'd also suggest adding these two to the example section
> of the binding while you're at it.

will do

and I assume that your ACK still applies after I have addressed
the feedback from you and from Rob


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
