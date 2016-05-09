From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH (v5) 3/11] MIPS: bmips: Add bcm6345-l2-timer interrupt
 controller
Date: Mon, 9 May 2016 06:06:05 -0700
Message-ID: <57308B3D.3020502@roeck-us.net>
References: <5650BFD6.5030700@simon.arlott.org.uk>
 <CAOiHx=k0Aa+qrBT1J7_cQaQRxndBmwsgSgi3x0eJOYTAy6Zq7Q@mail.gmail.com>
 <5653612A.4050309@simon.arlott.org.uk> <565361AF.20400@simon.arlott.org.uk>
 <70d031ae4c3aa29888d77b64686c39e7e7eaae92@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <5654E67A.9060800@gmail.com> <5657886F.3090908@simon.arlott.org.uk>
 <alpine.DEB.2.11.1511270926580.3572@nanos>
 <56599D73.7040801@simon.arlott.org.uk> <565CE85A.3080904@roeck-us.net>
 <256BE4660FB03085.33070B6A-E0AC-4643-92B8-4FD874210CD9@mail.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <256BE4660FB03085.33070B6A-E0AC-4643-92B8-4FD874210CD9-jAs8HypviEooOQlpcoRfSA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Miguel Gaio <miguel.gaio-HH44TBFINEIAvxtiuMwx3w@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/09/2016 05:01 AM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
> Hello Guenter,
>
> Are there any other issues preventing this patches from being merged?
>

My major problem/concern is the interrupt handling and the repeated
restart of the hardware timer with continuously reduced timeouts.
This appears fragile, and it doesn't really make sense from a system
level point of view. Unfortunately, I don't have a data sheet for
the chip, nor the means or the time to test it myself. So we are pretty
much in limbo, unless someone from Broadcom confirms that, yes, this is
the one and expected means to program this watchdog.

Guenter

> Regards,
> =C3=81lvaro.
> _____________________________
> From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org <mailto:linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>>
> Sent: martes, diciembre 1, 2015 1:23 a. m.
> Subject: Re: [PATCH (v5) 3/11] MIPS: bmips: Add bcm6345-l2-timer inte=
rrupt controller
> To: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org <mailto:simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>>, Thom=
as Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org <mailto:tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>>
> Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org <mailto:ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>>, =
Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org <mailto:linux-k=
ernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org <mailto:mar=
k.rutland-5wv7dgnIgG8@public.gmane.org>>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <mailto:f.f=
ainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org <mailt=
o:ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <=
mailto:cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>>, MIPS Mailing List <linux-mips@linux-mips.o=
rg <mailto:linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>>, Kumar Gala <galak-sgV2jX0FEOJiIJoWrK/4GQ@public.gmane.org=
g <mailto:galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>>, Miguel Gaio <miguel.gaio-HH44TBFINEIAvxtiuMwx3w@public.gmane.org <m=
ailto:miguel.gaio-HH44TBFINEIAvxtiuMwx3w@public.gmane.org>>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org <mailto:j=
ogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org <mailto:marc.zyng=
ier-5wv7dgnIgG8@public.gmane.org>>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org <mailto:pawel.moll-AbSShOkvfpQ@public.gmane.org=
m>>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org <mailto:robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>>, <dev=
icetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org <mailto:devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>>, Maxime
> Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org <mailto:mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>>, Wim Van Sebroec=
k <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org <mailto:wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>>, <linux-watchdog-u79uwXL29TbrhsbdSgBK9A@public.gmane.org=
rg <mailto:linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>>, Jason Cooper <jason@lakeda=
emon.net <mailto:jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>>
>
>
> On 11/28/2015 04:26 AM, Simon Arlott wrote:
>  > Add the BCM6345/BCM6318 timer as an interrupt controller so that i=
t can be
>  > used by the watchdog to warn that its timer will expire soon.
>  >
>  > Support for clocksource/clockevents is not implemented as the time=
r
>  > interrupt is not per CPU (except on the BCM6318) and the MIPS cloc=
k is
>  > better. This could be added later if required without changing the=
 device
>  > tree binding.
>  >
>  > Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org <mailto:simon@fire.=
lp0.eu>>
>
> Hi Simon,
>
> can you please re-send the entire series, with all Acked-by:/Reviewed=
-by:
> tags as appropriate ?
>
> Thanks,
> Guenter
>
>
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
