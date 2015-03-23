From: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] pinmux: group and function definitions in the device tree
Date: Mon, 23 Mar 2015 15:00:20 +0100
Message-ID: <20150323140019.GH32259@odux.rfo.atmel.com>
References: <20150319153950.GC30114@odux.rfo.atmel.com>
 <20150319185637.GV4927@pengutronix.de>
 <20150320150609.GB32259@odux.rfo.atmel.com>
 <20150323064424.GD9742@pengutronix.de>
 <20150323090827.GD32259@odux.rfo.atmel.com>
 <20150323100913.GJ9742@pengutronix.de>
 <37858913-F9BB-41D8-A380-7F8C44E08A4F@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <37858913-F9BB-41D8-A380-7F8C44E08A4F-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Nicolas FERRE <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 23, 2015 at 06:29:11PM +0800, Jean-Christophe PLAGNIOL-VILL=
ARD wrote:
>=20
> > On Mar 23, 2015, at 6:09 PM, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> =
wrote:
> >=20
> > On Mon, Mar 23, 2015 at 10:08:27AM +0100, Ludovic Desroches wrote:
> >> On Mon, Mar 23, 2015 at 07:44:24AM +0100, Sascha Hauer wrote:
> >>> On Fri, Mar 20, 2015 at 04:06:09PM +0100, Ludovic Desroches wrote=
:
> >>>> On Thu, Mar 19, 2015 at 07:56:37PM +0100, Sascha Hauer wrote:
> >>>>> On Thu, Mar 19, 2015 at 04:39:50PM +0100, Ludovic Desroches wro=
te:
> >>>>>> 	[...]
> >>>>>>=20
> >>>>>> 	pinctrl_defs {
> >>>>>> 		mci0 {
> >>>>>> 			mci0_ioset0_1bit_grp {
> >>>>>> 				at91,pins =3D <68 69 70>;
> >>>>>> 				at91,mux =3D <2>;
> >>>>>> 			};
> >>>>>>=20
> >>>>>> 			mci0_ioset0_4bit_grp {
> >>>>>> 				at91,pins =3D <68 69 70 71 72 73>;
> >>>>>> 				at91,mux =3D <2>;
> >>>>>> 			};
> >>>>>>=20
> >>>>>> 			mci0_ioset0_8bit_grp {
> >>>>>> 				at91,pins =3D <68 69 70 71 72 73 74 75 76 77>;
> >>>>>> 				at91,mux =3D <2>;
> >>>>>> 			};
> >>>>>> 		};
> >>>>>> 	};
> >>>>>=20
> >>>>> Why are different groups here? Do you want to put them into the=
 dtsi?
> >>>>=20
> >>>> We used to have a configuration per pin in our products. On next=
 ones we
> >>>> will have some constraints ie. on the controller side we still h=
ave a
> >>>> configuration per pin but we will introduced the notion of ioset=
s. This
> >>>> notion involves that timings are guaranteed only in one ioset. T=
hat's
> >>>> why we can't mix signals from several iosets because. On the con=
troller side
> >>>> we can do all we want so I would like to use groups as a softwar=
e protection.
> >>>=20
> >>> What does happen when you mix signals of different iosets? It won=
't work
> >>> so the developer will change it. What do you need the software
> >>> protection for?
> >>>=20
> >>=20
> >> I can't say it won't work, it could work in some cases. My fear is=
 to
> >> have some support cases because of this. It seems easy to spot thi=
s kind
> >> of issue but experience tell us that we can loose time for this ki=
nd of
> >> "stupid" error.
> >=20
> > Hm, the software (dts in this case) developer will only mix signals=
 of
> > different iosets when he is forced to by the board designer. It's t=
he
> > board designer that has made this mistake, the software developer w=
ill
> > only try to make it work anyway. I doubt that the board designer wi=
ll
> > design the board based on the possibilities shown in the dts files.
> >=20
> >>>>>> - A subnode for these definitions in order to not parse the wh=
ole
> >>>>>>  pinctrl node to retrieve groups and functions.
> >>>>>> - Using node names as function and group names.
> >>>>>> - Can we get generic properties to define the groups? Of cours=
e a 'pins'
> >>>>>>  property is mandatory. In my case I will need an extra one to=
 tell the
> >>>>>>  controller how to mux the pins (a same pin can have up to 7 m=
uxing
> >>>>>>  possibilities).
> >>>>>=20
> >>>>> Did you have a look at the RFC I sent for these kind of control=
lers [1] and
> >>>>> the final result for the Mediatek driver currently in Linux-nex=
t [2]?.
> >>>>>=20
> >>>>> The binding has both the config and the pins in a single node a=
nd thus
> >>>>> is very compact.
> >>>>>=20
> >>>>=20
> >>>> Thanks for the links. Well I had a look to them and now I am a b=
it
> >>>> lost...
> >>>>=20
> >>>> I agree with this binding but it involves to get rid of
> >>>> pinconf_generic_dt_node_to_map_all, isn't it? What do group and =
function
> >>>> become? It seems these concepts have disappeared.
> >>>=20
> >>> The binding I suggested changes nothing with pinconf, only the pi=
nmux
> >>> information is added to the same node. You can still call
> >>> pinconf_generic_dt_node_to_map_all() on the nodes, it will simply=
 ignore
> >>> the pinmux information. You would have to handle them separately =
(or
> >>> write some generic helper if you like)
> >>=20
> >> Yes, I can still use it. What I mean is there is no generic helper=
 at the
> >> moment to get both pinmux (excepting using the function property) =
and
> >> pinconf information. Is it planned to have something generic for t=
he
> >> pinmux property?
> >=20
> > Not yet, but it would be a good idea to add something generic.
> >=20
> >> I see MTK_GET_PIN_NO and MTK_GET_PIN_FUNC macros, on my side,
> >> I think it will feet my needs. Maybe we only need to remove the MT=
K
> >> prefix and put these macros in another header.
> >>=20
> >> In the mediatek driver, I have also noticed that we have a group f=
or
> >> each pin. I have the feeling that the concept of groups disappear,=
 isn't
> >> it?
> >=20
> > This may be because the concept of groups doesn't most hardware.
> > There really is hardware out there which can only handle the pins i=
n
> > groups (that is, a single mux switches multiple pins), but this har=
dware
> > is not very common. Most hardware can indeed control every pin
> > indivually. In this situation some drivers are consequent and make =
a
> > group out of each pin which renders the group concept moot. Other
> > drivers just interpret each device node as pin group which creates
> > artificial groups which do not exist in hardware.
>=20
> This is what we do on the current pinctrl-at91
>=20

It is a bit different with pinctrl-at91, we don't have npins groups.
Even if there is no hardware reality behind we have groups of pins.

> and as we do not see the specific of this new IP for at91 it=E2=80=99=
s difficult to see
> if we can use generic or not.
>=20

We can use the generic pinconf for sure. My main concern were the
concepts of groups and functions. But it seems, now, we can't get rid o=
f these
concepts.

I am trying to figure out what we loose (or not) if using a mapping suc=
h as
'a pin =3D a group'. For example I am thinking about sysfs, it is proba=
bly
more human readable to have some groups with a name related to the
device they are connected as done in pinctrl-at91.

> Personally I do prefer when the number of possibility are not high to=
 have a big
> soc dtsi.
>=20
> But in the case of I.MX yes it=E2=80=99s impossible to manage
>=20
> Best Regards,
> J.
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
