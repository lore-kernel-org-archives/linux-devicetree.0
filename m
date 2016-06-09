From: Mychaela Falconia <mychaela.falconia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] mtd: nand: Add support for Evatronix NANDFLASH-CTRL
Date: Thu, 9 Jun 2016 09:24:19 -0800
Message-ID: <CA+uuBqb4fG4nK7atrF7XOQ=ip2SfKrxU+KXqD3W+PA_ZA7cS3g@mail.gmail.com>
References: <alpine.DEB.2.02.1606020948070.19416@lnxricardw1.se.axis.com>
 <20160603165909.09f27ee0@bbrezillon> <alpine.DEB.2.02.1606071702220.19416@lnxricardw1.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.02.1606071702220.19416-0r+fHKsYbBpkgkEezDIDgepEb+yt5a1K@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ricard Wanderlof <ricard.wanderlof-VrBV9hrLPhE@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>, Linux mtd <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 6/9/16, Ricard Wanderlof <ricard.wanderlof-VrBV9hrLPhE@public.gmane.org> wrote:
> The designers of this IP apparantly did not have Linux in mind when they
> designed the controller, since it does all the low level stuff
> autonomously (in the right IP configuration it can even remap flash blocks
> transparently), with no way of intervening. For instance, when doing
> hardware ECC, the OOB data is not available anywhere to the user, and if
> one wants to actually read it a separate OOB write needs to be done. I
> think the target market for the IP is really a general real time OS where
> there is no NAND driver available, and you just want to fire off a single
> high level command, wait for an interrupt, and have your data waiting for
> you.

I expect to see more and more newer NAND flash controllers that are
like this. The one I am working with (FTNANDC024 from Faraday) is like
this too - very very high-level.

> This latter property is actually advantageous in Linux too as the driver
> doesn't have to do bit- and byte-banging against the NAND flash. I'm not
> sure what the gain in overhead is in practice, but at any rate there's not
> much of a choice.

It should be advantageous to any OS that uses the abstractions
provided by the hardware instead of fighting them. The problem is that
the Linux MTD system's current idea of what a NAND controller should
look like is now out of sync with the new hardware realities.

> Given that the controller does not have the transparency that the
> ->cmd_ctrl() approach requires, as noted above, I can't see how it could
> be simplified.
>
> I basically need to grab everything needed for a given operation and
> interpret it before handing it over to the controller. I considered using
> a higher level API, by replacing the default ->cmdfunc() (default
> nand_command/nand_command_lp) with a specific version, which would have
> avoided the need to interpret the NAND commands arriving via ->cmd_ctrl(),
> but that meant duplicating some of the logic in nand_base.c which seemed
> like a bad idea.

For my FTNANDC024 driver I went for an ever more radical approach: I
decided to forego the "nand" layer in Linux entirely and attach my
driver directly to the MTD layer. There is very little that
nand_base.c provides that is useful to a high-level controller whose
abstractions are "read these logical sectors", "write these logical
sectors" and "erase these blocks", it is really only useful for the
simpler NAND controllers that don't do all of the heavy lifting in
hardware.

And it is NOT a question of "optimization" - the problem is not that
going through the paradigm imposed by nand_base.c precludes the use of
some optional higher-performance features of smart controllers -
instead the controllers which you and I are working with *require* the
use of their highly abstracted interfaces, and *do not* provide any
kind of raw or transparent pass-through mode.

M~
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
