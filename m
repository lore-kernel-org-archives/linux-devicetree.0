From: Dragan Cvetic <draganc@xilinx.com>
Subject: RE: [PATCH V4 04/12] misc: xilinx_sdfec: Add open, close and ioctl
Date: Thu, 6 Jun 2019 18:22:07 +0000
Message-ID: <CH2PR02MB63591C650DB8C7E15D9D3CCDCB170@CH2PR02MB6359.namprd02.prod.outlook.com>
References: <1558784245-108751-1-git-send-email-dragan.cvetic@xilinx.com>
 <1558784245-108751-5-git-send-email-dragan.cvetic@xilinx.com>
 <20190606132842.GC7943@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190606132842.GC7943@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "arnd@arndb.de" <arnd@arndb.de>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Derek Kiernan <dkiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Thursday 6 June 2019 14:29
> To: Dragan Cvetic <draganc@xilinx.com>
> Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@li=
sts.infradead.org; robh+dt@kernel.org;
> mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kerne=
l.org; Derek Kiernan <dkiernan@xilinx.com>
> Subject: Re: [PATCH V4 04/12] misc: xilinx_sdfec: Add open, close and ioc=
tl
>=20
> On Sat, May 25, 2019 at 12:37:17PM +0100, Dragan Cvetic wrote:
> > +static int xsdfec_dev_open(struct inode *iptr, struct file *fptr)
> > +{
> > +	return 0;
> > +}
> > +
> > +static int xsdfec_dev_release(struct inode *iptr, struct file *fptr)
> > +{
> > +	return 0;
> > +}
>=20
> empty open/close functions are never needed, just drop them.

Accepted.
Will remove them.

>=20
> > +
> > +static long xsdfec_dev_ioctl(struct file *fptr, unsigned int cmd,
> > +			     unsigned long data)
> > +{
> > +	struct xsdfec_dev *xsdfec;
> > +	void __user *arg =3D NULL;
> > +	int rval =3D -EINVAL;
> > +
> > +	xsdfec =3D container_of(fptr->private_data, struct xsdfec_dev, miscde=
v);
> > +	if (!xsdfec)
> > +		return rval;
>=20
> It is impossible for container_of() to return NULL, unless something
> very magical and rare just happened.  It's just doing pointer math, you
> can never check the return value of it.

Accepted.
Will remove if statement.

>=20
> > +
> > +	if (_IOC_TYPE(cmd) !=3D XSDFEC_MAGIC)
> > +		return -ENOTTY;
>=20
> How can this happen?

Accepted.
Will be removed.

>=20
> > +
> > +	/* check if ioctl argument is present and valid */
> > +	if (_IOC_DIR(cmd) !=3D _IOC_NONE) {
> > +		arg =3D (void __user *)data;
> > +		if (!arg)
> > +			return rval;
> > +	}
> > +
> > +	switch (cmd) {
> > +	default:
> > +		/* Should not get here */
> > +		dev_warn(xsdfec->dev, "Undefined SDFEC IOCTL");
>=20
> Nice that userspace has a way to fill up the kernel log :(
>=20
> Just return the correct error here, don't log it.

Accepted.
Will remove log.

>=20
> thanks,
>=20
> greg k-h
