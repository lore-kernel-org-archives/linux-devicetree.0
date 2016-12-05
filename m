From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: drm/bridge: adv7511: Add regulator bindings
Date: Mon, 05 Dec 2016 23:16:22 +0200
Message-ID: <1849418.teKsJeE0xP@avalon>
References: <1474622430-6704-1-git-send-email-architt@codeaurora.org> <3929994.7YhJtsl9c3@avalon> <20161205211151.GA30492@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161205211151.GA30492@tuxbot>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On Monday 05 Dec 2016 13:11:51 Bjorn Andersson wrote:
> On Tue 29 Nov 01:11 PST 2016, Laurent Pinchart wrote:
> > On Tuesday 29 Nov 2016 13:41:33 Archit Taneja wrote:
> >> On 11/29/2016 12:03 PM, Laurent Pinchart wrote:
> >>> On Tuesday 29 Nov 2016 11:37:41 Archit Taneja wrote:
> >>>> Add the regulator supply properties needed by ADV7511 and ADV7533.
> >>>> 
> >>>> The regulators are specified as optional properties since there can
> >>>> be boards which have a fixed supply directly routed to the pins, and
> >>>> these may not be modelled as regulator supplies.
> >>> 
> >>> That's why we have support for dummy supplies in the kernel, isn't it
> >>> ? Isn't it better to make the supplies mandatory in the bindings (and
> >>> obviously handling them as optional in the driver for
> >>> backward-compatibility) ?
> >> 
> >> I'm a bit unclear on this.
> >> 
> >> I thought we couldn't add mandatory properties once the device is
> >> already present in DT for one or more platforms.
> > 
> > You can, as long as you treat them as optional in the driver to retain
> > backward compatibility. The DT bindings should document the properties
> > expected from a new platform (older versions of the bindings will always
> > be available in the git history).
> 
> If you document them as required and don't do anything special in the
> implementation (i.e. just call devm_regulator_get() as usual) it will
> just work, in the absence of the property you will get a dummy regulator
> from the framework.
> 
> And then add the fixed-voltage regulators to the new DT to make that
> properly describe the hardware.
> 
> >> Say, if we do make it mandatory for future additions, we would need to
> >> have DT property for the supplies for the new platforms. If the
> >> regulators on these boards are fixed supplies, they would be need to be
> >> modeled using "regulator-fixed", possibly without any input supply. Is
> >> that what you're suggesting?
> > 
> > That's the idea, yes. Clock maintainers have a similar opinion regarding
> > the clock bindings, where a clock that is not optional at the hardware
> > level should be specified in DT even if it's always present.
> 
> Further more, a DT binding for a particular block should describe that
> block; so if we have three different 1.8V pins then the DT binding
> should reflect this - even if our current platform have them wired to
> the same regulator.

This has been discussed previously, and Rob agreed that if the datasheet 
recommends to power all supplies from the same regulator we can take that as a 
good hint that a single supply should be enough. In the very unlikely event 
that a board would require control of more regulators we can always extend the 
DT bindings later without breaking backward compatibility.

> (And the supply names would preferably be based on the pin names in the
> component data sheet)

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
