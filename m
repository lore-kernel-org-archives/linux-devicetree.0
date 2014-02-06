From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: Kirkwood: Add support for many Synology NAS
 devices
Date: Thu, 6 Feb 2014 12:26:55 -0500
Message-ID: <20140206172655.GG8533@titan.lakedaemon.net>
References: <1391634309-3123-1-git-send-email-andrew@lunn.ch>
 <20140206153939.GD8533@titan.lakedaemon.net>
 <20140206160126.GH29860@lunn.ch>
 <107057891.kz6j7UkZNk@wuerfel>
 <20140206170333.GK29860@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140206170333.GK29860-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 06, 2014 at 06:03:33PM +0100, Andrew Lunn wrote:
> On Thu, Feb 06, 2014 at 05:38:28PM +0100, Arnd Bergmann wrote:
> > On Thursday 06 February 2014 17:01:26 Andrew Lunn wrote:
> > 
> > > , but this is, imho,
> > > > over-fragmenting.  I'm sure there's a reason you chose this path, but
> > > > you haven't explained why in your commit log. So I'm left guessing...
> > > 
> > > Synology seem to build there devices like lego. They have two
> > > different RTC blocks. They have three different fan alarm blocks, four
> > > different led blocks, etc. And to build a product, the just select a
> > > group of blocks and put them together.
> > 
> > I guess the Armada-370 and newer based ds213j and dsx14 will also be
> > able to reuse some of the blocks, right?
> 
> Hi Arnd
> 
> I've not looked at any sources for those yet. I guess the RTC .dtsi
> files should be reusable. The ethernet driver on 370 is different so
> no re-use there. Maybe the fan controller, but the rest will depend on
> what GPIO lines they have used, if they are compatible.

perhaps all of the pinctrl nodes should be moved into synology-6281,
synology-6282, and synology-370 ?

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
