From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH 1/3] usb: host: st-hcd: Add USB HCD support for STi SoCs
Date: Mon, 14 Jul 2014 10:58:54 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1407141054010.10763-100000@netrider.rowland.org>
References: <20140714083549.GK2954@lee--X1>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140714083549.GK2954@lee--X1>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kernel development list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 14 Jul 2014, Lee Jones wrote:

> On Fri, 11 Jul 2014, Alan Stern wrote:
> > On Fri, 11 Jul 2014, Peter Griffin wrote:
> > > On Thu, 10 Jul 2014, Alan Stern wrote:
> > > 
> > > > On Thu, 10 Jul 2014, Peter Griffin wrote:
> > > > 
> > > > > This driver adds support for the USB HCD present in STi
> > > > > SoC's from STMicroelectronics. It has been tested on the
> > > > > stih416-b2020 board.
> > > > 
> > > > This driver file, along with the Kconfig changes, belongs in the
> > > > arch/platform-specific source directory.  Not in drivers/usb/host/.  
> > > > It is, after all, a platform driver that registers two platform
> > > > devices.
> > > 
> > > Why do think that?
> > 
> > Because it is true.  One can easily see that st-hcd.c is a platform
> > driver: It contains a module_platform_driver() line and a struct
> > platform_driver definition near the end.  And it registers a platform
> > device by calling platform_device_add() in st_hcd_device_create(),
> > which is called twice by st_hcd_probe().
> 
> You are correct that this is indeed a platform driver and in the 'old
> days' these would have been stuffed into the ARM sub-architecture
> directories.  However, these became far too bloated and created too
> much churn which angered Linus.  A great deal has changed since his
> ARM rant [1].  All drivers (platform or otherwise) are now to live in
> 'drivers', which makes a great deal of sense really, doesn't it?
> 
> Did you grep kernel wide for module_platform_driver()?
> 
> $ git grep module_platform_driver -- arch/ | wc -l
> 12
> 
> $ git grep module_platform_driver -- drivers/ | wc -l
> 1138
> 
> Most platform drivers have already been moved.

Okay, I grant the point.  Objections withdrawn.  Fix up the spelling 
error and the other stuff in the Kconfig help text, and this will be 
acceptable.

Alan Stern

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
