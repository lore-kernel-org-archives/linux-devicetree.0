From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v5 01/12] dt-bindings: panel: lvds: Document power-supply property
Date: Thu, 04 Jan 2018 22:05:13 +0200
Message-ID: <1938450.ezem5N80bY@avalon>
References: <cover.e5a47cc96ec5274dd932daa2bde47df073087da9.1513854122.git-series.maxime.ripard@free-electrons.com> <2493504.1OPucrC18r@avalon> <20180104194436.reka6nw5hf32o4p3@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180104194436.reka6nw5hf32o4p3-ZC1Zs529Oq4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, jernej.skrabec-gGgVlfcn5nU@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Thursday, 4 January 2018 21:44:36 EET Maxime Ripard wrote:
> On Fri, Dec 22, 2017 at 02:08:20PM +0200, Laurent Pinchart wrote:
> > On Thursday, 21 December 2017 13:02:27 EET Maxime Ripard wrote:
> >> The power-supply property is used by a vast majority of panels,
> >> including panel-simple. Let's document it as a common property
> >> 
> >> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> >> ---
> >> 
> >> Documentation/devicetree/bindings/display/panel/panel-common.txt | 6 ++++
> >> Documentation/devicetree/bindings/display/panel/panel-lvds.txt   | 1 +
> >> Documentation/devicetree/bindings/display/panel/simple-panel.txt | 2 +-
> >> 3 files changed, 8 insertions(+), 1 deletion(-)
> >> 
> >> diff --git
> >> a/Documentation/devicetree/bindings/display/panel/panel-common.txt
> >> b/Documentation/devicetree/bindings/display/panel/panel-common.txt index
> >> ec52c472c845..125ea68052af 100644
> >> --- a/Documentation/devicetree/bindings/display/panel/panel-common.txt
> >> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.txt
> >> @@ -78,6 +78,12 @@ used for panels that implement compatible control
> >> signals. while active. Active high reset signals can be supported by
> >> inverting the GPIO specifier polarity flag.
> >> 
> >> +Power
> >> +-----
> >> +
> >> +- power-supply: many display panels need an additional power supply in
> >> +  order to be fully powered-up. For such panels, power-supply contains
> >> +  a phandle to the regulator powering the panel.
> > 
> > I think we should give more details here about the limitations of this
> > property. How about the following explanation ?
> > 
> > - power-supply: display panels require power to be supplied. While several
> > panels need more than one power supply with panel-specific constraints
> > governing the order and timings of the power supplies, in many cases a
> > single power supply is sufficient, either because the panel has a single
> > power rail, or because all its power rails can be driven by the same
> > supply. In that case the power-supply property specifies the supply
> > powering the panel as a phandle to a regulator.
> 
> That works for me. Do you want me to resend it with that text, or
> should I merge it (and if so, with your Reviewed-by or Acked-by?)?

No need to resend if it's just for me. With the above text,

Acked-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

(on a side note, I wonder if it's more efficient to ask whether to resend 
instead of just resending :-))

-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
