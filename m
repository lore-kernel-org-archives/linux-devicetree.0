From: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: RE: [PATCH 1/4] i3c: master: detach and free device if
 pre_assign_dyn_addr() fails
Date: Thu, 29 Aug 2019 16:23:29 +0000
Message-ID: <SN6PR12MB2655F2C2851DA16E2C624998AEA20@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
        <e26948eaaf765f683d8fe0618a31a98e2ecc0e65.1567071213.git.vitor.soares@synopsys.com>
        <20190829124115.482cd8ec@collabora.com>
        <SN6PR12MB26551F172804D039F3EAA991AEA20@SN6PR12MB2655.namprd12.prod.outlook.com>
        <20190829163520.126d42d6@collabora.com>
        <SN6PR12MB2655E9E544D7E96323BAC796AEA20@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190829173709.79c093dd@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829173709.79c093dd@collabora.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>, Vitor Soares <Vitor.Soares@synopsys.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>, Przemyslaw Gaj <pgaj@cadence.com>
List-Id: devicetree@vger.kernel.org

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Thu, Aug 29, 2019 at 16:37:09

> On Thu, 29 Aug 2019 15:23:30 +0000
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
>=20
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > Date: Thu, Aug 29, 2019 at 15:35:20
> >=20
> > > On Thu, 29 Aug 2019 13:53:24 +0000
> > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > >  =20
> > > > Hi Boris,
> > > >=20
> > > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > > Date: Thu, Aug 29, 2019 at 11:41:15
> > > >  =20
> > > > > +Przemek
> > > > >=20
> > > > > Please try to Cc active I3C contributors so they get a chance to
> > > > > comment on your patches.   =20
> > > >=20
> > > > I can do that next time.
> > > >  =20
> > > > >=20
> > > > > On Thu, 29 Aug 2019 12:19:32 +0200
> > > > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > > > >    =20
> > > > > > On pre_assing_dyn_addr() the devices that fail:
> > > > > >   i3c_master_setdasa_locked()
> > > > > >   i3c_master_reattach_i3c_dev()
> > > > > >   i3c_master_retrieve_dev_info()
> > > > > >=20
> > > > > > are kept in memory and master->bus.devs list. This makes the i3=
c devices
> > > > > > without a dynamic address are sent on DEFSLVS CCC command. Fix =
this by
> > > > > > detaching and freeing the devices that fail on pre_assign_dyn_a=
ddr().   =20
> > > > >=20
> > > > > I don't think removing those entries is a good strategy, as one m=
ight
> > > > > want to try to use a different dynamic address if the requested o=
ne
> > > > > is not available.   =20
> > > >=20
> > > > Do you mean same 'assigned-address' attribute in DT? =20
> > >=20
> > > Yes, or say it's another device that got the address we want and this
> > > device doesn't want to release the address (I'm assuming the !SA case=
).
> > >  =20
> > > >=20
> > > > If so, it is checked here:
> > > >=20
> > > > static int i3c_master_bus_init(struct i3c_master_controller *master=
)
> > > > ...
> > > > 	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
> > > > 		struct i3c_device_info info =3D {
> > > > 			.static_addr =3D i3cboardinfo->static_addr,
> > > > 		};
> > > >=20
> > > > 		if (i3cboardinfo->init_dyn_addr) {
> > > > 			status =3D i3c_bus_get_addr_slot_status(&master->bus,
> > > > 			^
> > > > 						i3cboardinfo->init_dyn_addr);
> > > > 			if (status !=3D I3C_ADDR_SLOT_FREE) {
> > > > 				ret =3D -EBUSY;
> > > > 				goto err_detach_devs;
> > > > 			}
> > > > 		}
> > > >=20
> > > > 		i3cdev =3D i3c_master_alloc_i3c_dev(master, &info);
> > > > 		if (IS_ERR(i3cdev)) {
> > > > 			ret =3D PTR_ERR(i3cdev);
> > > > 			goto err_detach_devs;
> > > > 		}
> > > >=20
> > > > 		i3cdev->boardinfo =3D i3cboardinfo;
> > > >=20
> > > > 		ret =3D i3c_master_attach_i3c_dev(master, i3cdev);
> > > > 		if (ret) {
> > > > 			i3c_master_free_i3c_dev(i3cdev);
> > > > 			goto err_detach_devs;
> > > > 		}
> > > > 	}
> > > > ...
> > > >=20
> > > > and later if it fails i3c_master_pre_assign_dyn_addr(), the device =
can=20
> > > > participate in Enter Dynamic Address Assignment process.
> > > > I may need to check the boardinfo->init_dyn_addr status on=20
> > > > i3c_master_add_i3c_dev_locked before i3c_master_setnewda_locked(). =
=20
> > >=20
> > > I need to double check but I thought we were already handling that ca=
se
> > > properly. =20
> >=20
> > Yes, it is handled in the code above.
>=20
> No, I meant the 'assign init_dyn_addr even if !SA', and the code I
> pointed in my other reply tends to confirm that this is something we
> already take into account (maybe not correctly, but the code is here).

Please check my last comment in patch 2/4.

>=20
> >=20
> > >  =20
> > > >  =20
> > > > > Why not simply skipping entries that have ->dyn_addr
> > > > > set to 0 when preparing a DEFSLVS frame   =20
> > > >=20
> > > > I considered that solution too but if the device isn't enumerated w=
hy=20
> > > > should it be attached and kept in memory? =20
> > >=20
> > > Might be a device that supports HJ, and in that case we might want th=
e
> > > controller to reserve a slot in its device table for that device.
> > > Anyway, it doesn't hurt to have it around as long as we don't pass th=
e
> > > device through DEFSLVS if it doesn't have a dynamic address. I really
> > > prefer to keep the logic unchanged and fix it if it needs to be fixed=
. =20
> >=20
> > Well, we aren't reserving a slot because we need another one to attach=
=20
> > the device when it is enumerated and hence a device may be using 2 slot=
s=20
> > in the controller.
>=20
> Right, you shouldn't reserve a slot when ->static_address =3D=3D 0 &&
> ->dynamic_address =3D=3D 0, but I still don't see where the problem is wi=
th
> the solution we have right now, sorry. Note that even if you reserve a
> slot in that case, the device only occupies 2 slots for a short amount
> of time, because the add_i3c_dev() logic will detect that the descriptor
> already exists and reattach the device with its new address.

I understand that but if we have limited resources it is a problem.

>=20
> > It may cause problems in HC with reduced slots and it is another reason=
=20
> > why I think we should detach device without dynamic address after the=20
> > enumeration phase.
>=20
> Can you please try the approach I suggest? =3D> fix the existing logic to
> make it work without this "free undiscovered dev desc, reallocate later"
> dance.

I can do that but we still have the issue above to solve and figure how=20
to set a dynamic address for devices without static address.
