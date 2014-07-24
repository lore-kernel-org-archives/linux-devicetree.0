From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: mvebu: Added dts defintion for Lenovo Iomega
 ix4-300d NAS
Date: Thu, 24 Jul 2014 15:29:54 +0200
Message-ID: <20140724132954.GF28485@lunn.ch>
References: <1406154923-13612-1-git-send-email-yahoo@perenite.com>
 <1406154923-13612-2-git-send-email-yahoo@perenite.com>
 <20140723224236.GC28485@lunn.ch>
 <94F87063-D717-435B-B7C5-EDAC9B26742C@perenite.com>
 <20140723225841.GD28485@lunn.ch>
 <10A7C530-7CD2-4ED0-889A-7FAC1922320F@perenite.com>
 <20140723231535.GK23220@titan.lakedaemon.net>
 <53D0FA2F.6050209@free-electrons.com>
 <20140724124520.GV23220@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140724124520.GV23220-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Benoit Masson <benoitm-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Benoit Masson <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > Well about the issue, we patch the device tree for the i2c quirk only for
> > the openblock AX3.
> 
> Ahhh, that's right.  I need to slow down and dig a bit more. :(
> 
> > If I remember well it was because the device tree was already written
> > for this board before we found there was an issue with the A0 version
> > of the CPU. 
> 
> No, it's because we didn't think any manufacturers would be silly enough
> to use the a0 in production.  That assumption worked out well. :-P
> 
> > The rule was that for new boards then they have to set the marvell,mv78230-a0-i2c
> > compatible string. I also didn't expect that we found "new" product using the A0 version.
> > 
> > We have 3 options now:
> > 
> > - remove the check on the openblock AX3 board and always try to apply the quirck for A0 version
> > - add a check for this new board in the mvebu_dt_init function
> > - let the compatible string marvell,mv78230-a0-i2c in this dts
> > 
> > I would prefer the option 1 but I fear that Arnd would prefer the 2 other options.
> 
> I like option 1 and 3.  Option 3 is a *correct* description of the
> hardware, and should be done.  Option 1 makes Linux user-friendly for boards
> that are exactly the same, but changed out SoC stepping mid-production.

I would prefer 1 as well. It is the SoC that has the problem, not the
board. So we should not be making the quirk board specific.

       Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
