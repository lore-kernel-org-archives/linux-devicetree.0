From: Dragan Cvetic <draganc@xilinx.com>
Subject: RE: [PATCH V3 04/12] misc: xilinx_sdfec: Add open, close and ioctl
Date: Fri, 3 May 2019 16:44:57 +0000
Message-ID: <BL0PR02MB5681F4C4AF4786AC6241DDA1CB350@BL0PR02MB5681.namprd02.prod.outlook.com>
References: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
 <1556402706-176271-5-git-send-email-dragan.cvetic@xilinx.com>
 <20190502172304.GB1874@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502172304.GB1874@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "arnd@arndb.de" <arnd@arndb.de>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Derek Kiernan <dkiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org

Hi Greg,

Please find inline comments below.

Regards
Dragan

> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Thursday 2 May 2019 18:23
> To: Dragan Cvetic <draganc@xilinx.com>
> Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@li=
sts.infradead.org; robh+dt@kernel.org;
> mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kerne=
l.org; Derek Kiernan <dkiernan@xilinx.com>
> Subject: Re: [PATCH V3 04/12] misc: xilinx_sdfec: Add open, close and ioc=
tl
>=20
> On Sat, Apr 27, 2019 at 11:04:58PM +0100, Dragan Cvetic wrote:
> > +static int xsdfec_dev_open(struct inode *iptr, struct file *fptr)
> > +{
> > +	struct xsdfec_dev *xsdfec;
> > +
> > +	xsdfec =3D container_of(iptr->i_cdev, struct xsdfec_dev, xsdfec_cdev)=
;
> > +
> > +	if (!atomic_dec_and_test(&xsdfec->open_count)) {
>=20
> Why do you care about this?
>=20
> And do you really think it matters?  What are you trying to protect from
> here?

There is a request to increase the driver security.=20
It is acceptable for us for now, even with non-perfections (will not be pro=
tected if opened twice with dup() or fork()).
This is covered in the documentation.
>=20
> > +		atomic_inc(&xsdfec->open_count);
> > +		return -EBUSY;
> > +	}
> > +
> > +	fptr->private_data =3D xsdfec;
> > +	return 0;
> > +}
> > +
> > +static int xsdfec_dev_release(struct inode *iptr, struct file *fptr)
> > +{
> > +	struct xsdfec_dev *xsdfec;
> > +
> > +	xsdfec =3D container_of(iptr->i_cdev, struct xsdfec_dev, xsdfec_cdev)=
;
> > +
> > +	atomic_inc(&xsdfec->open_count);
>=20
> You increment a number when the device is closed?
>=20
> You are trying to make it hard to maintain this code over time :)
>=20
>=20
> > +	return 0;
> > +}
> > +
> > +static long xsdfec_dev_ioctl(struct file *fptr, unsigned int cmd,
> > +			     unsigned long data)
> > +{
> > +	struct xsdfec_dev *xsdfec =3D fptr->private_data;
> > +	void __user *arg =3D NULL;
> > +	int rval =3D -EINVAL;
> > +	int err =3D 0;
> > +
> > +	if (!xsdfec)
> > +		return rval;
> > +
> > +	if (_IOC_TYPE(cmd) !=3D XSDFEC_MAGIC)
> > +		return -ENOTTY;
> > +
> > +	/* check if ioctl argument is present and valid */
> > +	if (_IOC_DIR(cmd) !=3D _IOC_NONE) {
> > +		arg =3D (void __user *)data;
> > +		if (!arg) {
> > +			dev_err(xsdfec->dev,
> > +				"xilinx sdfec ioctl argument is NULL Pointer");
>=20
> You just created a way for userspace to spam the kernel log, please do
> not do that :(

Will be removed.

>=20
>=20
>=20
> > +			return rval;
> > +		}
> > +	}
> > +
> > +	if (err) {
> > +		dev_err(xsdfec->dev, "Invalid xilinx sdfec ioctl argument");
> > +		return -EFAULT;
>=20
> Wrong error, you did not have a memory fault.

Absolutely useless code. Will be removed. Thanks.

>=20
> Again, you just created a way to spam the kernel log by a user :(
>=20
> thanks,
>=20
> greg k-h
