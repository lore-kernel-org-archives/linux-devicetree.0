From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 1/5] mfd: max14577: Add max14577 MFD driver core
Date: Fri, 22 Nov 2013 10:07:57 +0000
Message-ID: <20131122100757.GI23067@lee--X1>
References: <1385109972-28059-1-git-send-email-k.kozlowski@samsung.com>
 <1385109972-28059-2-git-send-email-k.kozlowski@samsung.com>
 <20131122093118.GH23067@lee--X1>
 <1385114292.29083.8.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1385114292.29083.8.camel@AMDC1943>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Anton Vorontsov <anton@enomsg.org>, David Woodhouse <dwmw2@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org

> > > +static struct mfd_cell max14577_devs[] =3D {
> > > +	{ .name =3D "max14577-muic", },
> > > +	{ .name =3D "max14577-regulator", },
> > > +	{ .name =3D "max14577-charger", },
> > > +};
> >=20
> > If these all support device tree, shouldn't you be populating
> > max14577_devs[x].of_compatible too? That way the MFD core will
> > automatically setup your dev.of_node pointers for you?
>=20
> Only the regulator driver uses bindings from DT and it searches for
> "regulators" node in parent's node:
> 	np =3D of_get_child_by_name(max14577->dev->of_node, "regulators");
> I can add of_compatible but I think this won't be reflected in actual
> DTS.

Well it should be. I'll reply to the other patch too.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
