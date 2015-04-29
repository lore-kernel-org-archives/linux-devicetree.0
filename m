From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: BCM2836 (Raspberry Pi 2) port
Date: Tue, 28 Apr 2015 20:41:45 -0700
Message-ID: <554052F9.5040305@gmail.com>
References: <1429639796-2169-1-git-send-email-eric@anholt.net> <5540443C.8070604@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5540443C.8070604-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 04/28/15 19:38, Stephen Warren a =C3=A9crit :
> On 04/21/2015 12:09 PM, Eric Anholt wrote:
>> This is my first submission of a Raspberry Pi 2 port.  It can be fou=
nd
>> at https://github.com/anholt/linux/tree/bcm2836
>>
>> I'm using the 2835 interrupt controller support, without adding the
>> checks for ARM local interrupts first.  That means no support for IP=
Is
>> (and thus no SMP), no PMU events, and no local timer (I'm using the
>> same 2835 peripheral one).
>>
>> It supports a similar featureset to Pi 1 at this point.  Serial and =
SD
>> cards work.  Just one CPU supported.  USB (ethernet) works if you us=
e
>> U-Boot, or my mailbox series
>> (https://github.com/anholt/linux/tree/bcm2836-mbox).
>=20
> Tested-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>=20
> I applied the patches on top of korg's linux-rpi.git for-rpi-next,
> resolved the io_map conflicts, and tested without U-Boot.

Should we start thinking about routing bcm2835/36 changes through the
same Broadcom pull request as we do for the every other SoCs within
mach-bcm: 63xx, 53xx/47xx, brcmstb, cygnus at some point?

I don't have any strong feelings either way, just curious if this is
something remotely desireable from an arm-soc maintainer role perspecti=
ve.

Thanks!
--
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
