From: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: RE: [PATCH 2/4] i3c: master: Check if devices have i3c_dev_boardinfo
 on i3c_master_add_i3c_dev_locked()
Date: Thu, 29 Aug 2019 14:00:44 +0000
Message-ID: <SN6PR12MB265551F73B9B516CACB5B807AEA20@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
        <3e21481ddf53ea58f5899df6ec542b79b8cbcd68.1567071213.git.vitor.soares@synopsys.com>
 <20190829124457.3a750932@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829124457.3a750932@collabora.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>, Vitor Soares <Vitor.Soares@synopsys.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>
List-Id: devicetree@vger.kernel.org

Hi Boris,

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Thu, Aug 29, 2019 at 11:44:57

> On Thu, 29 Aug 2019 12:19:33 +0200
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
>=20
> > The I3C devices described in DT might not be attached to the master whi=
ch
> > doesn't allow to assign a specific dynamic address.
>=20
> I remember testing this when developing the framework, so, unless
> another patch regressed it, it should already work. I suspect patch 1
> is actually the regressing this use case.

For today it doesn't address the case where the device is described with=20
static address =3D 0, which isn't attached to the controller.
With this change both cases are covered.

>=20
> >=20
> > This patch check if a device has i3c_dev_boardinfo and add it to
> > i3c_dev_desc structure. In this conditions, the framework will try to
> > assign the i3c_dev_boardinfo->init_dyn_addr even if stactic address =3D=
 0.
> >=20
> > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > ---
> >  drivers/i3c/master.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >=20
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 4d29e1f..85fbda6 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -1795,6 +1795,23 @@ i3c_master_search_i3c_dev_duplicate(struct i3c_d=
ev_desc *refdev)
> >  	return NULL;
> >  }
> > =20
> > +static struct i3c_dev_boardinfo *
> > +i3c_master_search_i3c_boardinfo(struct i3c_dev_desc *dev)
> > +{
> > +	struct i3c_master_controller *master =3D i3c_dev_get_master(dev);
> > +	struct i3c_dev_boardinfo *boardinfo;
> > +
> > +	if (dev->boardinfo)
> > +		return NULL;
> > +
> > +	list_for_each_entry(boardinfo, &master->boardinfo.i3c, node) {
> > +		if (dev->info.pid =3D=3D boardinfo->pid)
> > +			return boardinfo;
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> >  /**
> >   * i3c_master_add_i3c_dev_locked() - add an I3C slave to the bus
> >   * @master: master used to send frames on the bus
> > @@ -1816,6 +1833,7 @@ int i3c_master_add_i3c_dev_locked(struct i3c_mast=
er_controller *master,
> >  {
> >  	struct i3c_device_info info =3D { .dyn_addr =3D addr };
> >  	struct i3c_dev_desc *newdev, *olddev;
> > +	struct i3c_dev_boardinfo *boardinfo;
> >  	u8 old_dyn_addr =3D addr, expected_dyn_addr;
> >  	struct i3c_ibi_setup ibireq =3D { };
> >  	bool enable_ibi =3D false;
> > @@ -1875,6 +1893,10 @@ int i3c_master_add_i3c_dev_locked(struct i3c_mas=
ter_controller *master,
> >  	if (ret)
> >  		goto err_detach_dev;
> > =20
> > +	boardinfo =3D i3c_master_search_i3c_boardinfo(newdev);
> > +	if (boardinfo)
> > +		newdev->boardinfo =3D boardinfo;
> > +
> >  	/*
> >  	 * Depending on our previous state, the expected dynamic address migh=
t
> >  	 * differ:

Best regards,
Vitor Soares
