From: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: RE: [PATCH 1/4] i3c: master: detach and free device if
 pre_assign_dyn_addr() fails
Date: Thu, 29 Aug 2019 13:53:24 +0000
Message-ID: <SN6PR12MB26551F172804D039F3EAA991AEA20@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
        <e26948eaaf765f683d8fe0618a31a98e2ecc0e65.1567071213.git.vitor.soares@synopsys.com>
 <20190829124115.482cd8ec@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829124115.482cd8ec@collabora.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>, Vitor Soares <Vitor.Soares@synopsys.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>, Przemyslaw Gaj <pgaj@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi Boris,

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Thu, Aug 29, 2019 at 11:41:15

> +Przemek
>=20
> Please try to Cc active I3C contributors so they get a chance to
> comment on your patches.

I can do that next time.

>=20
> On Thu, 29 Aug 2019 12:19:32 +0200
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
>=20
> > On pre_assing_dyn_addr() the devices that fail:
> >   i3c_master_setdasa_locked()
> >   i3c_master_reattach_i3c_dev()
> >   i3c_master_retrieve_dev_info()
> >=20
> > are kept in memory and master->bus.devs list. This makes the i3c device=
s
> > without a dynamic address are sent on DEFSLVS CCC command. Fix this by
> > detaching and freeing the devices that fail on pre_assign_dyn_addr().
>=20
> I don't think removing those entries is a good strategy, as one might
> want to try to use a different dynamic address if the requested one
> is not available.

Do you mean same 'assigned-address' attribute in DT?

If so, it is checked here:

static int i3c_master_bus_init(struct i3c_master_controller *master)
...
	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
		struct i3c_device_info info =3D {
			.static_addr =3D i3cboardinfo->static_addr,
		};

		if (i3cboardinfo->init_dyn_addr) {
			status =3D i3c_bus_get_addr_slot_status(&master->bus,
			^
						i3cboardinfo->init_dyn_addr);
			if (status !=3D I3C_ADDR_SLOT_FREE) {
				ret =3D -EBUSY;
				goto err_detach_devs;
			}
		}

		i3cdev =3D i3c_master_alloc_i3c_dev(master, &info);
		if (IS_ERR(i3cdev)) {
			ret =3D PTR_ERR(i3cdev);
			goto err_detach_devs;
		}

		i3cdev->boardinfo =3D i3cboardinfo;

		ret =3D i3c_master_attach_i3c_dev(master, i3cdev);
		if (ret) {
			i3c_master_free_i3c_dev(i3cdev);
			goto err_detach_devs;
		}
	}
...

and later if it fails i3c_master_pre_assign_dyn_addr(), the device can=20
participate in Enter Dynamic Address Assignment process.
I may need to check the boardinfo->init_dyn_addr status on=20
i3c_master_add_i3c_dev_locked before i3c_master_setnewda_locked().

> Why not simply skipping entries that have ->dyn_addr
> set to 0 when preparing a DEFSLVS frame

I considered that solution too but if the device isn't enumerated why=20
should it be attached and kept in memory? Anyway we have i3c_boardinfo=20
with DT information.

>=20
> >=20
> > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > ---
> >  drivers/i3c/master.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 5f4bd52..4d29e1f 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -1438,7 +1438,7 @@ static void i3c_master_pre_assign_dyn_addr(struct=
 i3c_dev_desc *dev)
> >  	ret =3D i3c_master_setdasa_locked(master, dev->info.static_addr,
> >  					dev->boardinfo->init_dyn_addr);
> >  	if (ret)
> > -		return;
> > +		goto err_detach_dev;
> > =20
> >  	dev->info.dyn_addr =3D dev->boardinfo->init_dyn_addr;
> >  	ret =3D i3c_master_reattach_i3c_dev(dev, 0);
> > @@ -1453,6 +1453,10 @@ static void i3c_master_pre_assign_dyn_addr(struc=
t i3c_dev_desc *dev)
> > =20
> >  err_rstdaa:
> >  	i3c_master_rstdaa_locked(master, dev->boardinfo->init_dyn_addr);
> > +
> > +err_detach_dev:
> > +	i3c_master_detach_i3c_dev(dev);
> > +	i3c_master_free_i3c_dev(dev);
>=20
> We certainly shouldn't detach/free the i3c_dev_desc from here. If it
> has to be done somewhere (which I'd like to avoid), it should be done
> in i3c_master_bus_init() (i3c_master_pre_assign_dyn_addr() should be
> converted to return an int in that case).

I can change it to return an error.=20

>=20
> >  }
> > =20
> >  static void
> > @@ -1647,7 +1651,7 @@ static int i3c_master_bus_init(struct i3c_master_=
controller *master)
> >  	enum i3c_addr_slot_status status;
> >  	struct i2c_dev_boardinfo *i2cboardinfo;
> >  	struct i3c_dev_boardinfo *i3cboardinfo;
> > -	struct i3c_dev_desc *i3cdev;
> > +	struct i3c_dev_desc *i3cdev, *i3ctmp;
> >  	struct i2c_dev_desc *i2cdev;
> >  	int ret;
> > =20
> > @@ -1746,7 +1750,8 @@ static int i3c_master_bus_init(struct i3c_master_=
controller *master)
> >  	 * Pre-assign dynamic address and retrieve device information if
> >  	 * needed.
> >  	 */
> > -	i3c_bus_for_each_i3cdev(&master->bus, i3cdev)
> > +	list_for_each_entry_safe(i3cdev, i3ctmp, &master->bus.devs.i3c,
> > +				 common.node)
> >  		i3c_master_pre_assign_dyn_addr(i3cdev);
> > =20
> >  	ret =3D i3c_master_do_daa(master);

Thank for your feedback.

Best regards,
Vitor Soares
