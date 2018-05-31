From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 0/8] gnss: add new GNSS subsystem
Date: Thu, 31 May 2018 15:37:30 +0200
Message-ID: <20180531133730.GJ3259@localhost>
References: <20180530103242.20773-1-johan@kernel.org>
 <20180530143822.lvtwjvbqe7gvbvgq@localhost>
 <20180531085242.GE3259@localhost>
 <943C21CA-EEC6-45E2-997E-A6E1FA0549EB@goldelico.com>
 <20180531114743.GG3259@localhost>
 <598825FD-67A5-4016-BCE8-A50517472B8F@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <598825FD-67A5-4016-BCE8-A50517472B8F@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Johan Hovold <johan@kernel.org>, Richard Cochran <richardcochran@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andreas Kemnade <andreas@kemnade.info>, Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, Marcel Holtmann <marcel@holtmann.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, May 31, 2018 at 03:33:41PM +0200, H. Nikolaus Schaller wrote:
> > Am 31.05.2018 um 13:47 schrieb Johan Hovold <johan@kernel.org>:

> > Using pps-gpio would not allow you to describe the hardware properly,
> > something which, for example, may be needed for power management (e.g.
> > to power on the GNSS receiver when the pps device is being accessed).
> 
> Yes, that is indeed a very valid reason to do it that way as the pps-gpio
> seems to assume an always-on impulse source.
> 
> On the other hand it looks as if the pps framework can't tell the
> source when to power on/off because it does not notify when it
> is being accessed or not:
> 
> https://elixir.bootlin.com/linux/v4.17-rc7/source/drivers/pps/pps.c#L305

Yeah, we may need to address that when/if we get there.

Thanks,
Johan
