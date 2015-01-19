From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC] pinctrl: at91
Date: Mon, 19 Jan 2015 11:54:39 +0100
Message-ID: <54BCE26F.1030507@atmel.com>
References: <CACRpkdbkUUzVVMp14szY+vGNd+d+8bL066STh_XMGud-UsFBqA@mail.gmail.com> <1418637470-5839-1-git-send-email-ludovic.desroches@atmel.com> <54943933.60102@atmel.com> <20150106093706.GC26982@ldesroches-Latitude-E6320> <CACRpkda9wTPcRy6nRGP08rDpHV=tRyYVuD80TeO2zFGzX+aJcg@mail.gmail.com> <20150114150339.GJ3625@ldesroches-Latitude-E6320> <CACRpkdY6M=U-XA=Sd2DH6jVjCABUTSYq+oUs_DBy14M2tccrMw@mail.gmail.com> <20150119103046.GB19014@odux.rfo.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150119103046.GB19014-FuRPzXQv2LUWBfJKYY8PcdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Le 19/01/2015 11:30, Ludovic Desroches a =E9crit :
> On Mon, Jan 19, 2015 at 11:12:45AM +0100, Linus Walleij wrote:
>> On Wed, Jan 14, 2015 at 4:03 PM, Ludovic Desroches
>> <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org> wrote:
>>
>>> From my point of view, it is two distinct topics. One is a very
>>> important fix because our SAMA5D4 device is not booting without it.=
 The
>>> other one is a proper way to manage gpio ranges but alone I don't t=
hink
>>> it can solve my issue.
>>
>> Can you make me a minimal, sane patch that fixes the boot regression=
?
>>
>> I hate regressions so these need to be fixed first...
>>
>> The rest we can discuss I guess.
>>
>> Or is it not possible to solve the boot regression without the large=
r
>> fix?
>=20
> No I don't think we can have a smaller patch than this one to fix it.
> Next step is to decide if we go further as you suggested, knowing tha=
t we
> would have to modify the device tree. Moreover we will have to rework
> our pinctrl driver (or write a new one) since we will have new pio
> controller on future devices.

Yes, all the upcoming AT91 SoCs will embed a totally new pinctrl/pinmux
IP. We will write a new driver for it and we will be able to use the
up-to-date standards of the framework.

In the meantime, this fix allows us to use the SAMA5D4 without too much
changes to the original version of our current driver and without
modification to all the current SoCs device trees.

Bye,
--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
