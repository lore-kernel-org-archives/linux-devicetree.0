From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 01/11] dt-bindings: Add vendor prefix for Silicon Linux.
Date: Fri, 1 Mar 2019 12:03:06 +0000
Message-ID: <TYXPR01MB1775ECF6D79FCA2C0040DA06C0760@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1547663874-29411-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1547663874-29411-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <TY1PR01MB1770A46D7FA45A8AFA923DADC0670@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190215075226.413d55dc@jawa> <c2eb829b-96a7-20cb-913f-ce4214f2156c@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c2eb829b-96a7-20cb-913f-ce4214f2156c@suse.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-2?Q?Andreas_F=E4rber?= <afaerber@suse.de>, Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, "David S. Miller" <davem@davemloft.net>, Geert Uytterhoeven <geert+renesas@glider.be>, Thierry Reding <treding@nvidia.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Kevin Hilman <khilman@baylibre.com>, Johan Hovold <johan@kernel.org>, Michal Simek <monstr@monstr.eu>, =?iso-8859-2?Q?Michal_Vok=E1=E8?= <michal.vokac@ysoft.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ben Whitten <ben.whitten@gmail.com>
List-Id: devicetree@vger.kernel.org

Thank you Andreas.

> From: Andreas F=E4rber <afaerber@suse.de>
> Sent: 15 February 2019 09:10
> Subject: Re: [PATCH 01/11] dt-bindings: Add vendor prefix for Silicon Lin=
ux.
>=20
> Hi Lukasz and Fabrizio,
>=20
> Am 15.02.19 um 07:52 schrieb Lukasz Majewski:
> > The best approach is to run:
> >
> > git format patch -1 <your patch sha>
> >
> > And then
> >
> > scripts/get_maintainer.pl 0001-xxxxxxx
> >
> > You shall see the the list of people to send the patch.
>=20
> No, that does not answer his question. And please don't top-post.
>=20
> >> Who is the best person for taking this patch?
>=20
> The answer is: whomever is taking dt-bindings patches in the following
> 10 patches that make use of this prefix, once you have a Reviewed-by
> from Rob. So, most likely the Renesas kernel maintainer(s), i.e. Simon,
> which differs from get_maintainers.pl of vendor-prefixes.txt.

Simon, do you think you can take this patch?

Thanks,
Fab

>=20
> Regards,
> Andreas
>=20
> >>> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >>> Sent: 16 January 2019 18:38
> >>> Subject: [PATCH 01/11] dt-bindings: Add vendor prefix for Silicon
> >>> Linux.
> >>>
> >>> From: Biju Das <biju.das@bp.renesas.com>
> >>>
> >>> Add Silicon Linux to the list of devicetree vendor prefixes.
> >>>
> >>> Website: http://www.si-linux.co.jp
> >>>
> >>> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> >>> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >>> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt
> >>> b/Documentation/devicetree/bindings/vendor-prefixes.txt index
> >>> 4b1a2a8..02a7037 100644 ---
> >>> a/Documentation/devicetree/bindings/vendor-prefixes.txt +++
> >>> b/Documentation/devicetree/bindings/vendor-prefixes.txt @@ -344,6
> >>> +344,7 @@ sgxSGX Sensortech sharpSharp Corporation
> >>>  shimafujiShimafuji Electric, Inc.
> >>>  si-enSi-En Technology Ltd.
> >>> +si-linuxSilicon Linux Corporation
> >>>  sifiveSiFive, Inc.
> >>>  sigmaSigma Designs, Inc.
> >>>  siiSeiko Instruments, Inc.
> >>> --
> >>> 2.7.4
> >>
> >>
> >>
> >> Renesas Electronics Europe GmbH,Geschaeftsfuehrer/President : Michael
> >> Hannawald, Sitz der Gesellschaft/Registered office: Duesseldorf,
> >> Arcadiastrasse 10, 40472 Duesseldorf,
> >> Germany,Handelsregister/Commercial Register: Duesseldorf, HRB 3708
> >> USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WEEE
> >> reg. no.: DE 14978647
> >
> >
> >
> >
> > Best regards,
> >
> > Lukasz Majewski
> >
> > --
> >
> > DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> > HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> > Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.d=
e
> >
>=20
>=20
> --
> SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton
> HRB 21284 (AG N=FCrnberg)
