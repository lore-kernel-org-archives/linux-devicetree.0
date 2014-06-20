From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH v2] ARM: mvebu: Fix missing binding documentation for
 Armada 38x
Date: Fri, 20 Jun 2014 19:57:53 -0400
Message-ID: <20140620235753.GS21711@titan.lakedaemon.net>
References: <1403196043-6317-1-git-send-email-gregory.clement@free-electrons.com>
 <20140620185241.GC21711@titan.lakedaemon.net>
 <CAL_JsqKinUvcJ+OOoD70zD6CH393cgZWC+4gRO=8XORyE6fVKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqKinUvcJ+OOoD70zD6CH393cgZWC+4gRO=8XORyE6fVKA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 20, 2014 at 05:33:06PM -0500, Rob Herring wrote:
> On Fri, Jun 20, 2014 at 1:52 PM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> > On Thu, Jun 19, 2014 at 06:40:43PM +0200, Gregory CLEMENT wrote:
> >> For the Armada 380 and Armada 385 SoCs, the common bindings for those
> >> 2 SoCs, was forgotten. This patch add the documentation for the
> >> marvell,aramda38x property.
> >>
> >> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >> --
> >> Hi,
> >>
> >> This fix should be merged in 3.16. For 3.15 I am not sure as it is not
> >> a regression.
> >>
> >> Changelog:
> >> v1->v2
> >>
> >> - Reformulate to make clear that we will need marvell,armada38x _and_ a
> >> SoC specific string. For consistency I duplicated what we have done in
> >> armada-370-xp.txt
> >>
> >>
> >> Thanks,
> >> Gregory
> >>
> >>
> >>  Documentation/devicetree/bindings/arm/armada-38x.txt | 17 +++++++++++++++--
> >>  1 file changed, 15 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/armada-38x.txt b/Documentation/devicetree/bindings/arm/armada-38x.txt
> >> index 11f2330a6554..fa08760046df 100644
> >> --- a/Documentation/devicetree/bindings/arm/armada-38x.txt
> >> +++ b/Documentation/devicetree/bindings/arm/armada-38x.txt
> >> @@ -6,5 +6,18 @@ following property:
> >>
> >>  Required root node property:
> >>
> >> - - compatible: must contain either "marvell,armada380" or
> >> -   "marvell,armada385" depending on the variant of the SoC being used.
> >> +compatible: must contain "marvell,armada38x"
> >
> > I agree with Sergei on this one.  We generally avoid wildcards in
> > compatible strings.  Is there a use case where specifying one of the
> > below wouldn't be sufficient?
> 
> Isn't this a case of just documenting what is already in use?

Technically, yes.  However, there are no products shipping with this SoC
yet.  So there aren't any _real_ users other than the developers
bringing in mainline support.

> I agree wildcards alone are not good, but along with a specific
> compatible is okay. But also there should be some need to have the
> common property.

I'm curious what you would consider to be a sufficient need?  This can
be easily handled by a match table, but a match table could also be
considered rather heavy for this task.

I think any implementation-based justification is prone to opening a can
of worms.  And I'm struggling to see a DT-only justification...

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
