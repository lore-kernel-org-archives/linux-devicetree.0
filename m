From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [RFC 1/2] dt-bindings: add mmio-based syscon mux controller DT
 bindings
Date: Thu, 20 Apr 2017 17:01:59 +0200
Message-ID: <5aca7019-7c0a-5377-89e7-3d3eed5c2b73@axentia.se>
References: <20170413154812.19597-1-p.zabel@pengutronix.de>
 <20170419220900.ndrtt2m7d6tqsddh@rob-hp-laptop>
 <67388375-4f9e-fd1e-5155-7aeac0ea7b46@axentia.se>
 <b2e0c3bb-c74a-3ef3-6b58-1139d7a932a4@axentia.se>
 <1492699816.2158.107.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492699816.2158.107.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-04-20 16:50, Philipp Zabel wrote:
> 		mux: mux-controllers {
> 			compatible = "mmio-mux";
> 			#mux-control-cells = <1>;
> 
> 			/* This list is not complete */
> 			mux-reg-masks = <0x04 0x00080000>, /* MIPI_IPU1_MUX */
> 					<0x04 0x00100000>, /* MIPI_IPU2_MUX */
> 					<0x0c 0x0000000c>, /* HDMI_MUX_CTL */
> 					<0x0c 0x000000c0>, /* LVDS0_MUX_CTL */
> 					<0x0c 0x0000030c>, /* LVDS1_MUX_CTL */

I hope you mean
 					<0x0c 0x00000300>, /* LVDS1_MUX_CTL */

:-)

> 					<0x28 0x00000003>, /* DCIC1_MUX_CTL */
> 					<0x28 0x0000000c>; /* DCIC2_MUX_CTL */
> 		};

(BTW, same bug in the other example)

Cheers,
peda

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
