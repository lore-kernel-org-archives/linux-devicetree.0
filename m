From: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: RE: [PATCH 2/4] i3c: master: Check if devices have i3c_dev_boardinfo
 on i3c_master_add_i3c_dev_locked()
Date: Thu, 29 Aug 2019 15:57:32 +0000
Message-ID: <SN6PR12MB26553867412178B3F7190F0CAEA20@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
        <3e21481ddf53ea58f5899df6ec542b79b8cbcd68.1567071213.git.vitor.soares@synopsys.com>
        <20190829124457.3a750932@collabora.com>
        <SN6PR12MB265551F73B9B516CACB5B807AEA20@SN6PR12MB2655.namprd12.prod.outlook.com>
        <20190829163918.571fd0d8@collabora.com>
        <20190829163941.45380b19@collabora.com>
        <SN6PR12MB2655B08176E14BE9DF2BACA2AEA20@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190829172441.3a76385e@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829172441.3a76385e@collabora.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>, Vitor Soares <Vitor.Soares@synopsys.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>
List-Id: devicetree@vger.kernel.org



-----Original Message-----
From: Boris Brezillon=20
<boris.brezillon@collabora.com>=20
Sent: Thursday, August 29, 2019 4:25=20
PM
To: Vitor Soares <Vitor.Soares@synopsys.com>
Cc:=20
linux-kernel@vger.kernel.org; devicetree@vger.kernel.org;=20
linux-i3c@lists.infradead.org; bbrezillon@kernel.org; robh+dt@kernel.org;=20
mark.rutland@arm.com; Joao.Pinto@synopsys.com
Subject: Re: [PATCH 2/4]=20
i3c: master: Check if devices have i3c_dev_boardinfo on=20
i3c_master_add_i3c_dev_locked()

On Thu, 29 Aug 2019 15:07:08 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> From: Boris Brezillon=20
<boris.brezillon@collabora.com>
> Date: Thu, Aug 29, 2019 at 15:39:41
>=20

> > On Thu, 29 Aug 2019 16:39:18 +0200
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >  =20
> > > On Thu, 29 Aug 2019 14:00:44 +0000
> > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > >  =20
> > > > Hi Boris,
> > > >=20
> > > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > > Date: Thu, Aug 29, 2019 at 11:44:57
> > > >    =20
> > > > > On Thu, 29 Aug 2019 12:19:33 +0200
> > > > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > > > >      =20
> > > > > > The I3C devices described in DT might not be attached to the ma=
ster which
> > > > > > doesn't allow to assign a specific dynamic address.     =20
> > > > >=20
> > > > > I remember testing this when developing the framework, so, unless
> > > > > another patch regressed it, it should already work. I suspect pat=
ch 1
> > > > > is actually the regressing this use case.     =20
> > > >=20
> > > > For today it doesn't address the case where the device is described=
 with=20
> > > > static address =3D 0, which isn't attached to the controller.   =20
> > >=20
> > > Hm, I'm pretty sure I had designed the code to support that case (see
> > > [1]). It might be buggy, but nothing we can't fix I guess.
> > >  =20
> >=20
> > [1]https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__elixir.bootli=
n.com_linux_v5.3-2Drc6_source_drivers_i3c_master.c-23L1898&d=3DDwICAg&c=3DD=
PL6_X_6JkXFx7AXWqB0tg&r=3DqVuU64u9x77Y0Kd0PhDK_lpxFgg6PK9PateHwjb_DY0&m=3DI=
XS1ygIgEo5vwajk0iwd5aBDVBzRnVTjO3cg4iBmGNc&s=3DHC-AcYm-AZPrUBoALioej_BDnqOt=
JHltr39Z2yPkuU4&e=3D  =20
>=20
> That is only valid if you have olddev which will only exist if static=20
> address !=3D 0.

Hm, if you revert patch 1 (and assuming the device is properly defined
in the DT), you should have olddev !=3D NULL when reaching that point. If
that's not the case there's a bug somewhere that should be fixed.

No, because the device is not attached.
