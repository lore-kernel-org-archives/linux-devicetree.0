From: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/4] of: DT quirks infrastructure
Date: Fri, 20 Feb 2015 10:00:06 -0500
Message-ID: <54E74BF6.208@hurleysoftware.com>
References: <1424271576-1952-3-git-send-email-pantelis.antoniou@konsulko.com> <20150218154106.GC29429@leverpostej> <FE61DD1C-51DA-4869-8A62-C019C3D70577@konsulko.com> <20150218173115.GG29429@leverpostej> <76BD1B22-BAED-4205-9B34-186907CE0217@konsulko.com> <54E613E7.2020405@gmail.com> <670D0881-DBF0-45E8-A502-A6DB2B77A750@konsulko.com> <54E61DD2.3060002@gmail.com> <53F2F94C-0C43-4A54-B8CD-EEC454A0AC19@konsulko.com> <54E742F2.80506@hurleysoftware.com> <20150220143533.GA29908@odux.rfo.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150220143533.GA29908-FuRPzXQv2LUWBfJKYY8PcdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/20/2015 09:35 AM, Ludovic Desroches wrote:
> On Fri, Feb 20, 2015 at 09:21:38AM -0500, Peter Hurley wrote:
>> On 02/19/2015 12:38 PM, Pantelis Antoniou wrote:
>>>
>>>> On Feb 19, 2015, at 19:30 , Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>>>>
>>>> On 2/19/2015 9:00 AM, Pantelis Antoniou wrote:
>>>>> Hi Frank,
>>>>>
>>>>>> On Feb 19, 2015, at 18:48 , Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
>>>>>>
>>>>>> On 2/19/2015 6:29 AM, Pantelis Antoniou wrote:
>>>>>>> Hi Mark,
>>>>>>>
>>>>>>>> On Feb 18, 2015, at 19:31 , Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org=
> wrote:
>>>>>>>>
>>>>>>>>>>> +While this may in theory work, in practice it is very cumb=
ersome
>>>>>>>>>>> +for the following reasons:
>>>>>>>>>>> +
>>>>>>>>>>> +1. The act of selecting a different boot device tree blob =
requires
>>>>>>>>>>> +a reasonably advanced bootloader with some kind of configu=
ration or
>>>>>>>>>>> +scripting capabilities. Sadly this is not the case many ti=
mes, the
>>>>>>>>>>> +bootloader is extremely dumb and can only use a single dt =
blob.
>>>>>>>>>>
>>>>>>>>>> You can have several bootloader builds, or even a single bui=
ld with
>>>>>>>>>> something like appended DTB to get an appropriate DTB if the=
 same binary
>>>>>>>>>> will otherwise work across all variants of a board.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> No, the same DTB will not work across all the variants of a b=
oard.
>>>>>>>>
>>>>>>>> I wasn't on about the DTB. I was on about the loader binary, i=
n the case
>>>>>>>> the FW/bootloader could be common even if the DTB couldn't.
>>>>>>>>
>>>>>>>> To some extent there must be a DTB that will work across all v=
ariants
>>>>>>>> (albeit with limited utility) or the quirk approach wouldn't w=
ork=E2=80=A6
>>>>>>>>
>>>>>>>
>>>>>>> That=E2=80=99s not correct; the only part of the DTB that needs=
 to be common
>>>>>>> is the model property that would allow the quirk detection logi=
c to fire.
>>>>>>>
>>>>>>> So, there is a base DTB that will work on all variants, but tha=
t only means
>>>>>>> that it will work only up to the point that the quirk detector =
method
>>>>>>> can work. So while in recommended practice there are common sub=
sets
>>>>>>> of the DTB that might work, they might be unsafe.
>>>>>>>
>>>>>>> For instance on the beaglebone the regulator configuration is d=
ifferent
>>>>>>> between white and black, it is imperative you get them right ot=
herwise
>>>>>>> you risk board damage.
>>>>>>>
>>>>>>>>>> So it's not necessarily true that you need a complex bootloa=
der.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>>>> +2. On many instances boot time is extremely critical; in s=
ome cases
>>>>>>>>>>> +there are hard requirements like having working video feed=
s in under
>>>>>>>>>>> +2 seconds from power-up. This leaves an extremely small ti=
me budget for
>>>>>>>>>>> +boot-up, as low as 500ms to kernel entry. The sanest way t=
o get there
>>>>>>>>>>> +is by removing the standard bootloader from the normal boo=
t sequence
>>>>>>>>>>> +altogether by having a very small boot shim that loads the=
 kernel and
>>>>>>>>>>> +immediately jumps to kernel, like falcon-boot mode in u-bo=
ot does.
>>>>>>>>>>
>>>>>>>>>> Given my previous comments above I don't see why this is rel=
evant.
>>>>>>>>>> You're already passing _some_ DTB here, so if you can organi=
se for the
>>>>>>>>>> board to statically provide a sane DTB that's fine, or you c=
an resort to
>>>>>>>>>> appended DTB if it's not possible to update the board config=
uration.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> You=E2=80=99re missing the point. I can=E2=80=99t use the sam=
e DTB for each revision of the
>>>>>>>>> board. Each board is similar but it=E2=80=99s not identical.
>>>>>>>>
>>>>>>>> I think you've misunderstood my point. If you program the boar=
d with the
>>>>>>>> relevant DTB, or use appended DTB, then you will pass the corr=
ect DTB to
>>>>>>>> the kernel without need for quirks.
>>>>>>>>
>>>>>>>> I understand that each variant is somewhat incompatible (and h=
ence needs
>>>>>>>> its own DTB).
>>>>>>>
>>>>>>> In theory it might work, in practice this does not. Ludovic men=
tioned that they
>>>>>>> have 27 different DTBs in use at the moment. At a relatively co=
mmon 60k per DTB
>>>>>>> that=E2=80=99s 27x60k =3D 1.6MB of DTBs, that need to be instal=
led.
>>>>>>
>>>>>> < snip >
>>>>>>
>>>>>> Or you can install the correct DTB on the board.  You trust your=
 manufacturing line
>>>>>> to install the correct resistors.  You trust your manufacturing =
line to install the
>>>>>> correct kernel version (eg an updated version to resolve a secur=
ity issue).
>>>>>>
>>>>>> I thought the DT blob was supposed to follow the same standard t=
hat other OS's or
>>>>>> bootloaders understood.  Are you willing to break that?  (This i=
s one of those
>>>>>> ripples I mentioned in my other emails.)
>>>>>>
>>>>>
>>>>> Trust no-one.
>>>>>
>>>>> This is one of those things that the kernel community doesn=E2=80=
=99t understand which makes people
>>>>> who push product quite mad.
>>>>>
>>>>> Engineering a product is not only about meeting customer spec, in=
 order to turn a profit
>>>>> the whole endeavor must be engineered as well for manufacturabili=
ty.
>>>>>
>>>>> Yes, you can always manually install files in the bootloader. For=
 1 board no problem.
>>>>> For 10 doable. For 100 I guess you can hire an extra guy. For 1 m=
illion? Guess what,
>>>>> instead of turning a profit you=E2=80=99re losing money if you on=
ly have a few cents of profit
>>>>> per unit.
>>>>
>>>> I'm not installing physical components manually.  Why would I be i=
nstalling software
>>>> manually?  (rhetorical question)
>>>>
>>>
>>> Because on high volume product runs the flash comes preprogrammed a=
nd is soldered as is.
>>>
>>> Having a single binary to flash to every revision of the board make=
s logistics considerably
>>> easier.
>>>
>>> Having to boot and tweak the bootloader settings to select the corr=
ect dtb (even if it=E2=80=99s present
>>> on the flash medium) takes time and is error-prone.
>>>
>>> Factory time =3D=3D money, errors =3D=3D money.
>>>
>>>>>
>>>>> No knobs to tweak means no knobs to break. And a broken knob can =
have pretty bad consequences
>>>>> for a few million units.=20
>>>>
>>>> And you produce a few million units before testing that the first =
one off the line works?
>>>>
>>>
>>> The first one off the line works. The rest will get some burn in an=
d functional testing if you=E2=80=99re
>>> lucky. In many cases where the product is very cheap it might make =
financial sense to just ship
>>> as is and deal with recalls, if you=E2=80=99re reasonably happy aft=
er a little bit of statistical sampling.
>>>
>>> Hardware is hard :)
>>
>> I'm failing to see how this series improves your manufacturing proce=
ss at all.
>>
>> 1. Won't you have to provide the factory with different eeprom image=
s for the
>>    White and Black?  You _trust_ them to get that right, or more lik=
ely, you
>>    have process control procedures in place so that you don't get 1 =
million Blacks
>>    flashed with the White eeprom image.
>>
>> 2. The White and Black use different memory technology so it's not a=
s if the
>>    eMMC from the Black will end up on the White SMT line (or vice ve=
rsa).
>>
>> 3  For that matter, why wouldn't you worry that all the microSD card=
s intended
>>    for the White were accidentally assembled with the first 50,000 B=
lacks; at
>>    that point you're losing a lot more than a few cents of profit. A=
nd that has
>>    nothing to do with what image you provided.
>>
>=20
> As you said, we can imagine many reasons to have a failure during the
> production, having several DTB files will increase the risk.

It's interesting that you don't see the added complexity of open-coding
the i2c driver or mixing DTS fragments for different designs as increas=
ed risk
(for us all).


>> 3. The factory is just as likely to use some other customer's image =
by accident,
>>    so you're just as likely to have the same failure rate if you hav=
e no test
>>    process at the factory.
>>
>> 4. If you're using offline programming, the image has to be tested a=
fter
>>    reflow anyway.
>>
>> IOW, your QA process will not change at all =3D=3D same cost.
>>
>> Regards,
>> Peter Hurley

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
