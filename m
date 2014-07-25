From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: at91: at91sam9x5: sets NPCS0 (PA14) back to GPIO
Date: Fri, 25 Jul 2014 11:31:10 +0200
Message-ID: <20140725113110.70c4aa41@bbrezillon>
References: <1405074175-22444-1-git-send-email-voice.shen@atmel.com>
	<53D10C50.50305@aksignal.cz>
	<20140724162645.4e19c26c@bbrezillon>
	<53D12103.3020103@aksignal.cz>
	<20140724175848.44f5da10@bbrezillon>
	<53D1F5D0.1080006@aksignal.cz>
	<20140725095319.16a8465c@bbrezillon>
	<53D214E1.4050105@aksignal.cz>
	<20140725104553.403921b1@bbrezillon>
	<53D21B3F.7060006@aksignal.cz>
	<20140725110124.3f0dce6c@bbrezillon>
	<53D21FCF.7010402@aksignal.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53D21FCF.7010402-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org
Cc: Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 25 Jul 2014 11:13:51 +0200
Ji=C5=99=C3=AD Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org> wrote:


> >
> > Every thing seems in place.
> > Could you enable CONFIG_DEBUG_PINCTRL and grep on "enable pin" ?
> / # dmesg | grep "enable pin"
> [    0.968750] pinctrl-at91 ahb:apb:pinctrl@fffff400: enable pin 101 =
as GPIO
> [    0.968750] pinctrl-at91 ahb:apb:pinctrl@fffff400: enable pin 101 =
as PIOD5 0x20
> [    0.968750] pinctrl-at91 ahb:apb:pinctrl@fffff400: enable pin 100 =
as GPIO
> [    0.968750] pinctrl-at91 ahb:apb:pinctrl@fffff400: enable pin 100 =
as PIOD4 0x10
> [    1.238281] pinctrl-at91 ahb:apb:pinctrl@fffff400: enable pin 23 a=
s GPIO
> [    1.238281] pinctrl-at91 ahb:apb:pinctrl@fffff400: enable pin 23 a=
s PIOA23 0x800000
> [    1.238281] pinctrl-at91 ahb:apb:pinctrl@fffff400: enable pin 22 a=
s GPIO
> [    1.238281] pinctrl-at91 ahb:apb:pinctrl@fffff400: enable pin 22 a=
s PIOA22 0x400000
> [    1.242187] pinctrl-at91 ahb:apb:pinctrl@fffff400: enable pin 93 a=
s GPIO
> [    1.242187] pinctrl-at91 ahb:apb:pinctrl@fffff400: enable pin 93 a=
s PIOC29 0x20000000
> [    1.246093] pinctrl-at91 ahb:apb:pinctrl@fffff400: enable pin 14 a=
s GPIO
> [    1.246093] pinctrl-at91 ahb:apb:pinctrl@fffff400: enable pin 14 a=
s PIOA14 0x4000


Okay, this cleary shows that PA14 pin is muxed as a GPIO (or at least
the driver think it is).


Could you launch these commands (you'll need the devmem tool) and
paste the results ?

#devmem 0xfffff408
#devmem 0xfffff418
#devmem 0xfffff438
#devmem 0xfffff43c
#devmem 0xfffff458
#devmem 0xfffff468
#devmem 0xfffff470
#devmem 0xfffff474
#devmem 0xfffff498

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
