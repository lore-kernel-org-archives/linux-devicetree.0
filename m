From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH 3/9] drm/panel: simple: make it possible to override LCD
 bus format
Date: Tue, 17 Oct 2017 14:44:23 +0200
Message-ID: <20171017144423.4ddd6047@karo-electronics.de>
References: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
        <1507721021-28174-4-git-send-email-LW@KARO-electronics.de>
        <20171017121240.GD684@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171017121240.GD684@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, 17 Oct 2017 14:12:40 +0200 Thierry Reding wrote:
> On Wed, Oct 11, 2017 at 01:23:35PM +0200, Lothar Waßmann wrote:
> > The baseboards for the Ka-Ro electronics series of i.MX modules
> > use a 24bit LCD interface, no matter what LCD bus width the SoC on the
> > module provides and what the LCD panel expects. LCDs with 6bit per color
> > will ignore the 2 LSBs of each color lane, and modules using a SoC
> > that provides only 6bit per color, drive the display information on the
> > 6 MSBs of each color lane and tie the 2 LSBs of each color lane to GND.
> > 
> > Thus, no matter what combination of LCD and SoC is used, the LCD port
> > can be used without shuffling bit lanes by always configuring the LCD
> > output to 24bit mode.
> > 
> > Add a function to handle certain quirks of the LCD interface to the
> > panel driver to be able to override the bus format specified in a
> > panel's display_mode.
> 
> I think the above paragraph clearly indicates that this is the wrong
> place to workaround this. You say yourself that the LCD interface has
> quirks that need to be handled, so why do you want to force this
> handling into the panel driver?
> 
The quirk is in the interfacing of the SoM's LCD output to the LCD
panel. Thus it can be handled in either place.

> The panel remains the same, no matter what interface you connect it to.
> 
Because that's just ONE place to change, no matter what LCD driver is
being used.


Lothar Waßmann
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
