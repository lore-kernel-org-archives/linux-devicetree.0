From: Tony Lindgren <tony@atomide.com>
Subject: Re: Pinmux bindings proposal V2
Date: Fri, 3 Feb 2012 13:05:45 -0800
Message-ID: <20120203210545.GE1426@atomide.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF1780DAB4CE@HQMAIL01.nvidia.com>
 <20120201143530.GA2203@S2101-09.ap.freescale.net>
 <74CDBE0F657A3D45AFBB94109FB122FF178E124AC5@HQMAIL01.nvidia.com>
 <CAA+hA=RpkP-FFAr8wqVPjSKEMvO_sRHmOK_9nUYfuW=ps0O_=Q@mail.gmail.com>
 <20120203173205.GB1426@atomide.com>
 <CAA+hA=QFB7x0yv65LMuLx1exmiUAuB98D+9Fyyk9oeVu+7F2QQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAA+hA=QFB7x0yv65LMuLx1exmiUAuB98D+9Fyyk9oeVu+7F2QQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <dongas86@gmail.com>
Cc: Stephen Warren <swarren@nvidia.com>, Shawn Guo <shawn.guo@linaro.org>, Dong Aisheng-B29396 <B29396@freescale.com>, "Linus Walleij (linus.walleij@linaro.org)" <linus.walleij@linaro.org>, "Sascha Hauer (s.hauer@pengutronix.de)" <s.hauer@pengutronix.de>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "cjb@laptop.org" <cjb@laptop.org>, "Simon Glass (sjg@chromium.org)" <sjg@chromium.org>, Thomas Abraham <thomas.abraham@linaro.org>, "Grant Likely (grant.likely@secretlab.ca)" <grant.likely@secretlab.ca>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

* Dong Aisheng <dongas86@gmail.com> [120203 09:42]:
> On Sat, Feb 4, 2012 at 1:32 AM, Tony Lindgren <tony@atomide.com> wrot=
e:
> > * Dong Aisheng <dongas86@gmail.com> [120202 11:36]:
> >>
> >> Actually i think i'd rather do not use config property, then i cou=
ld
> >> be more compact:
> >> (anyway it's another issue and is flexible to be controlled by #pi=
nmux-cells)
> >> pinctrl_usdhc4: pinconfig-usdhc4 {
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* 0: pin 1: group */
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 mux-entity =3D <0>;
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 func-name =3D "usdhc4func";
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 grp-name =3D "usdhc4grp";
> >
> > The func-name and grp-name should be optional here.
> > This mux entry is already the group, and can be used as
> > the group name.
> For the case i discussed here, the mux entry is PIN.
> (the mux-entity value is 0).
> we introduce this value here for treating all pins is one group.
> When do map parsing, only one pinmux map will be created.
> So we need a grp-name.
> And we also need a func-name here for construct pinmux map.

Sounds like a similar setup I have, I do not need any func-name
or grp-name though.. The group name is already unique with
pinconfig-usdhc4 in your example?
=20
> > And the function name can be generated
> > dynamically in most cases. I'm currently using np->full_name
> > of the driver claiming these pins as the function name.
>
> Why i did not use np->name as function name is because the np->name
> can be different
> while actually these nodes may represent the same function but just
> different pins, so the function name should be same.

I used a function name based on the group name initially
(pinconfig-usdhc4 in your example), then renamed it to the
np->full_name of the device requesting the mux when the
mux was found ;)

> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 mux =3D
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <MX6Q_SD4_=
CMD =C2=A00 MX6Q_USDHC_PAD_CTRL>
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <MX6Q_SD4_=
CLK =C2=A00 MX6Q_USDHC_PAD_CTRL>
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <MX6Q_SD4_=
DAT0 1 MX6Q_USDHC_PAD_CTRL>
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <MX6Q_SD4_=
DAT1 1 MX6Q_USDHC_PAD_CTRL>
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <MX6Q_SD4_=
DAT2 1 MX6Q_USDHC_PAD_CTRL>
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <MX6Q_SD4_=
DAT3 1 MX6Q_USDHC_PAD_CTRL>
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <MX6Q_SD4_=
DAT4 1 MX6Q_USDHC_PAD_CTRL>
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <MX6Q_SD4_=
DAT5 1 MX6Q_USDHC_PAD_CTRL>
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <MX6Q_SD4_=
DAT6 1 MX6Q_USDHC_PAD_CTRL>
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <MX6Q_SD4_=
DAT7 1 MX6Q_USDHC_PAD_CTRL>;
> >> };
> >
> > For listing basic pins this format works fine for me. It seems
> > to have low overhead for parsing. And the width of the array
> > can be driver specific.
> >
> > Looks like it's the binding for altenative states that's still a
> > bit open..
> >
> Yes, it does not have states support.
>=20
> > So how about let's first standardize on the mux format above?
> >
> I'm afraid it may be hard for us to standardize the mux format for a
> standard binding in pinctrl core due to  hw difference.

Yes the width would have to be hardare specific for the array.

> I'm think the new way which i sent in this thread after the mail you =
replied.
> You can refer to them to see if it's reasonable for you too.

Hmm, sorry now I'm confused. Got a link for that mail as so
many have been posted?

Regards,

Tony
