From: Pantelis Antoniou <panto@antoniou-consulting.com>
Subject: Re: [Patch v2 1/2] gpio: add GPIO hogging mechanism
Date: Thu, 4 Dec 2014 17:22:50 +0200
Message-ID: <8717617A-56AE-495C-B873-0B2E3EA83060@antoniou-consulting.com>
References: <1416527684-19017-1-git-send-email-bparrot@ti.com> <1416527684-19017-2-git-send-email-bparrot@ti.com> <CAAVeFu+VZiuzobB7McSAUehKUHJjBv1o8ZpYjSHJAKjr3o5wTA@mail.gmail.com> <20141201163639.GI25249@lukather> <CAAVeFuLTupDenZdSi8KO+dYsf-ekcqjsDaQ2GEzYpBG34oF7Zw@mail.gmail.com> <CACRpkdZcNcPBYQM438CZJx1gYst9BFBSTj-3Qv2aPGF9pdWa5g@mail.gmail.com> <20141202161227.GH30256@lukather> <CAAVeFu+Gms6ptyK6j1Zy_wWg+9URs+9zBu=pOiwiEERO=8NjNw@mail.gmail.com> <0EF6A712-5FF1-41BE-B8A9-21ABE7FE37F9@antoniou-consulting.com> <CAAVeFu+kfPi8CUR-YergQv9P1wMBzOik_Q1KBKMTVY1Gg_FBzg@mail.gmail.com> <C9DBE2F0-A725-4D05-BEC6-F083F3F83B9F@antoniou-consulting.com> <CAAVeFuKx1uWVh-TQeFKN4uS9TyzQH4BbQ2q1yM4uJsnQdfdzPQ@mail.gmail.com> <D73736E8-DC33-4F98-82DD-DF42B989A453@antoniou-consulting.com> <CAAVeFu+d5R6cK
 aXOgkU-ve8uy4jPGWJrDUrnARXs=ufe_p+RFg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAVeFu+d5R6cKaXOgkU-ve8uy4jPGWJrDUrnARXs=ufe_p+RFg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, Benoit Parrot <bparrot@ti.com>, Jiri Prchal <jiri.prchal@aksignal.cz>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

Hi Alexandre,

> On Dec 4, 2014, at 17:10 , Alexandre Courbot <gnurou@gmail.com> wrote=
:
>=20
> On Fri, Dec 5, 2014 at 12:02 AM, Pantelis Antoniou
> <panto@antoniou-consulting.com> wrote:
>> Hi Alexandre,
>>=20
>>> On Dec 4, 2014, at 16:58 , Alexandre Courbot <gnurou@gmail.com> wro=
te:
>>>=20
>>> On Thu, Dec 4, 2014 at 11:47 PM, Pantelis Antoniou
>>> <panto@antoniou-consulting.com> wrote:
>>>> Hi Alexandre,
>>>>=20
>>>>> On Dec 4, 2014, at 16:41 , Alexandre Courbot <gnurou@gmail.com> w=
rote:
>>>>>=20
>>>>> On Thu, Dec 4, 2014 at 11:27 PM, Pantelis Antoniou
>>>>> <panto@antoniou-consulting.com> wrote:
>>>>>> Hi Alexandre,
>>>>>>=20
>>>>>> I tried to stay away while things are being fleshed out but=E2=80=
=A6
>>>>>>=20
>>>>>>> On Dec 4, 2014, at 16:15 , Alexandre Courbot <gnurou@gmail.com>=
 wrote:
>>>>>>>=20
>>>>>>> On Wed, Dec 3, 2014 at 1:12 AM, Maxime Ripard
>>>>>>> <maxime.ripard@free-electrons.com> wrote:
>>>>>>>> On Tue, Dec 02, 2014 at 03:29:46PM +0100, Linus Walleij wrote:
>>>>>>>>> On Tue, Dec 2, 2014 at 3:13 PM, Alexandre Courbot <gnurou@gma=
il.com> wrote:
>>>>>>>>>> On Tue, Dec 2, 2014 at 1:36 AM, Maxime Ripard
>>>>>>>>>> <maxime.ripard@free-electrons.com> wrote:
>>>>>>>>>=20
>>>>>>>>>>> The only thing I'd like to have would be that the request h=
ere would
>>>>>>>>>>> be non-exclusive, so that a later driver would still be all=
owed later
>>>>>>>>>>> on to request that GPIO later on and manage it itself (idea=
lly using
>>>>>>>>>>> the usual gpiod_request function).
>>>>>>>>>>=20
>>>>>>>>>> Actually we have a plan (and I have some code too) to allow =
multiple
>>>>>>>>>> consumers per GPIO. Although like Benoit I wonder why you wo=
uld want
>>>>>>>>>> to hog a GPIO and then request it properly later. Also, that=
 probably
>>>>>>>>>> means we should abandon the hog since it actively drives the=
 line and
>>>>>>>>>> would interfere with the late requested. How to do that corr=
ectly is
>>>>>>>>>> not really clear to me.
>>>>>>>>>=20
>>>>>>>>> I don't get the usecase. A hogged GPIO is per definition hogg=
ed.
>>>>>>>>> This sounds more like "initial settings" or something, which =
is another
>>>>>>>>> usecase altogether.
>>>>>>>>=20
>>>>>>>> We do have one board where we have a pin (let's say GPIO14 of =
the bank
>>>>>>>> A) that enables a regulator that will provide VCC the bank B.
>>>>>>>>=20
>>>>>>>> Now, both banks are handled by the same driver, but in order t=
o have a
>>>>>>>> working output on the bank B, we do need to set GPIO14 as soon=
 as
>>>>>>>> we're probed.
>>>>>>>>=20
>>>>>>>> Just relying on the usual deferred probing introduces a circul=
ar
>>>>>>>> dependency between the gpio-regulator that needs to grab its G=
PIO from
>>>>>>>> a driver not there yet, and the gpio driver that needs to enab=
le its
>>>>>>>> gpio-regulator.
>>>>>>>=20
>>>>>>> I don't get it. According to what you said, the following order=
 should
>>>>>>> go through IIUC:
>>>>>>>=20
>>>>>>> 1) bank A is probed, gpio 14 is available
>>>>>>> 2) gpio-regulator is probed, acquires GPIO 14, regulator for Ba=
nk B is available
>>>>>>> 3) bank B is probed, grabs its regulator and turn it on, probes=
=2E
>>>>>>>=20
>>>>>>> What am I missing?
>>>>>>>=20
>>>>>>>>=20
>>>>>>>> GPIO hogging needs to be the ideal solution for that, since we=
 can
>>>>>>>> just enforce the GPIO14 value as the driver is probed, which p=
rovides
>>>>>>>> the guarantee that any driver using the bank B will actually d=
rive the
>>>>>>>> GPIO it might use.
>>>>>>>=20
>>>>>>> At this point I start wondering if such initial setup should no=
t be
>>>>>>> the job of the bootloader? GPIO hogging ought to be simple and
>>>>>>> definitive, adding the possibility to have it just as an initia=
l value
>>>>>>> would considerably complexify it. E.g. when is the gpio chip dr=
iver
>>>>>>> supposed to release the hogged descriptor in such a case?
>>>>>>>=20
>>>>>>=20
>>>>>> Do not count on the bootloader setting up anything. The trend is
>>>>>> for the bootloader to setup the minimal environment to load your=
 kernel
>>>>>> and jump to it.
>>>>>>=20
>>>>>> http://www.denx.de/wiki/pub/U-Boot/MiniSummitELCE2013/2013-ELCE-=
U-Boot-Falcon-Boot.pdf
>>>>>=20
>>>>> Just wondering. :)
>>>>>=20
>>>>> But yeah, there are some use-cases (such as this one or
>>>>> Linux-as-a-bootloader) for which this would not play nicely.
>>>>>=20
>>>>>>=20
>>>>>>=20
>>>>>>> Note that if the multiple GPIO consumer feature we are planning=
 goes
>>>>>>> through, you should be able to use both hogging *and* a regulat=
or on
>>>>>>> the same GPIO and achieve what you want. The expectation of mul=
tiple
>>>>>>> consumers is that the board designers know what they are doing,=
 and
>>>>>>> this case would certainly fit (chip hogs the line and doesn't t=
ouch
>>>>>>> the value after that, letting the regulator control it without =
any
>>>>>>> conflict afterwards), although it would of course be better to =
solve
>>>>>>> the issue through regular probing...
>>>>>>=20
>>>>>>=20
>>>>>> That=E2=80=99s why I was advocating a simple probing driver for =
all this.
>>>>>> Figure out a way for this driver to be probed first would be an =
easier
>>>>>> solution that what=E2=80=99s going on here.
>>>>>=20
>>>>> Do you mean, a driver whose sole job is to probe other drivers in=
 the
>>>>> right order? :/
>>>>=20
>>>> $DEITY no :)
>>>>=20
>>>> I mean instead of having the gpio hog in the gpio adapter driver, =
have
>>>> a gpio-hog driver, that=E2=80=99s using an undisclosed method to m=
ake sure that
>>>> it=E2=80=99s the first one to be probed afterwards.
>>>=20
>>> IIUC that would not solve this particular issue - here the GPIO
>>> controller is both a provider and (indirect) consumer of a GPIO for
>>> itself. If the hog is in a separate node, if would have to be probe=
d
>>> from inside the probe() function of the GPIO controller to do the j=
ob,
>>> which would be the same effect as having the hogs directly under th=
e
>>> controller node, only with more hassle.
>>>=20
>>> Again, IIUC. >_<
>>=20
>> If you had a way to specify the order of probing that would work no?
>> You don=E2=80=99t have to do it in the gpio-controller, you can do i=
t in the
>> platform bus probe.
>=20
> A probe order that works would be the following:
>=20
> 1) bank A is probed, gpio 14 is available
> 2) gpio-regulator is probed, acquires GPIO 14, regulator for Bank B i=
s available
> 3) bank B is probed, grabs its regulator and turn it on, probes.
>=20
> The problem is that in the present case, 1) and 3) are the same
> operation because both banks are the same device.
>=20
> You could probably solve this by making bank A and bank B separate
> devices, then even EPROBE_DEFER would allow you to probe everything i=
n
> the right order. But since the DT bindings are (supposedly) already
> published this is likely not an option (?). And logically speaking,
> these banks form one device anyway.

Let=E2=80=99s put that in a pseudo DT definition.

BANK_A: bank_a {
	compatible =3D =E2=80=9Cbanka,gpio-controller=E2=80=9D;
};

GPIO_REGULATOR: gpio-regulator {
	compatible =3D =E2=80=9Cgpio-regulator=E2=80=9D;
	gpio =3D <&BANK_A 14>;
};

BANK_B: bank_b {
	compatible =3D =E2=80=9Cbankb,gpio-controller=E2=80=9D;
	power-supply =3D <&GPIO_REGULATOR>;
};

The correct probe order is bank_a, gpio-regulator, bank_b correct?

It is possible to modify DTC to follow phandle references and spit out
a depends node that the platform bus probe can use.

=46or instance,=20

	__depends__ {
		gpio-regulator =3D <&BANK_A>;
		bank_b =3D <&GPIO_REGULATOR>;
	};

Would that work for your case?

Regards

=E2=80=94 Pantelis
