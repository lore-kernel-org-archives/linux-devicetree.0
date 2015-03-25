From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [PATCH 2/3] TTY: add support for tty_slave devices.
Date: Wed, 25 Mar 2015 12:30:00 -0400
Message-ID: <5512E288.4020703@hurleysoftware.com>
References: <20150318055437.21025.13990.stgit@notabene.brown> <20150318055831.21025.85317.stgit@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150318055831.21025.85317.stgit@notabene.brown>
Sender: linux-kernel-owner@vger.kernel.org
To: NeilBrown <neil@brown.name>
Cc: Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>, GTA04 owners <gta04-owner@goldelico.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03/18/2015 01:58 AM, NeilBrown wrote:

> + * A "tty-slave" is a device permanently attached to a particularly
> + * tty, typically wired to a UART.

Why "permanently"?
Is that a limitation of the implementation or design?

Regards,
Peter Hurley
