From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 2/3] dt-bindings: etnaviv: change clocks to be optional
Date: Mon, 22 Jan 2018 17:36:31 +0100
Message-ID: <1516638991.25726.10.camel@pengutronix.de>
References: <20180119120634.22856-1-l.stach@pengutronix.de>
         <20180119120634.22856-2-l.stach@pengutronix.de>
         <CAL_JsqJM_4B5XavWwHZJSP5tHafDr4xd7_HBYRTnKWPouo3Rdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJM_4B5XavWwHZJSP5tHafDr4xd7_HBYRTnKWPouo3Rdg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux+etnaviv-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Montag, den 22.01.2018, 10:28 -0600 schrieb Rob Herring:
> On Fri, Jan 19, 2018 at 6:06 AM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> wrote:
> > While the clocks were documented as required, the driver always
> > treated them
> > as optional and there are existing Marvell Dove DTs, which would
> > break if
> > changed to required. Accept reality and document the clocks as
> > optional.
> 
> The fact that clocks are optional for a driver doesn't mean they are
> optional for the binding. Now they could be optional because you have
> power-domains and all clock management is done within the power
> domain
> (though that too is driver specifics leaking into the binding because
> power domain has come to mean power management domain).

So you prefer the binding to stay as-is and accept the Dove DTs as non-
compliant to the bindings, but still okay? That's fine with me and I'll
drop that patch in this case.

Regards,
Lucas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
