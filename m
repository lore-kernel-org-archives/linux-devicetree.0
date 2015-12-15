From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 12/12] ARM: dts: imx6: add Vivante GPU nodes
Date: Tue, 15 Dec 2015 11:18:25 +0100
Message-ID: <1450174705.3163.62.camel@pengutronix.de>
References: <1449237604-19064-1-git-send-email-l.stach@pengutronix.de>
	 <1449237604-19064-13-git-send-email-l.stach@pengutronix.de>
	 <20151211070258.GA11252@tiger> <1450086745.3163.3.camel@pengutronix.de>
	 <20151215082511.GA388@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151215082511.GA388@tiger>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, den 15.12.2015, 16:25 +0800 schrieb Shawn Guo:
> On Mon, Dec 14, 2015 at 10:52:25AM +0100, Lucas Stach wrote:
> > Are you okay with merging the DT changes through the DRM tree, or do you
> > want to pick them separate?
> 
> To accelerate the merge process, I'm okay with merging the DT changes
> through DRM tree, as long as DRM maintainers don't mind.
> 
As the Dove maintainers prefer to take the DT changes through their
tree, I think we should do the same thing for i.MX.

I will send out the fixed patch together with the pull for the DRM and
DT bindings bits, so you can pick it up for 4.5.

Regards,
Lucas

-- 
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
