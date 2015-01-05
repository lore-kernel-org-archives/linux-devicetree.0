From: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Subject: Re: [PATCH 1/3] TTY: add support for "tty slave" devices.
Date: Mon, 5 Jan 2015 14:43:23 +0100
Message-ID: <20150105134323.GA27863@amd>
References: <20141211214801.4127.93914.stgit@notabene.brown>
 <20141211215943.4127.24792.stgit@notabene.brown>
 <20141228142010.GA3922@amd>
 <20150103103357.2406fc23@notabene.brown>
 <20150104101847.GA6122@amd>
 <20150105200936.2ba8f596@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150105200936.2ba8f596-wvvUuzkyo1EYVZTmpyfIwg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: NeilBrown <neilb-l3A5Bk7waGM@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!

> > > N_HCI activates (registers the hci dev) on HCIUARTSETPROTO ioctl.  A child
> > >   device would need a way to specify the protocol I resume.
> > > N_MOUSE activates on a 'read' on the tty - and deactivates when the read
> > >   completes.
> > > N_GSM0710 activates immediately that the ldisc is activated, as does N_IRDA
> > > N_PPP seems to want a PPPIOCNEWUNIT ioctl to fully register.
> > > 
> > > Doing any of these in a driver for a uart slave device would certainly be
> > > possible.  I wonder if it is something we really want to do in the kernel
> > > though.  What is the gain over providing sufficient information in the
> > > KOBJ_ADD uevent so that udev can do the required work in user-space?
> > 
> > Consistency. If you have bluetooth on USB, it automatically works,
> > without userspace help. If we have mouse on USB, it automatically
> > works, etc...
> 
> My point is: why is the kernel/userspace distinction important?  As long as
> it "automatically works", does it really matter where the code is?

For some cases, it does, as "devices needed during boot". Someone is
going to attach keyboard or something powermanagement related, sooner
or later.

> We can put a little bit of code in the kernel (to report the details of the
> attached device) and a little bit of code in udev (to run hciattach) and it
> will still be automatic.

Of course, that's also possible. There will be parameters such as
speed / parity / flow control that will need to be passed, and
userland will still see /dev/ttySX device that it perhaps does not
need to see.

And there will be problems with devices such as bcm2048 on Nokia,
which is connected by a serial line and (interrupt capable) GPIO lines
and clocks. Rather than extending hciattach to pass the neccessary
GPIO/clock information and extending udev to pass GPIO/clock
information to hciattach (and extending kernel to pass it to udev and
accept from hciattach), it makes sense to just do it internally.
									Pavel
									


-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
