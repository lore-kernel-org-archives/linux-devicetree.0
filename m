From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 6/6] mfd: dt: Move syscon bindings to syscon subdirectory
Date: Tue, 13 Dec 2016 13:17:16 +0100
Message-ID: <5094120.Y7DXfRGTEm@wuerfel>
References: <20161206025321.1792-1-andrew@aj.id.au> <20161213110710.GV3625@dell.home> <1481630734.3112.40.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481630734.3112.40.camel-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday, December 13, 2016 10:35:34 PM CET Andrew Jeffery wrote:
> On Tue, 2016-12-13 at 11:07 +0000, Lee Jones wrote:
> > On Tue, 13 Dec 2016, Andrew Jeffery wrote:
> > > On Mon, 2016-12-12 at 09:39 -0600, Rob Herring wrote:
> > > > On Tue, Dec 06, 2016 at 01:53:21PM +1100, Andrew Jeffery wrote:
> > > 
> > > Lee's next email in the chain poked Arnd for an opinion, but Arnd
> > > didn't reply.
> > > 
> > > I don't mind. I moved these bindings separately so we could just drop
> > > the patch if there was push-back. If we drop the whole idea I'll need
> > > to apply a small fix to patch 5/6 to avoid creating the syscon
> > > subdirectory.
> > 
> > The sub-directory is a good idea for drivers who are *solely* syscon
> > based.
> > 
> 
> Yes, I wasn't saying otherwise, just commenting on my motivation and
> approach.
> 
> As far as I can tell all of the bindings I move here describe solely
> syscon-based devices.
> 

But do we know which ones they are?

In principle, any syscon device node can have a specialized driver
exporting an interface, the bindings always allow it to be done
one way or the other, and we may change the driver or run a different
OS that has decided differently.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
