From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [Gta04-owner] [PATCH 2/3] TTY: add support for tty_slave devices.
Date: Fri, 27 Mar 2015 07:09:56 -0400
Message-ID: <55153A84.8000302@hurleysoftware.com>
References: <20150318055437.21025.13990.stgit@notabene.brown>	<20150318055831.21025.85317.stgit@notabene.brown>	<5512E288.4020703@hurleysoftware.com> <20150326081729.700a7a6e@notabene.brown>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150326081729.700a7a6e@notabene.brown>
Sender: linux-kernel-owner@vger.kernel.org
To: NeilBrown <neilb@suse.de>
Cc: NeilBrown <neil@brown.name>, Mark Rutland <mark.rutland@arm.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sebastian Reichel <sre@kernel.org>, linux-kernel@vger.kernel.org, GTA04 owners <gta04-owner@goldelico.com>, Pavel Machek <pavel@ucw.cz>, Grant Likely <grant.likely@linaro.org>, Jiri Slaby <jslaby@suse.cz>
List-Id: devicetree@vger.kernel.org

On 03/25/2015 05:17 PM, NeilBrown wrote:
> On Wed, 25 Mar 2015 12:30:00 -0400 Peter Hurley <peter@hurleysoftware.com>
> wrote:
> 
>> On 03/18/2015 01:58 AM, NeilBrown wrote:
>>
>>> + * A "tty-slave" is a device permanently attached to a particularly
>>> + * tty, typically wired to a UART.
>>
>> Why "permanently"?
>> Is that a limitation of the implementation or design?
>>
> 
> The slave is described in devicetree - that only happens for permanently
> attached devices, doesn't it?
> 
> I guess that with device-tree overlays and 'capes' for boards you could have
> a device attached to the uart "for this power session" rather than
> "permanently", but I think it is a rather subtle distinction.
> 
> Did you have something else in mind?

My primary concern is that the abstraction match the scope.

If the abstraction is at the tty layer, then the scope of the design
should support tty devices, not just hard-wired, devicetree-defined uarts.

Regards,
Peter Hurley
