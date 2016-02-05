From: Olivier Blin <dev-RZzICDNEOQ/YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: bcm2835: dt: Add the ethernet to the device trees
Date: Fri, 05 Feb 2016 16:07:53 +0100
Message-ID: <m38u2z6vqu.fsf@euphor.blino.org>
References: <1454571364-24708-1-git-send-email-lkundrak@v3.sk>
	<1454571364-24708-2-git-send-email-lkundrak@v3.sk>
	<m3fux76xqa.fsf@euphor.blino.org> <1454684126.2779.2.camel@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454684126.2779.2.camel-NGH9Lh4a5iE@public.gmane.org> (Lubomir Rintel's message of
	"Fri, 05 Feb 2016 15:55:26 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, popcornmix <popcornmix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org> writes:

>> Though, I am not really DT-literate, but shouldn't the ethernet bloc=
k
>> use the PID from the ethernet device?
>> The usbether device is 9514 on RPi2, while ec00 is the hub.
>
> Are you sure? I didn't check on RPi2, but I check the Models B and B+
> and the ethernet device was 0xec00 on both. The driver attaches to th=
at
> product ID:
>
> [lkundrak@odvarok linux]$ modinfo smsc95xx |grep EC
> alias:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0usb=
:v0424pEC00d*dc*dsc*dp*ic*isc*ip*in*
> [lkundrak@odvarok linux]$ modinfo smsc95xx |grep 9514
> [lkundrak@odvarok linux]$

My mistake, I am not sure how I mixed that.
Sorry for the noise.

Tested-by: Olivier Blin <dev-RZzICDNEOQ/YtjvyW6yDsg@public.gmane.org>

Thanks

--=20
Olivier Blin - blino
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
