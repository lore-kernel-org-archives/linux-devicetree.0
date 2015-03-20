From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 0/3] tty slave device support - version 3.
Date: Fri, 20 Mar 2015 20:31:19 +0100
Message-ID: <20150320193119.GA28194@amd>
References: <20150318055437.21025.13990.stgit@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150318055437.21025.13990.stgit@notabene.brown>
Sender: linux-kernel-owner@vger.kernel.org
To: NeilBrown <neil@brown.name>
Cc: Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, GTA04 owners <gta04-owner@goldelico.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi!

>  here is version 3 of support for tty-slaves.
> 
>  This version introduces a new bus-type for tty-slaves, and causes
>  a tty-slave device to appear in /sys/devices between the uart and the
>  tty.
>  It effectively intercepts and calls from the tty to the uart (i.e. any
>  tty_operations) and applies extra functionality at that point.
> 
>  Currently the only driver intercepts open and close.
>  It powers on the device on open, and powers off at last-close.
> 
>  Power can be controlled by a regulator or by toggling a GPIO.
> 
>  I think I've incorporated most of the feed back I received from
>  previous versions, but if I missed something - I apologize.  If
>  this approach is structurally acceptable then I can fix up all the
>  smaller issues.

Do you have dts example? Anyway, we'll need something similar for
bluetooth on N900. But we'd like the /dev/ttyXX not to be visible to
the userspace in that case.

Thanks,
								Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
