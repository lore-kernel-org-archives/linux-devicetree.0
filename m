From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/9] sh-pfc: Add OF support
Date: Mon, 07 Jan 2013 19:56:19 +0100
Message-ID: <2696178.tZLZqFqVI9@avalon>
References: <1357260060-32164-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1357260060-32164-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1357261926.25326.2.camel@gitbox>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1357261926.25326.2.camel@gitbox>
Sender: linux-sh-owner@vger.kernel.org
To: Tony Prisk <linux@prisktech.co.nz>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-sh@vger.kernel.org, Simon Horman <horms@verge.net.au>, Phil Edworthy <phil.edworthy@renesas.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree-discuss@lists.ozlabs.org, Magnus Damm <magnus.damm@gmail.com>, Paul Mundt <lethal@linux-sh.org>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
List-Id: devicetree@vger.kernel.org

Hi Tony,

On Friday 04 January 2013 14:12:06 Tony Prisk wrote:
> On Fri, 2013-01-04 at 01:40 +0100, Laurent Pinchart wrote:
> > +- #gpio-cells: Should be 2. The first cell is the pin number and the
> > second cell
> > +  is used to specify optional parameters (currently unused).
> 
> ...
> 
> > +	gpio: pfc@e6050000 {
> > +		compatible = "renesas,pfc-sh73a0";
> > +		reg = <0xe6050000 0x8000>,
> > +		      <0xe605801c 0x1c>;
> > +		gpio-controller;
> > +		#gpio-cells = <2>;
> > +	};
> > +
> > +Example 2: A GPIO LED node that references a GPIO
> > +
> > +	leds {
> > +		compatible = "gpio-leds";
> > +		led1 {
> > +			gpios = <&gpio 20 1>; /* Active low */
> > +		};
> > +	};
> > +
> 
> The second cell of gpio is '(currently unused)' but the example shows it
> being used?

My bad. The second cell can be used to specify that the GPIO is active low. 
I'll fix the documentation accordingly.

-- 
Regards,

Laurent Pinchart

