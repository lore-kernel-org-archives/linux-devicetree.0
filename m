From: Jolly Shah <JOLLYS@xilinx.com>
Subject: RE: [PATCH v2 3/4] drivers: firmware: xilinx: Add sysfs interface
Date: Wed, 24 Jan 2018 23:30:43 +0000
Message-ID: <DM2PR0201MB076735ACCF46914F426ACA2AB8E20@DM2PR0201MB0767.namprd02.prod.outlook.com>
References: <1516220434-22204-1-git-send-email-jollys@xilinx.com>
 <1516220434-22204-4-git-send-email-jollys@xilinx.com>
 <20180123083732.GA21463@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180123083732.GA21463@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "mingo@kernel.org" <mingo@kernel.org>, "matt@codeblueprint.co.uk" <matt@codeblueprint.co.uk>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "keescook@chromium.org" <keescook@chromium.org>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rajan Vaja <RAJANV@xilinx.com>
List-Id: devicetree@vger.kernel.org

Thanks for review Greg,

> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Tuesday, January 23, 2018 12:38 AM
> To: Jolly Shah <JOLLYS@xilinx.com>
> Cc: ard.biesheuvel@linaro.org; mingo@kernel.org; matt@codeblueprint.co.uk=
;
> sudeep.holla@arm.com; hkallweit1@gmail.com; keescook@chromium.org;
> dmitry.torokhov@gmail.com; michal.simek@xilinx.com; robh+dt@kernel.org;
> mark.rutland@arm.com; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org; Rajan Vaja
> <RAJANV@xilinx.com>; Jolly Shah <JOLLYS@xilinx.com>
> Subject: Re: [PATCH v2 3/4] drivers: firmware: xilinx: Add sysfs interfac=
e
>=20
> On Wed, Jan 17, 2018 at 12:20:33PM -0800, Jolly Shah wrote:
> > Add Firmware-ggs sysfs interface which provides read/write interface
> > to global storage registers.
> >
> > Signed-off-by: Jolly Shah <jollys@xilinx.com>
> > Signed-off-by: Rajan Vaja <rajanv@xilinx.com>
> > ---
> >  .../ABI/stable/sysfs-driver-zynqmp-firmware        |  33 +++
> >  drivers/firmware/xilinx/zynqmp/Makefile            |   2 +-
> >  drivers/firmware/xilinx/zynqmp/firmware-ggs.c      | 298
> +++++++++++++++++++++
> >  drivers/firmware/xilinx/zynqmp/firmware.c          |  26 ++
> >  include/linux/firmware/xilinx/zynqmp/firmware.h    |   2 +
> >  5 files changed, 360 insertions(+), 1 deletion(-)  create mode 100644
> > Documentation/ABI/stable/sysfs-driver-zynqmp-firmware
> >  create mode 100644 drivers/firmware/xilinx/zynqmp/firmware-ggs.c
> >
> > +
> > +#include <linux/firmware/xilinx/zynqmp/firmware.h>
>=20
> That's crazy deep nesting, why?

It needs to be in include/linux to be used by other drivers and as it is Xi=
linx specific, we have it in subdirectory.

>=20
> > +
> > +static ssize_t read_register(char *buf, u32 ioctl_id, u32 reg) {
> > +       int ret;
> > +       u32 ret_payload[PAYLOAD_ARG_CNT];
> > +       const struct zynqmp_eemi_ops *eemi_ops =3D get_eemi_ops();
> > +
> > +       if (!eemi_ops || !eemi_ops->ioctl)
> > +               return 0;
>=20
> Not an error?

Fixed in v3 patch series.

>=20
> > +
> > +       ret =3D eemi_ops->ioctl(0, ioctl_id, reg, 0, ret_payload);
> > +       if (ret)
> > +               return ret;
> > +
> > +       return snprintf(buf, PAGE_SIZE, "0x%x\n", ret_payload[1]);
>=20
> Minor nit, you never need to use snprintf() for a sysfs file, as you "kno=
w" the size
> and you can't overflow it with just a single value.
>=20
> Yeah, some tool-checkers hate to see a "raw" sprintf() call, but really, =
ignore
> them here :)

Changed to sprint in v3 patch series.

> > +
> > +       /* Read the write value */
> > +       tok =3D strsep(&inbuf, " ");
> > +       if (!tok) {
> > +               ret =3D -EFAULT;
> > +               goto err;
> > +       }
> > +
> > +       ret =3D kstrtol(tok, 16, &value);
> > +       if (ret) {
> > +               ret =3D -EFAULT;
> > +               goto err;
> > +       }
>=20
> What exactly is the format for the data to be written here?  You do not
> document it in the ABI/ file above, and it looks to be non-trivial to und=
erstand
> from the code :(
>=20

Updated documentation in v3 patch series.

> > +
> > +#define CREATE_PGGS_DEVICE(dev, N) \
> > +do { \
> > +       if (device_create_file(dev, &dev_attr_pggs##N)) \
> > +               dev_err(dev, "unable to create pggs%d attribute\n",
> > +N); \
>=20
> Ick, no, just use an attribute group please.  Handles all of this mess fo=
r you
> automatically, and will unwind properly if you have an error (which this =
macro
> does not do.)
>=20
> thanks,
>=20
> greg k-h

Fixed in v3 patch series.

Thanks,
Jolly Shah
