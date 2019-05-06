From: Dragan Cvetic <draganc@xilinx.com>
Subject: RE: [PATCH V3 02/12] misc: xilinx-sdfec: add core driver
Date: Mon, 6 May 2019 12:23:56 +0000
Message-ID: <BL0PR02MB56814D6EACC16938A0575D16CB300@BL0PR02MB5681.namprd02.prod.outlook.com>
References: <1556402706-176271-1-git-send-email-dragan.cvetic@xilinx.com>
 <1556402706-176271-3-git-send-email-dragan.cvetic@xilinx.com>
 <20190502172007.GA1874@kroah.com>
 <BL0PR02MB5681B0F2BC0D74D8604D4289CB350@BL0PR02MB5681.namprd02.prod.outlook.com>
 <20190504075502.GA11133@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190504075502.GA11133@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "arnd@arndb.de" <arnd@arndb.de>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Derek Kiernan <dkiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Saturday 4 May 2019 08:55
> To: Dragan Cvetic <draganc@xilinx.com>
> Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@li=
sts.infradead.org; robh+dt@kernel.org;
> mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kerne=
l.org; Derek Kiernan <dkiernan@xilinx.com>
> Subject: Re: [PATCH V3 02/12] misc: xilinx-sdfec: add core driver
>=20
> On Fri, May 03, 2019 at 04:41:21PM +0000, Dragan Cvetic wrote:
> > Hi Greg,
> >
> > Please find my inline comments below,
> >
> > Regards
> > Dragan
> >
> > > -----Original Message-----
> > > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > > Sent: Thursday 2 May 2019 18:20
> > > To: Dragan Cvetic <draganc@xilinx.com>
> > > Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kerne=
l@lists.infradead.org; robh+dt@kernel.org;
> > > mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.k=
ernel.org; Derek Kiernan <dkiernan@xilinx.com>
> > > Subject: Re: [PATCH V3 02/12] misc: xilinx-sdfec: add core driver
> > >
> > > On Sat, Apr 27, 2019 at 11:04:56PM +0100, Dragan Cvetic wrote:
> > > > +#define DRIVER_NAME "xilinx_sdfec"
> > > > +#define DRIVER_VERSION "0.3"
> > >
> > > Version means nothing with the driver in the kernel tree, please remo=
ve
> > > it.
> >
> > Will be removed. Thank you.
> >
> > >
> > > > +#define DRIVER_MAX_DEV BIT(MINORBITS)
> > >
> > > Why this number?  Why limit yourself to any number?
> > >
> >
> > There can be max 8 devices for this driver. I'll change to 8.
> >
> > > > +
> > > > +static struct class *xsdfec_class;
> > >
> > > Do you really need your own class?
> >
> > When writing a character device driver, my goal is to create and regist=
er an instance
> > of that structure associated with a struct file_operations, exposing a =
set of operations
> > to the user-space. One of the steps to make this goal is Create a class=
 for a devices,
> > visible in /sys/class/.
>=20
> Why do you need a class?  Again, why not just use the misc_device api,
> that seems much more relevant here and will make the code a lot simpler.
>=20

The driver can have 8 devices in SoC plus more in Programming Logic. It loo=
ked logical to group them under the same MAJOR, although they are independe=
nt of each other.
Is this argument strong enough to use class?

> thanks,
>=20
> greg k-h
