From: Stephen Boyd <sboyd@kernel.org>
Subject: RE: [PATCH RESEND V6 2/2] clk: imx: scu: add cpu frequency scaling support
Date: Mon, 25 Feb 2019 09:21:48 -0800
Message-ID: <155111530880.77512.16435986555733393398@swboyd.mtv.corp.google.com>
References: <1550802436-13007-1-git-send-email-Anson.Huang@nxp.com> <1550802436-13007-2-git-send-email-Anson.Huang@nxp.com> <155086249004.77512.8709011386763447047@swboyd.mtv.corp.google.com> <DB3PR0402MB3916BA142113B84C0199C93EF5780@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB3916BA142113B84C0199C93EF5780@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Quoting Anson Huang (2019-02-22 18:32:28)
> > > +               cluster_id =3D 0;
> >=20
> > Do we still need to check this anymore? Why not just always use cluster=
_id 0?
>=20
> The i.MX8QXP ONLY has 1 cluster named A35, while on i.MX8QM there will be
> 2 clusters, A53 and A72, so we need to use the resource ID to initialize =
the cluster_id.
>=20
> >=20
> > > +
> > > +       /* CPU frequency scaling can ONLY be done by ARM-Trusted-Firm=
ware
> > */
> > > +       arm_smccc_smc(IMX_SIP_CPUFREQ, IMX_SIP_SET_CPUFREQ,
> > > +                     cluster_id, rate, 0, 0, 0, 0, &res);
> >=20
> > Because not checking would make this work, vs. checking causes this cod=
e to
> > sometimes use an uninitialized value from the stack.
>=20
>  89 +       if (rsrc_id =3D=3D IMX_SC_R_A35)
>  90 +               init.ops =3D &clk_scu_cpu_ops;
>  91 +       else
>  92 +               init.ops =3D &clk_scu_ops;
>=20
> I think it should be good. Only when plan to support cpu-freq scaling, th=
en the
> CPU clock will be switched to use clk_scu_cpu_ops and the clutser_id init=
ialization
> will be done according to CPU resource. For example, when we plan to supp=
ort i.MX8QM
> cpu-freq scaling, we will add A53 and A72 check here and switch the clock=
 ops to clk_scu_cpu_ops,
> also we will add the cluster_id initialization in the SMC clock set rate.
>=20

Ok. So then please make the set_rate function fail if the rsrc_id
doesn't match something expected. As the code is written right now, the
compiler can't figure out that cluster_id will always be assigned, so it
complains that it may be using uninitialized data.
