From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: Re: [PATCH 2/8] regulator: add support for SY8824C regulator
Date: Wed, 28 Aug 2019 05:49:16 +0000
Message-ID: <20190828133757.6a0fe6dd@xhacker.debian>
References: <20190827163252.4982af95@xhacker.debian>
        <20190827163418.1a32fc48@xhacker.debian>
        <20190827194437.GO23391@sirena.co.uk>
        <20190828112705.5e683693@xhacker.debian>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828112705.5e683693@xhacker.debian>
Content-Language: en-US
Content-ID: <AABB45CDBCCCF849A0ACA2D834A0B47D@namprd03.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 28 Aug 2019 11:27:05 +0800 Jisheng Zhang wrote:

> Hi Mark,
>=20
> On Tue, 27 Aug 2019 20:44:37 +0100 Mark Brown wrote:
>=20
> > On Tue, Aug 27, 2019 at 08:45:33AM +0000, Jisheng Zhang wrote:
> >=20
> > This looks mostly good and I'll apply it, a couple of small
> > things though:
> >  =20
> > > @@ -0,0 +1,192 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * SY8824C regulator driver
> > > + *   =20
> >=20
> > Please send a patch which updates the entire comment block to be
> > C++ style so it looks consistent. =20
>=20
> Do you mean update the following style
>=20
> A:
>=20
> // SPDX-License-Identifier: GPL-2.0
> /*
>  * SY8824C regulator driver
>  * ...
>=20
>=20
> as B:
>=20
> // SPDX-License-Identifier: GPL-2.0
> // SY8824C regulator driver
> // ...
>=20
> I'm not sure which style is correct. But I see B is commonly used

sorry, typo. I mean "I see A is commonly used ..."

> in lots .c source files in other dirs, such as kernel/ mm/ etc.
>=20
> Could you please clarify?
>=20
> Thanks
>=20
> >  =20
> > > +#define BUCK_EN		(1 << 7)
> > > +#define MODE		(1 << 6)
> > > +   =20
> >=20
> > Please also add prefixes to these to namespace them, especially
> > MODE is likely to collide with something later. =20
>=20
> good idea. Will do in newer version
