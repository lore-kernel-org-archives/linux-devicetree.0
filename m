From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 00/11] mtd: nand: add Broadcom NAND controller support
Date: Wed, 13 May 2015 21:08:16 +0200
Message-ID: <2064406.2qRO3C7BXX@wuerfel>
References: <1431478424-29230-1-git-send-email-computersforpeace@gmail.com> <5553903B.9030605@gmail.com> <20150513181447.GD11598@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150513181447.GD11598@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Corneliu Doban <cdoban-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Dan Ehrenberg <dehrenberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 13 May 2015 11:14:47 Brian Norris wrote:
> On Wed, May 13, 2015 at 10:56:11AM -0700, Florian Fainelli wrote:
> > On 12/05/15 17:53, Brian Norris wrote:
> > > Hi,
> > > 
> > > This is the fourth (and final?) version of support for the Broadcom BCM7xxx
> > > Set-Top Box NAND controller. This controller has been used in a variety of
> > > Broadcom SoCs.
> > > 
> > > Tested to work on Cygnus, BCM7445, and BCM63138.
> > 
> > Applied patches 4, 9 and 10 to devicetree/next, the others should go via
> > your tree, right?
> 
> Yes. Not sure if I'll be reworking the others any more based on Arnd's
> comments, but at least the device tree stuff has stabilized, I expect.

You can always change it with a patch on top, but that's between you
and the drivers/mtd maintainer ;-)

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
