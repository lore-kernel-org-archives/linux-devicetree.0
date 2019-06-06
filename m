From: Dragan Cvetic <draganc@xilinx.com>
Subject: RE: [PATCH V4 04/12] misc: xilinx_sdfec: Add open, close and ioctl
Date: Thu, 6 Jun 2019 18:18:16 +0000
Message-ID: <CH2PR02MB6359A547C69E6E674CB3C7D0CB170@CH2PR02MB6359.namprd02.prod.outlook.com>
References: <1558784245-108751-1-git-send-email-dragan.cvetic@xilinx.com>
 <1558784245-108751-5-git-send-email-dragan.cvetic@xilinx.com>
 <20190606132629.GB7943@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190606132629.GB7943@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "arnd@arndb.de" <arnd@arndb.de>, Michal Simek <michals@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Derek Kiernan <dkiernan@xilinx.com>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Thursday 6 June 2019 14:26
> To: Dragan Cvetic <draganc@xilinx.com>
> Cc: arnd@arndb.de; Michal Simek <michals@xilinx.com>; linux-arm-kernel@li=
sts.infradead.org; robh+dt@kernel.org;
> mark.rutland@arm.com; devicetree@vger.kernel.org; linux-kernel@vger.kerne=
l.org; Derek Kiernan <dkiernan@xilinx.com>
> Subject: Re: [PATCH V4 04/12] misc: xilinx_sdfec: Add open, close and ioc=
tl
>=20
> On Sat, May 25, 2019 at 12:37:17PM +0100, Dragan Cvetic wrote:
> > Add char device interface per DT node present and support
> > file operations:
> > - open(),
> > - close(),
> > - unlocked_ioctl(),
> > - compat_ioctl().
> >
> > Tested-by: Dragan Cvetic <dragan.cvetic@xilinx.com>
> > Signed-off-by: Derek Kiernan <derek.kiernan@xilinx.com>
> > Signed-off-by: Dragan Cvetic <dragan.cvetic@xilinx.com>
> > ---
> >  drivers/misc/xilinx_sdfec.c      | 57 ++++++++++++++++++++++++++++++++=
+++++---
> >  include/uapi/misc/xilinx_sdfec.h |  4 +++
> >  2 files changed, 58 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/misc/xilinx_sdfec.c b/drivers/misc/xilinx_sdfec.c
> > index ff32d29..740b487 100644
> > --- a/drivers/misc/xilinx_sdfec.c
> > +++ b/drivers/misc/xilinx_sdfec.c
> > @@ -51,7 +51,6 @@ struct xsdfec_clks {
> >   * @regs: device physical base address
> >   * @dev: pointer to device struct
> >   * @config: Configuration of the SDFEC device
> > - * @open_count: Count of char device being opened
>=20
> Why is this removed here?  You don't add something in one patch and then
> remove it in a later one if it's never needed :)

Accepted.
Will be removed from previous patches.

>=20
> thanks,
>=20
> greg k-h
