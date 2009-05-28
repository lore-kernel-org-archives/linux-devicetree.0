From: Robert Schwebel <robert@schwebel.de>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 16:24:20 +0200
Message-ID: <20090528142420.GD6805@pengutronix.de>
References: <1243408083.13460.14.camel@debian-nb> <fa686aa40905270727m31250984tf12249fc87179ce9@mail.gmail.com> <ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com> <20090527150527.GK6805@pengutronix.de> <87vdnm8sec.fsf@macbook.be.48ers.dk> <4A1D6901.2090508@freescale.com> <20090527175609.GB31861@flint.arm.linux.org.uk> <4A1D8FBA.6040802@freescale.com> <9e4733910905271213k7f4b93e7i7e6f2af24d85f@mail.gmail.com> <20090528141743.GA16199@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1763352AbZE1OYo@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090528141743.GA16199@trinity.fluff.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: Jon Smirl <jonsmirl@gmail.com>, Scott Wood <scottwood@freescale.com>, Russell King <rmk+lkml@arm.linux.org.uk>, Peter Korsgaard <jacmet@sunsite.dk>, Robert Schwebel <r.schwebel@pengutronix.de>, devicetree-discuss <devicetree-discuss@ozlabs.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk, Janboe Ye <yuan-bo.ye@motorola.com>, Timur Tabi <timur@freescale.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 28, 2009 at 03:17:43PM +0100, Ben Dooks wrote:
> I was wondering what the pros/cons of having a system that takes a
> device tree and manufactures platform devices / etc from it? I think
> one of the cons is that if you change the platform device data, then
> you have not only the board definitions to change, but the of->platform
> code to modify as well...

I think a unification of both data structures would be much better than
having two of them ontop of each other.

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
