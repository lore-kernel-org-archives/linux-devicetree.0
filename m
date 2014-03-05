From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v5 3/7] pci: Create pci_host_bridge before its associated
 bus in pci_create_root_bus.
Date: Wed, 5 Mar 2014 08:19:29 +0000
Message-ID: <20140305081929.GE1692@e106497-lin.cambridge.arm.com>
References: <1393948204-11555-1-git-send-email-Liviu.Dudau@arm.com>
 <1393948204-11555-4-git-send-email-Liviu.Dudau@arm.com>
 <53169E86.1090609@huawei.com>
 <002401cf382d$3062aa50$9127fef0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <002401cf382d$3062aa50$9127fef0$%han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: 'Yijing Wang' <wangyijing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, 'linux-pci' <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, 'Bjorn Helgaas' <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, 'linaro-kernel' <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, 'Benjamin Herrenschmidt' <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, 'LKML' <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, 'LAKML' <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, 'Tanmay Inamdar' <tinamdar-qTEPVZfXA3Y@public.gmane.org>, 'Arnd Bergmann' <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 05, 2014 at 04:41:35AM +0000, Jingoo Han wrote:
> On Wednesday, March 05, 2014 12:48 PM, Yijing Wang wrote:
> > On 2014/3/4 23:50, Liviu Dudau wrote:
> > > Before commit 7b5436635800 the pci_host_bridge was created before=
 the root bus.
> > > As that commit has added a needless dependency on the bus for pci=
_alloc_host_bridge()
> > > the creation order has been changed for no good reason. Revert th=
e order of
> > > creation as we are going to depend on the pci_host_bridge structu=
re to retrieve the
> > > domain number of the root bus.
> > >
> > > Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> > >
> > > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > > index 6e34498..78ccba0 100644
> > > --- a/drivers/pci/probe.c
> > > +++ b/drivers/pci/probe.c
> > > @@ -505,7 +505,7 @@ static void pci_release_host_bridge_dev(struc=
t device *dev)
> > >  	kfree(bridge);
> > >  }
> > >
> > > -static struct pci_host_bridge *pci_alloc_host_bridge(struct pci_=
bus *b)
> > > +static struct pci_host_bridge *pci_alloc_host_bridge(void)
> > >  {
> > >  	struct pci_host_bridge *bridge;
> > >
> > > @@ -514,7 +514,6 @@ static struct pci_host_bridge *pci_alloc_host=
_bridge(struct pci_bus *b)
> > >  		return NULL;
> > >
> > >  	INIT_LIST_HEAD(&bridge->windows);
> > > -	bridge->bus =3D b;
> > >  	return bridge;
> > >  }
> > >
> > > @@ -1727,9 +1726,21 @@ struct pci_bus *pci_create_root_bus(struct=
 device *parent, int bus,
> > >  	char bus_addr[64];
> > >  	char *fmt;
> > >
> > > +	bridge =3D pci_alloc_host_bridge();
> > > +	if (!bridge)
> > > +		return NULL;
> > > +
> > > +	bridge->dev.parent =3D parent;
> > > +	bridge->dev.release =3D pci_release_host_bridge_dev;
> > > +	error =3D pcibios_root_bridge_prepare(bridge);
> > > +	if (error) {
> > > +		kfree(bridge);
> > > +		return NULL;
> >=20
> > What about use goto err_out?
>=20
> +1
>=20
> I agree with your opinion.
> It makes the code simpler.

Hi Yijing and Jingoo,

Thanks for reviewing these patches, I will make the change for the next=
 version.

Best regards,
Liviu

>=20
> Best regards,
> Jingoo Han
>=20
> >=20
> > > +	}
> > > +
> > >  	b =3D pci_alloc_bus();
> > >  	if (!b)
> > > -		return NULL;
> > > +		goto err_out;
> > >
> > >  	b->sysdata =3D sysdata;
> > >  	b->ops =3D ops;
> > > @@ -1738,26 +1749,15 @@ struct pci_bus *pci_create_root_bus(struc=
t device *parent, int bus,
> > >  	if (b2) {
> > >  		/* If we already got to this bus through a different bridge, i=
gnore it */
> > >  		dev_dbg(&b2->dev, "bus already known\n");
> > > -		goto err_out;
> > > +		goto err_bus_out;
> > >  	}
> > >
> > > -	bridge =3D pci_alloc_host_bridge(b);
> > > -	if (!bridge)
> > > -		goto err_out;
> > > -
> > > -	bridge->dev.parent =3D parent;
> > > -	bridge->dev.release =3D pci_release_host_bridge_dev;
> > > +	bridge->bus =3D b;
> > >  	dev_set_name(&bridge->dev, "pci%04x:%02x", pci_domain_nr(b), bu=
s);
> > > -	error =3D pcibios_root_bridge_prepare(bridge);
> > > -	if (error) {
> > > -		kfree(bridge);
> > > -		goto err_out;
> > > -	}
> > > -
> > >  	error =3D device_register(&bridge->dev);
> > >  	if (error) {
> > >  		put_device(&bridge->dev);
> > > -		goto err_out;
> > > +		goto err_bus_out;
> > >  	}
> > >  	b->bridge =3D get_device(&bridge->dev);
> > >  	device_enable_async_suspend(b->bridge);
> > > @@ -1814,8 +1814,10 @@ struct pci_bus *pci_create_root_bus(struct=
 device *parent, int bus,
> > >  class_dev_reg_err:
> > >  	put_device(&bridge->dev);
> > >  	device_unregister(&bridge->dev);
> > > -err_out:
> > > +err_bus_out:
> > >  	kfree(b);
> > > +err_out:
> > > +	kfree(bridge);
> > >  	return NULL;
> > >  }
> > >
> > >
>=20
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
