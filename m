From: Vishal Sagar <vsagar@xilinx.com>
Subject: RE: [PATCH v8 1/2] media: dt-bindings: media: xilinx: Add Xilinx MIPI
 CSI-2 Rx Subsystem
Date: Thu, 6 Jun 2019 12:23:08 +0000
Message-ID: <CH2PR02MB6088A1C4C6AA60462B1A338EA7170@CH2PR02MB6088.namprd02.prod.outlook.com>
References: <1559555971-193235-1-git-send-email-vishal.sagar@xilinx.com>
 <1559555971-193235-2-git-send-email-vishal.sagar@xilinx.com>
 <20190604192344.7tycwffjd3yeizxh@paasikivi.fi.intel.com>
 <CH2PR02MB60889B850DCAA810A772160DA7170@CH2PR02MB6088.namprd02.prod.outlook.com>
 <20190606121238.zxdvvogob3umzid4@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190606121238.zxdvvogob3umzid4@paasikivi.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Vishal Sagar <vishal.sagar@xilinx.com>, Hyun Kwon <hyunk@xilinx.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Michal Simek <michals@xilinx.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinesh Kumar <dineshk@xilinx.com>, Sandip Kothari <sandipk@xilinx.com>, Luca Ceresoli <luca@lucaceresoli.net>, Jacopo Mondi <jacopo@jm>
List-Id: devicetree@vger.kernel.org

Hi Sakari,

> -----Original Message-----
> From: Sakari Ailus [mailto:sakari.ailus@linux.intel.com]
> Sent: Thursday, June 06, 2019 5:43 PM
> To: Vishal Sagar <vsagar@xilinx.com>
> Cc: Vishal Sagar <vishal.sagar@xilinx.com>; Hyun Kwon <hyunk@xilinx.com>;
> laurent.pinchart@ideasonboard.com; mchehab@kernel.org;
> robh+dt@kernel.org; mark.rutland@arm.com; Michal Simek
> <michals@xilinx.com>; linux-media@vger.kernel.org;
> devicetree@vger.kernel.org; hans.verkuil@cisco.com; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Dinesh Kumar
> <dineshk@xilinx.com>; Sandip Kothari <sandipk@xilinx.com>; Luca Ceresoli
> <luca@lucaceresoli.net>; Jacopo Mondi <jacopo@jmondi.org>
> Subject: Re: [PATCH v8 1/2] media: dt-bindings: media: xilinx: Add Xilinx=
 MIPI
> CSI-2 Rx Subsystem
>=20
> Hi Vishal,
>=20
> On Thu, Jun 06, 2019 at 11:54:19AM +0000, Vishal Sagar wrote:
> > Hi Sakari,
> >
> > > -----Original Message-----
> > > From: Sakari Ailus [mailto:sakari.ailus@linux.intel.com]
> > > Sent: Wednesday, June 05, 2019 12:54 AM
> > > To: Vishal Sagar <vishal.sagar@xilinx.com>
> > > Cc: Hyun Kwon <hyunk@xilinx.com>; laurent.pinchart@ideasonboard.com;
> > > mchehab@kernel.org; robh+dt@kernel.org; mark.rutland@arm.com;
> Michal
> > > Simek <michals@xilinx.com>; linux-media@vger.kernel.org;
> > > devicetree@vger.kernel.org; hans.verkuil@cisco.com; linux-arm-
> > > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Dinesh Kuma=
r
> > > <dineshk@xilinx.com>; Sandip Kothari <sandipk@xilinx.com>; Luca Ceres=
oli
> > > <luca@lucaceresoli.net>; Jacopo Mondi <jacopo@jmondi.org>
> > > Subject: Re: [PATCH v8 1/2] media: dt-bindings: media: xilinx: Add Xi=
linx
> MIPI
> > > CSI-2 Rx Subsystem
> > >
> > > EXTERNAL EMAIL
> > >
> > > Hi Vishal,
> > >
> > > On Mon, Jun 03, 2019 at 03:29:30PM +0530, Vishal Sagar wrote:
> > >
> > > > +Optional properties:
> > > > +--------------------
> > > > +- .
> > > > +  Without this property the driver won't be loaded as IP won't be =
able to
> > > generate
> > > > +  media bus format compliant stream output.
> > >
> > > I think we previously concluded that the format will be just differen=
t in
> > > this case. So the description appears incorrect.
> > >
> >
> > Referring to your email https://lkml.org/lkml/2019/3/22/1823 in respons=
e to
> v6 patches,
> > if the video format bridge is not enabled, then the way in which pixels=
 are
> transported on
> > the bus don't correspond to the existing media bus formats in Linux.
> >
> > If not loading the driver is incorrect way, is it ok for the driver to =
allow same
> media bus format
> > for packed and unpacked data type on the sink pad?
> >
> > Or is it ok for the driver to not validate the media bus format set on =
the sink
> pad?
>=20
> Taking a fresh look at the issue --- usually such unpacking is done by th=
e
> DMA engine, or the same device contains both the CSI-2 RX and DMA. But he=
re
> it actually affects the input of that DMA engine. You're right in saying =
we
> don't have format definitions from which you could tell which case it is,
> and we also don't have other pre-existing means to tell them apart.
>=20
> Feel free to keep the check in the driver, but we can't refer to the driv=
er
> loading in DT binding documentation: this is really not supposed to be
> related to that driver, or even Linux at all.
>=20

Ok got it. The description here shouldn't be specific to driver.
I will keep the check in driver.

> How about changing this to:
>=20
> xlnx,vfb: Present when Video Format Bridge is enabled in IP configuration=
.
>=20
> That'd be aligned with the other properties and would more accurately
> convey what this means.

Agree this is a good way to define the property. I will update it the descr=
iption as mentioned here.

>=20
> --
> Kind regards,
>=20
> Sakari Ailus
> sakari.ailus@linux.intel.com

Regards
Vishal Sagar
