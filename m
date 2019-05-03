From: Dragan Cvetic <draganc@xilinx.com>
Subject: RE: [PATCH V3 02/12] misc: xilinx-sdfec: add core driver
Date: Fri, 3 May 2019 16:41:21 +0000
Message-ID: <BL0PR02MB5681B0F2BC0D74D8604D4289CB350@BL0PR02MB5681.namprd02.prod.outlook.com>
References: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
 <1556402706-176271-3-git-send-email-dragan.cvetic@xilinx.com>
 <20190502172007.GA1874@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502172007.GA1874@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "arnd@arndb.de" <arnd@arndb.de>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Derek Kiernan <dkiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

Hi Greg,

Please find my inline comments below,

Regards
Dragan

> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Thursday 2 May 2019 18:20
> To: Dragan Cvetic <draganc@xilinx.com>
> Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@li=
sts.infradead.org; robh+dt@kernel.org;
> mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kerne=
l.org; Derek Kiernan <dkiernan@xilinx.com>
> Subject: Re: [PATCH V3 02/12] misc: xilinx-sdfec: add core driver
>=20
> On Sat, Apr 27, 2019 at 11:04:56PM +0100, Dragan Cvetic wrote:
> > +#define DRIVER_NAME "xilinx_sdfec"
> > +#define DRIVER_VERSION "0.3"
>=20
> Version means nothing with the driver in the kernel tree, please remove
> it.

Will be removed. Thank you.

>=20
> > +#define DRIVER_MAX_DEV BIT(MINORBITS)
>=20
> Why this number?  Why limit yourself to any number?
>=20

There can be max 8 devices for this driver. I'll change to 8.

> > +
> > +static struct class *xsdfec_class;
>=20
> Do you really need your own class?

When writing a character device driver, my goal is to create and register a=
n instance
of that structure associated with a struct file_operations, exposing a set =
of operations
to the user-space. One of the steps to make this goal is Create a class for=
 a devices,
visible in /sys/class/.

>=20
> > +static atomic_t xsdfec_ndevs =3D ATOMIC_INIT(0);
>=20
> Why?

At the end this become a minor number.=20
It is not needed, will be removed. Thanks.

>=20
> > +static dev_t xsdfec_devt;
>=20
> Why?
>=20
> Why not use misc_device for this?  Why do you need your own major with a
> bunch of minor devices reserved ahead of time?  Why not just create a
> new misc device for every individual device that happens to be found in
> the system?  That will make the code a lot simpler and smaller and
> easier.
>
>=20
>=20
> > +
> > +/**
> > + * struct xsdfec_dev - Driver data for SDFEC
> > + * @regs: device physical base address
> > + * @dev: pointer to device struct
> > + * @config: Configuration of the SDFEC device
> > + * @open_count: Count of char device being opened
> > + * @xsdfec_cdev: Character device handle
> > + * @irq_lock: Driver spinlock
> > + *
> > + * This structure contains necessary state for SDFEC driver to operate
> > + */
> > +struct xsdfec_dev {
> > +	void __iomem *regs;
> > +	struct device *dev;
> > +	struct xsdfec_config config;
> > +	atomic_t open_count;
> > +	struct cdev xsdfec_cdev;
> > +	/* Spinlock to protect state_updated and stats_updated */
> > +	spinlock_t irq_lock;
> > +};
> > +
> > +static const struct file_operations xsdfec_fops =3D {
> > +	.owner =3D THIS_MODULE,
> > +};
>=20
> No operations at all?  That's an easy driver :)


The operations are implemented in the later patches.


>=20
> thanks,
>=20
> greg k-h
