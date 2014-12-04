From: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Subject: Re: [Patch v2 1/2] gpio: add GPIO hogging mechanism
Date: Thu, 4 Dec 2014 16:27:00 +0200
Message-ID: <0EF6A712-5FF1-41BE-B8A9-21ABE7FE37F9@antoniou-consulting.com>
References: <1416527684-19017-1-git-send-email-bparrot@ti.com> <1416527684-19017-2-git-send-email-bparrot@ti.com> <CAAVeFu+VZiuzobB7McSAUehKUHJjBv1o8ZpYjSHJAKjr3o5wTA@mail.gmail.com> <20141201163639.GI25249@lukather> <CAAVeFuLTupDenZdSi8KO+dYsf-ekcqjsDaQ2GEzYpBG34oF7Zw@mail.gmail.com> <CACRpkdZcNcPBYQM438CZJx1gYst9BFBSTj-3Qv2aPGF9pdWa5g@mail.gmail.com> <20141202161227.GH30256@lukather> <CAAVeFu+Gms6ptyK6j1Zy_wWg+9URs+9zBu=pOiwiEERO=8NjNw@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFu+Gms6ptyK6j1Zy_wWg+9URs+9zBu=pOiwiEERO=8NjNw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Jiri Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Alexandre,

I tried to stay away while things are being fleshed out but=E2=80=A6

> On Dec 4, 2014, at 16:15 , Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=
:
>=20
> On Wed, Dec 3, 2014 at 1:12 AM, Maxime Ripard
> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> On Tue, Dec 02, 2014 at 03:29:46PM +0100, Linus Walleij wrote:
>>> On Tue, Dec 2, 2014 at 3:13 PM, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
>>>> On Tue, Dec 2, 2014 at 1:36 AM, Maxime Ripard
>>>> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>>>=20
>>>>> The only thing I'd like to have would be that the request here wo=
uld
>>>>> be non-exclusive, so that a later driver would still be allowed l=
ater
>>>>> on to request that GPIO later on and manage it itself (ideally us=
ing
>>>>> the usual gpiod_request function).
>>>>=20
>>>> Actually we have a plan (and I have some code too) to allow multip=
le
>>>> consumers per GPIO. Although like Benoit I wonder why you would wa=
nt
>>>> to hog a GPIO and then request it properly later. Also, that proba=
bly
>>>> means we should abandon the hog since it actively drives the line =
and
>>>> would interfere with the late requested. How to do that correctly =
is
>>>> not really clear to me.
>>>=20
>>> I don't get the usecase. A hogged GPIO is per definition hogged.
>>> This sounds more like "initial settings" or something, which is ano=
ther
>>> usecase altogether.
>>=20
>> We do have one board where we have a pin (let's say GPIO14 of the ba=
nk
>> A) that enables a regulator that will provide VCC the bank B.
>>=20
>> Now, both banks are handled by the same driver, but in order to have=
 a
>> working output on the bank B, we do need to set GPIO14 as soon as
>> we're probed.
>>=20
>> Just relying on the usual deferred probing introduces a circular
>> dependency between the gpio-regulator that needs to grab its GPIO fr=
om
>> a driver not there yet, and the gpio driver that needs to enable its
>> gpio-regulator.
>=20
> I don't get it. According to what you said, the following order shoul=
d
> go through IIUC:
>=20
> 1) bank A is probed, gpio 14 is available
> 2) gpio-regulator is probed, acquires GPIO 14, regulator for Bank B i=
s available
> 3) bank B is probed, grabs its regulator and turn it on, probes.
>=20
> What am I missing?
>=20
>>=20
>> GPIO hogging needs to be the ideal solution for that, since we can
>> just enforce the GPIO14 value as the driver is probed, which provide=
s
>> the guarantee that any driver using the bank B will actually drive t=
he
>> GPIO it might use.
>=20
> At this point I start wondering if such initial setup should not be
> the job of the bootloader? GPIO hogging ought to be simple and
> definitive, adding the possibility to have it just as an initial valu=
e
> would considerably complexify it. E.g. when is the gpio chip driver
> supposed to release the hogged descriptor in such a case?
>=20

Do not count on the bootloader setting up anything. The trend is
for the bootloader to setup the minimal environment to load your kernel
and jump to it.

http://www.denx.de/wiki/pub/U-Boot/MiniSummitELCE2013/2013-ELCE-U-Boot-=
=46alcon-Boot.pdf


> Note that if the multiple GPIO consumer feature we are planning goes
> through, you should be able to use both hogging *and* a regulator on
> the same GPIO and achieve what you want. The expectation of multiple
> consumers is that the board designers know what they are doing, and
> this case would certainly fit (chip hogs the line and doesn't touch
> the value after that, letting the regulator control it without any
> conflict afterwards), although it would of course be better to solve
> the issue through regular probing...


That=E2=80=99s why I was advocating a simple probing driver for all thi=
s.
=46igure out a way for this driver to be probed first would be an easie=
r
solution that what=E2=80=99s going on here.

Regards

=E2=80=94 Pantelis


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
