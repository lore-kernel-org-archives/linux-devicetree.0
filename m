From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 3/4] TTY: add support for uart_slave devices.
Date: Tue, 12 May 2015 10:31:01 +0200
Message-ID: <1431419461.2398.132.camel@x220>
References: <20150511013540.5709.93626.stgit@notabene.brown>
	 <20150511015614.5709.16746.stgit@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150511015614.5709.16746.stgit@notabene.brown>
Sender: linux-kernel-owner@vger.kernel.org
To: NeilBrown <neil@brown.name>
Cc: Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robherring2@gmail.com>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, GTA04 owners <gta04-owner@goldelico.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Just a nit: a license mismatch.

On Mon, 2015-05-11 at 11:56 +1000, NeilBrown wrote:
> --- /dev/null
> +++ b/drivers/tty/serial/slave/uart_slave_core.c

> + *    This program is free software; you can redistribute it and/or modify
> + *   it under the terms of the GNU General Public License as published by
> + *   the Free Software Foundation; either version 2 of the License, or
> + *   (at your option) any later version.
> + *
> + *    This program is distributed in the hope that it will be useful,
> + *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *   GNU General Public License for more details.

This states the license is GPL v2 or later.

> +MODULE_LICENSE("GPL v2");

And, according to include/linux/module.h, this states the license is
just GPL v2. So I think either the comment at the top of this file or
the license ident used in the MODULE_LICENSE() macro needs to change.

Thanks,


Paul Bolle
