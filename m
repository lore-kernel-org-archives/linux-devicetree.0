From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v5 01/22] pinctrl: generic: Add DT bindings
Date: Fri, 14 Jun 2013 00:23:26 +0200
Message-ID: <1961223.akELqavQP8@avalon>
References: <1370989371-30846-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1370989371-30846-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <CACRpkdYev+hapkM075Sw7Yi0u+XpRvL74SwT39DV1aV1RtHC+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYev+hapkM075Sw7Yi0u+XpRvL74SwT39DV1aV1RtHC+Q@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Magnus Damm <damm@opensource.se>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, James Hogan <james.hogan@imgtec.com>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Wednesday 12 June 2013 11:24:38 Linus Walleij wrote:
> On Wed, Jun 12, 2013 at 12:22 AM, Laurent Pinchart wrote:
> > Document DT properties for the generic pinctrl parameters and add a
> > parser function.
> >=20
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
>=20
> It appears we have a race here, as something like three people,
> or four, happened to do generic pinconf bindings at the same time.
>=20
> Yesterday I applied Heiko St=FCbners patch
> "pinctrl: add function to parse generic pinconfig properties from a d=
t node"
> doing basically the same thing. With subtle differences...
> but it already supports schmittrigging and some more.
>=20
> It appears to be close to your idea though!
>=20
> Would it be possible for you to look at what I have on my "devel" bra=
nch
> now (same as submitted for -next), rebase on that and patch any probl=
ems?

OK, I will do so. In the meantime I'll resubmit this patch series witho=
ut the=20
pinconf DT bindings for inclusion in v3.11, and will then post follow-u=
p=20
patches to add pinconf DT support, for v3.11 or v3.12 depending on the =
timing.

> > +               if (param->flag) {
> > +                       ret =3D of_property_read_bool(np, param->pr=
operty)
> > +                           ? 0 : -EINVAL;
> > +                       val =3D 1;
> > +               } else {
> > +                       ret =3D of_property_read_u32(np, param->pro=
perty,
> > &val); +               }
>=20
> This construct is done differently in Heiko's code, please review it =
so we
> know we have a nice, efficient parser.

--=20
Regards,

Laurent Pinchart

