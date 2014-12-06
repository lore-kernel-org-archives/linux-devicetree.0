From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch v2 1/2] gpio: add GPIO hogging mechanism
Date: Sat, 6 Dec 2014 21:04:51 +0900
Message-ID: <CAAVeFu+76AKWDQAF3wPAekbSjna5utxtw64L-dq6LDUA4O4Gtw@mail.gmail.com>
References: <1416527684-19017-1-git-send-email-bparrot@ti.com>
 <1416527684-19017-2-git-send-email-bparrot@ti.com> <CAAVeFu+VZiuzobB7McSAUehKUHJjBv1o8ZpYjSHJAKjr3o5wTA@mail.gmail.com>
 <20141201163639.GI25249@lukather> <CAAVeFuLTupDenZdSi8KO+dYsf-ekcqjsDaQ2GEzYpBG34oF7Zw@mail.gmail.com>
 <CACRpkdZcNcPBYQM438CZJx1gYst9BFBSTj-3Qv2aPGF9pdWa5g@mail.gmail.com>
 <20141202161227.GH30256@lukather> <CAAVeFu+Gms6ptyK6j1Zy_wWg+9URs+9zBu=pOiwiEERO=8NjNw@mail.gmail.com>
 <0EF6A712-5FF1-41BE-B8A9-21ABE7FE37F9@antoniou-consulting.com>
 <CAAVeFu+kfPi8CUR-YergQv9P1wMBzOik_Q1KBKMTVY1Gg_FBzg@mail.gmail.com>
 <C9DBE2F0-A725-4D05-BEC6-F083F3F83B9F@antoniou-consulting.com>
 <CAAVeFuKx1uWVh-TQeFKN4uS9TyzQH4BbQ2q1yM4uJsnQdfdzPQ@mail.gmail.com>
 <D73736E8-DC33-4F98-82DD-DF42B989A453@antoniou-consulting.com>
 <CAAVeFu+d5R6cKaXOgkU-ve8uy4jPGWJrDUrnARXs=ufe_p+RFg@mail.gmail.com> <8717617A-56AE-495C-B873-0B2E3EA83060@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8717617A-56AE-495C-B873-0B2E3EA83060-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, Jiri Prchal <jiri.prchal-cKCO0sOKHLPtwjQa/ONI9g@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 5, 2014 at 12:22 AM, Pantelis Antoniou
<panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
> Hi Alexandre,
>
>> On Dec 4, 2014, at 17:10 , Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
>>
>> On Fri, Dec 5, 2014 at 12:02 AM, Pantelis Antoniou
>> <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
>>> Hi Alexandre,
>>>
>>>> On Dec 4, 2014, at 16:58 , Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
>>>>
>>>> On Thu, Dec 4, 2014 at 11:47 PM, Pantelis Antoniou
>>>> <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
>>>>> Hi Alexandre,
>>>>>
>>>>>> On Dec 4, 2014, at 16:41 , Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>>>>>>
>>>>>> On Thu, Dec 4, 2014 at 11:27 PM, Pantelis Antoniou
>>>>>> <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org> wrote:
>>>>>>> Hi Alexandre,
>>>>>>>
>>>>>>> I tried to stay away while things are being fleshed out but=E2=80=
=A6
>>>>>>>
>>>>>>>> On Dec 4, 2014, at 16:15 , Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
>>>>>>>>
>>>>>>>> On Wed, Dec 3, 2014 at 1:12 AM, Maxime Ripard
>>>>>>>> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>>>>>>>>> On Tue, Dec 02, 2014 at 03:29:46PM +0100, Linus Walleij wrote=
:
>>>>>>>>>> On Tue, Dec 2, 2014 at 3:13 PM, Alexandre Courbot <gnurou@gm=
ail.com> wrote:
>>>>>>>>>>> On Tue, Dec 2, 2014 at 1:36 AM, Maxime Ripard
>>>>>>>>>>> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>>>>>>>>>>
>>>>>>>>>>>> The only thing I'd like to have would be that the request =
here would
>>>>>>>>>>>> be non-exclusive, so that a later driver would still be al=
lowed later
>>>>>>>>>>>> on to request that GPIO later on and manage it itself (ide=
ally using
>>>>>>>>>>>> the usual gpiod_request function).
>>>>>>>>>>>
>>>>>>>>>>> Actually we have a plan (and I have some code too) to allow=
 multiple
>>>>>>>>>>> consumers per GPIO. Although like Benoit I wonder why you w=
ould want
>>>>>>>>>>> to hog a GPIO and then request it properly later. Also, tha=
t probably
>>>>>>>>>>> means we should abandon the hog since it actively drives th=
e line and
>>>>>>>>>>> would interfere with the late requested. How to do that cor=
rectly is
>>>>>>>>>>> not really clear to me.
>>>>>>>>>>
>>>>>>>>>> I don't get the usecase. A hogged GPIO is per definition hog=
ged.
>>>>>>>>>> This sounds more like "initial settings" or something, which=
 is another
>>>>>>>>>> usecase altogether.
>>>>>>>>>
>>>>>>>>> We do have one board where we have a pin (let's say GPIO14 of=
 the bank
>>>>>>>>> A) that enables a regulator that will provide VCC the bank B.
>>>>>>>>>
>>>>>>>>> Now, both banks are handled by the same driver, but in order =
to have a
>>>>>>>>> working output on the bank B, we do need to set GPIO14 as soo=
n as
>>>>>>>>> we're probed.
>>>>>>>>>
>>>>>>>>> Just relying on the usual deferred probing introduces a circu=
lar
>>>>>>>>> dependency between the gpio-regulator that needs to grab its =
GPIO from
>>>>>>>>> a driver not there yet, and the gpio driver that needs to ena=
ble its
>>>>>>>>> gpio-regulator.
>>>>>>>>
>>>>>>>> I don't get it. According to what you said, the following orde=
r should
>>>>>>>> go through IIUC:
>>>>>>>>
>>>>>>>> 1) bank A is probed, gpio 14 is available
>>>>>>>> 2) gpio-regulator is probed, acquires GPIO 14, regulator for B=
ank B is available
>>>>>>>> 3) bank B is probed, grabs its regulator and turn it on, probe=
s.
>>>>>>>>
>>>>>>>> What am I missing?
>>>>>>>>
>>>>>>>>>
>>>>>>>>> GPIO hogging needs to be the ideal solution for that, since w=
e can
>>>>>>>>> just enforce the GPIO14 value as the driver is probed, which =
provides
>>>>>>>>> the guarantee that any driver using the bank B will actually =
drive the
>>>>>>>>> GPIO it might use.
>>>>>>>>
>>>>>>>> At this point I start wondering if such initial setup should n=
ot be
>>>>>>>> the job of the bootloader? GPIO hogging ought to be simple and
>>>>>>>> definitive, adding the possibility to have it just as an initi=
al value
>>>>>>>> would considerably complexify it. E.g. when is the gpio chip d=
river
>>>>>>>> supposed to release the hogged descriptor in such a case?
>>>>>>>>
>>>>>>>
>>>>>>> Do not count on the bootloader setting up anything. The trend i=
s
>>>>>>> for the bootloader to setup the minimal environment to load you=
r kernel
>>>>>>> and jump to it.
>>>>>>>
>>>>>>> http://www.denx.de/wiki/pub/U-Boot/MiniSummitELCE2013/2013-ELCE=
-U-Boot-Falcon-Boot.pdf
>>>>>>
>>>>>> Just wondering. :)
>>>>>>
>>>>>> But yeah, there are some use-cases (such as this one or
>>>>>> Linux-as-a-bootloader) for which this would not play nicely.
>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>> Note that if the multiple GPIO consumer feature we are plannin=
g goes
>>>>>>>> through, you should be able to use both hogging *and* a regula=
tor on
>>>>>>>> the same GPIO and achieve what you want. The expectation of mu=
ltiple
>>>>>>>> consumers is that the board designers know what they are doing=
, and
>>>>>>>> this case would certainly fit (chip hogs the line and doesn't =
touch
>>>>>>>> the value after that, letting the regulator control it without=
 any
>>>>>>>> conflict afterwards), although it would of course be better to=
 solve
>>>>>>>> the issue through regular probing...
>>>>>>>
>>>>>>>
>>>>>>> That=E2=80=99s why I was advocating a simple probing driver for=
 all this.
>>>>>>> Figure out a way for this driver to be probed first would be an=
 easier
>>>>>>> solution that what=E2=80=99s going on here.
>>>>>>
>>>>>> Do you mean, a driver whose sole job is to probe other drivers i=
n the
>>>>>> right order? :/
>>>>>
>>>>> $DEITY no :)
>>>>>
>>>>> I mean instead of having the gpio hog in the gpio adapter driver,=
 have
>>>>> a gpio-hog driver, that=E2=80=99s using an undisclosed method to =
make sure that
>>>>> it=E2=80=99s the first one to be probed afterwards.
>>>>
>>>> IIUC that would not solve this particular issue - here the GPIO
>>>> controller is both a provider and (indirect) consumer of a GPIO fo=
r
>>>> itself. If the hog is in a separate node, if would have to be prob=
ed
>>>> from inside the probe() function of the GPIO controller to do the =
job,
>>>> which would be the same effect as having the hogs directly under t=
he
>>>> controller node, only with more hassle.
>>>>
>>>> Again, IIUC. >_<
>>>
>>> If you had a way to specify the order of probing that would work no=
?
>>> You don=E2=80=99t have to do it in the gpio-controller, you can do =
it in the
>>> platform bus probe.
>>
>> A probe order that works would be the following:
>>
>> 1) bank A is probed, gpio 14 is available
>> 2) gpio-regulator is probed, acquires GPIO 14, regulator for Bank B =
is available
>> 3) bank B is probed, grabs its regulator and turn it on, probes.
>>
>> The problem is that in the present case, 1) and 3) are the same
>> operation because both banks are the same device.
>>
>> You could probably solve this by making bank A and bank B separate
>> devices, then even EPROBE_DEFER would allow you to probe everything =
in
>> the right order. But since the DT bindings are (supposedly) already
>> published this is likely not an option (?). And logically speaking,
>> these banks form one device anyway.
>
> Let=E2=80=99s put that in a pseudo DT definition.
>
> BANK_A: bank_a {
>         compatible =3D =E2=80=9Cbanka,gpio-controller=E2=80=9D;
> };
>
> GPIO_REGULATOR: gpio-regulator {
>         compatible =3D =E2=80=9Cgpio-regulator=E2=80=9D;
>         gpio =3D <&BANK_A 14>;
> };
>
> BANK_B: bank_b {
>         compatible =3D =E2=80=9Cbankb,gpio-controller=E2=80=9D;
>         power-supply =3D <&GPIO_REGULATOR>;
> };
>
> The correct probe order is bank_a, gpio-regulator, bank_b correct?

Right. And actually this would work without any DT annotation, altough
it might take a few more loops to get to the right order.

But as Maxime confirmed later, his device is more like this:

/* Contains both banks A and B */
gpio: gpio {
        compatible =3D "foo,gpio-controller";
        bankb-supply =3D <&GPIO_REGULATOR>'
};

GPIO_REGULATOR: gpio-regulator {
        compatible =3D =E2=80=9Cgpio-regulator=E2=80=9D;
        gpio =3D <&gpio 14>;
};

And here there is nothing we can do, I'm afraid, without splitting the
banks into their own nodes first.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
