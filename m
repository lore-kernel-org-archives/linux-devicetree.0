From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC] pinctrl: generic: Add DT bindings
Date: Sun, 16 Jun 2013 01:35:34 +0200
Message-ID: <1795038.rqcr6GWLdP@avalon>
References: <1370988237-30593-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <CACRpkdaF7V3FGhNNj+N+Dc-NWhsfQ=bqh+ETx0wGBFbLmxfGTw@mail.gmail.com> <201306152216.14252.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <201306152216.14252.heiko@sntech.de>
Sender: linux-sh-owner@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@secretlab.ca>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, James Hogan <james.hogan@imgtec.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On Saturday 15 June 2013 22:16:13 Heiko St=FCbner wrote:
> Am Samstag, 15. Juni 2013, 21:56:05 schrieb Linus Walleij:
> > On Fri, Jun 14, 2013 at 12:39 AM, Laurent Pinchart wrote:
> > >         mmcif_pins: mmcif {
> > >                 mux {
> > >                         renesas,groups =3D "mmc0_data8_0", "mmc0_=
ctrl_0";
> > >                         renesas,function =3D "mmc0";
> > >                 };
> > >                 cfg {
> > >                         renesas,groups =3D "mmc0_data8_0";
> > >                         renesas,pins =3D "PORT279";
> > >                         bias-pull-up =3D <1>;
> >=20
> > If I understood your code correctly that last statement can *option=
ally*
> >=20
> > be written like just:
> >  bias-pull-up;
> >=20
> > Without the parameter?
> >=20
> > I think that Heiko's implementation does this anyway.
>=20
> Yep, with the fixes-series from yesterday the bias-pull-* now have a =
better
> default value of <1>.
>=20
> so you can do
> 	bias-pull-up;
> which is then identical to the
> 	bias-pull-up =3D <1>;
> above (both are valid of course).

My patch used bias-pull-up =3D <1>; as the current version of Heiko's D=
T parser=20
didn't support bias-pull-up; correctly at that time. It's fixed now, an=
d my=20
prefered is then bias-pull-up;.

> Disable would the be either
> 	bias-disable;
> or
> 	bias-pull-up =3D <0>;
>=20
> A driver should probably handle both, as both are valid pinconf optio=
ns or
> this.

I feel a bit uneasy about that. Do we really need to support two differ=
ent=20
ways to achieve the same result ?

--=20
Regards,

Laurent Pinchart

