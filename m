From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/4] UART slave device support - version 4
Date: Mon, 1 Jun 2015 07:01:34 +0900
Message-ID: <20150531220134.GE13872@kroah.com>
References: <20150511013540.5709.93626.stgit@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150511013540.5709.93626.stgit@notabene.brown>
Sender: linux-kernel-owner@vger.kernel.org
To: NeilBrown <neil@brown.name>
Cc: Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robherring2@gmail.com>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, GTA04 owners <gta04-owner@goldelico.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, May 11, 2015 at 11:56:14AM +1000, NeilBrown wrote:
> Hi all,
>  here is version 4 of my "UART slave device" patch set, previously
>  known as "tty slave devices".
> 
>  The most obvious change is the name.  I realized that this isn't
>  really about "tty"s at all - it is about UARTs.

Then next time you might also want to cc: the linux-serial mailing list
so the developers there can review it :)

thanks,

greg k-h
