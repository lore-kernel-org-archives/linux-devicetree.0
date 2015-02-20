From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 2/4] of: DT quirks infrastructure
Date: Fri, 20 Feb 2015 08:47:53 -0800
Message-ID: <20150220164753.GC22752@roeck-us.net>
References: <1424271576-1952-3-git-send-email-pantelis.antoniou@konsulko.com>
 <20150218154106.GC29429@leverpostej>
 <FE61DD1C-51DA-4869-8A62-C019C3D70577@konsulko.com>
 <20150218173115.GG29429@leverpostej>
 <76BD1B22-BAED-4205-9B34-186907CE0217@konsulko.com>
 <54E613E7.2020405@gmail.com>
 <670D0881-DBF0-45E8-A502-A6DB2B77A750@konsulko.com>
 <54E61DD2.3060002@gmail.com>
 <53F2F94C-0C43-4A54-B8CD-EEC454A0AC19@konsulko.com>
 <54E742F2.80506@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54E742F2.80506-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 20, 2015 at 09:21:38AM -0500, Peter Hurley wrote:
> On 02/19/2015 12:38 PM, Pantelis Antoniou wrote:
> >=20
> >> On Feb 19, 2015, at 19:30 , Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
> >>
> >> On 2/19/2015 9:00 AM, Pantelis Antoniou wrote:
> >>> Hi Frank,
> >>>
> >>>> On Feb 19, 2015, at 18:48 , Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
> >>>>
> >>>> On 2/19/2015 6:29 AM, Pantelis Antoniou wrote:
> >>>>> Hi Mark,
> >>>>>
> >>>>>> On Feb 18, 2015, at 19:31 , Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org=
> wrote:
> >>>>>>
> >>>>>>>>> +While this may in theory work, in practice it is very cumb=
ersome
> >>>>>>>>> +for the following reasons:
> >>>>>>>>> +
> >>>>>>>>> +1. The act of selecting a different boot device tree blob =
requires
> >>>>>>>>> +a reasonably advanced bootloader with some kind of configu=
ration or
> >>>>>>>>> +scripting capabilities. Sadly this is not the case many ti=
mes, the
> >>>>>>>>> +bootloader is extremely dumb and can only use a single dt =
blob.
> >>>>>>>>
> >>>>>>>> You can have several bootloader builds, or even a single bui=
ld with
> >>>>>>>> something like appended DTB to get an appropriate DTB if the=
 same binary
> >>>>>>>> will otherwise work across all variants of a board.
> >>>>>>>>
> >>>>>>>
> >>>>>>> No, the same DTB will not work across all the variants of a b=
oard.
> >>>>>>
> >>>>>> I wasn't on about the DTB. I was on about the loader binary, i=
n the case
> >>>>>> the FW/bootloader could be common even if the DTB couldn't.
> >>>>>>
> >>>>>> To some extent there must be a DTB that will work across all v=
ariants
> >>>>>> (albeit with limited utility) or the quirk approach wouldn't w=
ork=E2=80=A6
> >>>>>>
> >>>>>
> >>>>> That=E2=80=99s not correct; the only part of the DTB that needs=
 to be common
> >>>>> is the model property that would allow the quirk detection logi=
c to fire.
> >>>>>
> >>>>> So, there is a base DTB that will work on all variants, but tha=
t only means
> >>>>> that it will work only up to the point that the quirk detector =
method
> >>>>> can work. So while in recommended practice there are common sub=
sets
> >>>>> of the DTB that might work, they might be unsafe.
> >>>>>
> >>>>> For instance on the beaglebone the regulator configuration is d=
ifferent
> >>>>> between white and black, it is imperative you get them right ot=
herwise
> >>>>> you risk board damage.
> >>>>>
> >>>>>>>> So it's not necessarily true that you need a complex bootloa=
der.
> >>>>>>>>
> >>>>>>>
> >>>>>>>>> +2. On many instances boot time is extremely critical; in s=
ome cases
> >>>>>>>>> +there are hard requirements like having working video feed=
s in under
> >>>>>>>>> +2 seconds from power-up. This leaves an extremely small ti=
me budget for
> >>>>>>>>> +boot-up, as low as 500ms to kernel entry. The sanest way t=
o get there
> >>>>>>>>> +is by removing the standard bootloader from the normal boo=
t sequence
> >>>>>>>>> +altogether by having a very small boot shim that loads the=
 kernel and
> >>>>>>>>> +immediately jumps to kernel, like falcon-boot mode in u-bo=
ot does.
> >>>>>>>>
> >>>>>>>> Given my previous comments above I don't see why this is rel=
evant.
> >>>>>>>> You're already passing _some_ DTB here, so if you can organi=
se for the
> >>>>>>>> board to statically provide a sane DTB that's fine, or you c=
an resort to
> >>>>>>>> appended DTB if it's not possible to update the board config=
uration.
> >>>>>>>>
> >>>>>>>
> >>>>>>> You=E2=80=99re missing the point. I can=E2=80=99t use the sam=
e DTB for each revision of the
> >>>>>>> board. Each board is similar but it=E2=80=99s not identical.
> >>>>>>
> >>>>>> I think you've misunderstood my point. If you program the boar=
d with the
> >>>>>> relevant DTB, or use appended DTB, then you will pass the corr=
ect DTB to
> >>>>>> the kernel without need for quirks.
> >>>>>>
> >>>>>> I understand that each variant is somewhat incompatible (and h=
ence needs
> >>>>>> its own DTB).
> >>>>>
> >>>>> In theory it might work, in practice this does not. Ludovic men=
tioned that they
> >>>>> have 27 different DTBs in use at the moment. At a relatively co=
mmon 60k per DTB
> >>>>> that=E2=80=99s 27x60k =3D 1.6MB of DTBs, that need to be instal=
led.
> >>>>
> >>>> < snip >
> >>>>
> >>>> Or you can install the correct DTB on the board.  You trust your=
 manufacturing line
> >>>> to install the correct resistors.  You trust your manufacturing =
line to install the
> >>>> correct kernel version (eg an updated version to resolve a secur=
ity issue).
> >>>>
> >>>> I thought the DT blob was supposed to follow the same standard t=
hat other OS's or
> >>>> bootloaders understood.  Are you willing to break that?  (This i=
s one of those
> >>>> ripples I mentioned in my other emails.)
> >>>>
> >>>
> >>> Trust no-one.
> >>>
> >>> This is one of those things that the kernel community doesn=E2=80=
=99t understand which makes people
> >>> who push product quite mad.
> >>>
> >>> Engineering a product is not only about meeting customer spec, in=
 order to turn a profit
> >>> the whole endeavor must be engineered as well for manufacturabili=
ty.
> >>>
> >>> Yes, you can always manually install files in the bootloader. For=
 1 board no problem.
> >>> For 10 doable. For 100 I guess you can hire an extra guy. For 1 m=
illion? Guess what,
> >>> instead of turning a profit you=E2=80=99re losing money if you on=
ly have a few cents of profit
> >>> per unit.
> >>
> >> I'm not installing physical components manually.  Why would I be i=
nstalling software
> >> manually?  (rhetorical question)
> >>
> >=20
> > Because on high volume product runs the flash comes preprogrammed a=
nd is soldered as is.
> >=20
> > Having a single binary to flash to every revision of the board make=
s logistics considerably
> > easier.
> >=20
> > Having to boot and tweak the bootloader settings to select the corr=
ect dtb (even if it=E2=80=99s present
> > on the flash medium) takes time and is error-prone.
> >=20
> > Factory time =3D=3D money, errors =3D=3D money.
> >=20
> >>>
> >>> No knobs to tweak means no knobs to break. And a broken knob can =
have pretty bad consequences
> >>> for a few million units.=20
> >>
> >> And you produce a few million units before testing that the first =
one off the line works?
> >>
> >=20
> > The first one off the line works. The rest will get some burn in an=
d functional testing if you=E2=80=99re
> > lucky. In many cases where the product is very cheap it might make =
financial sense to just ship
> > as is and deal with recalls, if you=E2=80=99re reasonably happy aft=
er a little bit of statistical sampling.
> >=20
> > Hardware is hard :)
>=20
> I'm failing to see how this series improves your manufacturing proces=
s at all.
>=20
> 1. Won't you have to provide the factory with different eeprom images=
 for the
>    White and Black?  You _trust_ them to get that right, or more like=
ly, you
>    have process control procedures in place so that you don't get 1 m=
illion Blacks
>    flashed with the White eeprom image.
>=20

I am open to hearing your suggestions for our use case, where the CPU c=
ard with
the eeprom is manufactured separately from its carier cards.

I assume you might suggest that manufacturing should (re-)program the E=
EPROM
on the CPU card after it was inserted into the carrier.

Problem is though that the CPU card may be inserted into ts carrier out=
side
manufacturing, at the final stages of assembly or in product repair. Th=
ose
groups would typically not even have the means to (re-)program the eepr=
om.
Besides, manufacturing would, quite understandably, go ballistic if we =
demand
that they start programming EEPROMs after insertion into carrier, and n=
o longer
use pre-programmed EEPROMs.

Note that it is not feasible to put the necessary EEPROM onto the carri=
er
either. Maybe in a later design. Maybe that makes sense, and we will go=
 along
that route at some point. However, forcing a specific hardware solution
due to software limitations, ie lack of ability by core software to han=
dle
the different carries, seems to be not the right decision to make on an
OS level.

In the PCI world it has long since been accepted that the world is not =
perfect. =20
The argument here is pretty much equivalent to demanding that PCI drop =
its
quirks mechanism, to force the HW manufacturers to finally get it right=
 from
the beginning. I somehow suspect that this won't happen.

Instead of questioning the need for a mechanism such as the one propose=
d by
Pantelis, I think our time would be better spent arguing if it is the r=
ight
mechanism and, if not, how it can be improved.

Thanks,
Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
