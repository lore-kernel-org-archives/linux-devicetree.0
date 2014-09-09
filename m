From: Robin Gong <b38343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: PFUZE100 regulator not going off when PWRON is 0
Date: Tue, 9 Sep 2014 10:41:02 +0800
Message-ID: <20140909024100.GA19119@Robin-OptiPlex-780>
References: <CAL8zT=hNnRU3gbprVXOMt6FC9veRvQKRmS9gSeCm5-DNfGv-xg@mail.gmail.com>
 <20140903125248.GK29327@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140903125248.GK29327-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jean-Michel Hautbois <jean-michel.hautbois-B+Q8N6RmIDZBDgjK7y7TUQ@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Thanks for Mark's forward.

Hi Jean-Michel,
  Yes, SWxOMODE can be set as 1 to active sleep mode if PWRON turn-off event
occurs. And the voltage of sleep mode can be set in other register SWxOFF. But
by default, SWxOMODE is 0 which means all SW will be turned off while PWRON go
form 1 to 0. For your issue, I hope you check the hardware design, and measure
PWRON pin to see whether it has been pulled low once your push reset key.

On Wed, Sep 03, 2014 at 01:52:48PM +0100, Mark Brown wrote:
> On Wed, Sep 03, 2014 at 11:44:22AM +0200, Jean-Michel Hautbois wrote:
> 
> > I have a custom i.MX6 based board, but PMIC part is exactly the same
> > as the Freescale SabreSD board.
> > I have a reset button, which makes the PWRON signal on PFUZE100 go from 1 to 0.
> > I thought this would reset the chip, and thus all voltages would go to
> > 0, but this is not the case. It seems that SWxOMODE registers are
> > involved in this process, accorgind to the datasheet, but I don't
> > think this is implemented right now.
> > 
> > I also removed regulator-always-on for my SW2 pin in order to get it
> > off, but this has no effect.
> 
> You should really contact someone who worked on the driver or Freescale
> about this - I don't think anyone on the CC list knows anything about
> the part.  In general if you're asking about a specific driver this is a
> good approach.  I've CCed Robin Gong who was the original author.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
