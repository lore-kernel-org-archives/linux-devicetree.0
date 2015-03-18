From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 2/3] TTY: add support for tty_slave devices.
Date: Wed, 18 Mar 2015 10:11:35 +0100
Message-ID: <1426669895.2649.7.camel@tiscali.nl>
References: <20150318055437.21025.13990.stgit@notabene.brown>
	 <20150318055831.21025.85317.stgit@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150318055831.21025.85317.stgit@notabene.brown>
Sender: linux-kernel-owner@vger.kernel.org
To: NeilBrown <neil@brown.name>
Cc: Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Peter Hurley <peter@hurleysoftware.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, GTA04 owners <gta04-owner@goldelico.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Just two nits to look into once you get to fix up all the smaller
issues.

NeilBrown schreef op wo 18-03-2015 om 16:58 [+1100]:
> --- /dev/null
> +++ b/drivers/tty/slave/Kconfig
> @@ -0,0 +1,7 @@
> +menuconfig TTY_SLAVE
> +	tristate "TTY slave devices"
> +	depends on OF
> +	help
> +	  Devices which attach via a uart, but need extra
> +	  driver support for power management etc.
> +

This blank line makes "git am" whine: "new blank line at EOF".

> --- /dev/null
> +++ b/drivers/tty/slave/tty_slave_core.c

[...]

This file doesn't have a MODULE_LICENSE() macro. So I think that, if
this driver is built as a module and loaded, kernel/module.c will set
its license to "unspecified" and taint the kernel.


Paul Bolle
