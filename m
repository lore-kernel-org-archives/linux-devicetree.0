From: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] Does PHY UTMI data width belong to DWC2 or PHY binding?
Date: Tue, 22 Oct 2013 07:25:20 -0400
Message-ID: <20131022112520.GE29341@beef>
References: <20131018141221.GH2721@beef>
 <5264F37E.9060307@ti.com>
 <20131022104829.GF15425@login.drsnuggles.stderr.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131022104829.GF15425-tJobPqrNDpleFRaWBN1JIYg6o0x57dKM8/qWW+O4k6E@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthijs Kooijman <matthijs-gZv8Wpyq0Kk@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 22, 2013 at 12:48:29PM +0200, Matthijs Kooijman wrote:
> Hi Kishon,
> 
> On Mon, Oct 21, 2013 at 02:57:26PM +0530, Kishon Vijay Abraham I wrote:
> > I think it makes sense to keep the data width property in the dwc2 node itself.
> > I mean it describes how the dwc2 IP is configured in that particular SoC (given
> > that it can be either <8> or <16>).
> If I'm reading the RT3052 datasheet correctly (GHWCFG4 register), the IP
> can be configured for 8, 16 or 8 _and_ 16. In the latter case, the "8
> and 16 supported" would make sense as a property of dwc2 (though this
> value should be autodetectable through GHWCFG4), while the actual 8 or
> 16 supported by the PHY would make sense as property of a phy.

There would be no value in adding a property for an already detectable
value to dwc2's binding. To be honest, it's pretty much useless
information due to the existence of the "8 and 16" option.

> Note sure if this is really useful in practice as well, or if just
> setting the actual width to use on dwc2 makes more sense...

The GHWCFG4 information itself is not useful in practice, as described
in the original thread: https://lkml.org/lkml/2013/10/10/477

It's certainly useful in practice to have this width property in either
the dwc2 or the phy binding. One can make a case for either. As I
mentioned in the original post, if we put it in the phy binding we'll be
updating the generic phy binding. We'll then need an api added into the
generic phy framework to fetch the width of a phy.

Both cases are doable and trivial, we just need the canonical decision
from a DT maintainer as to where the property belongs. Given that they
are in ARM ksummit, I'm not expecting to hear anything right this
moment. :)

-Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
