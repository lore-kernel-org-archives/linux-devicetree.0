From: Jolly Shah <JOLLYS@xilinx.com>
Subject: RE: [PATCH v2 4/4] drivers: firmware: xilinx: Add debugfs interface
Date: Wed, 24 Jan 2018 23:33:50 +0000
Message-ID: <DM2PR0201MB0767AE5B7E37276806A3FED4B8E20@DM2PR0201MB0767.namprd02.prod.outlook.com>
References: <1516220434-22204-1-git-send-email-jollys@xilinx.com>
 <1516220434-22204-5-git-send-email-jollys@xilinx.com>
 <20180123084103.GC21463@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180123084103.GC21463@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "mingo@kernel.org" <mingo@kernel.org>, "matt@codeblueprint.co.uk" <matt@codeblueprint.co.uk>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "keescook@chromium.org" <keescook@chromium.org>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rajan Vaja <RAJANV@xilinx.com>
List-Id: devicetree@vger.kernel.org

Thanks for review Greg,

> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Tuesday, January 23, 2018 12:41 AM
> To: Jolly Shah <JOLLYS@xilinx.com>
> Cc: ard.biesheuvel@linaro.org; mingo@kernel.org; matt@codeblueprint.co.uk=
;
> sudeep.holla@arm.com; hkallweit1@gmail.com; keescook@chromium.org;
> dmitry.torokhov@gmail.com; michal.simek@xilinx.com; robh+dt@kernel.org;
> mark.rutland@arm.com; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org; Rajan Vaja
> <RAJANV@xilinx.com>; Jolly Shah <JOLLYS@xilinx.com>
> Subject: Re: [PATCH v2 4/4] drivers: firmware: xilinx: Add debugfs interf=
ace
>=20
> On Wed, Jan 17, 2018 at 12:20:34PM -0800, Jolly Shah wrote:
> > +/* Setup debugfs fops */
> > +static const struct file_operations fops_zynqmp_pm_dbgfs =3D {
> > +       .owner  =3D       THIS_MODULE,
> > +       .write  =3D       zynqmp_pm_debugfs_api_write,
> > +       .read   =3D       zynqmp_pm_debugfs_api_version_read,
> > +};
> > +
> > +/**
> > + * zynqmp_pm_api_debugfs_init - Initialize debugfs interface
> > + *
> > + * Return:      Returns 0 on success
> > + *             Corresponding error code otherwise
> > + */
> > +int zynqmp_pm_api_debugfs_init(void)
> > +{
> > +       int err;
> > +
> > +       /* Initialize debugfs interface */
> > +       zynqmp_pm_debugfs_dir =3D debugfs_create_dir(DRIVER_NAME, NULL)=
;
> > +       if (!zynqmp_pm_debugfs_dir) {
> > +               pr_err("debugfs_create_dir failed\n");
> > +               return -ENODEV;
> > +       }
>=20
> No, you should NEVER care if a debugfs call returned an error or not, no =
need to
> check it at all.  Your code path should not change based on the return va=
lue as
> no code should depened on the functionality of debugfs.
>=20
> Any error returned by a debugfs call can be passed right back into it wit=
h no
> problems, so again, no need to check this.
>=20

Fixed in v3 patch series. Not saving dentries anymore but added check to sh=
ow warning message instead of error.

> > +
> > +       zynqmp_pm_debugfs_power =3D
> > +               debugfs_create_file("pm", 0220,
> > +                                   zynqmp_pm_debugfs_dir, NULL,
> > +                                   &fops_zynqmp_pm_dbgfs);
> > +       if (!zynqmp_pm_debugfs_power) {
> > +               pr_err("debugfs_create_file power failed\n");
> > +               err =3D -ENODEV;
> > +               goto err_dbgfs;
> > +       }
> > +
> > +       zynqmp_pm_debugfs_api_version =3D
> > +               debugfs_create_file("api_version", 0444,
> > +                                   zynqmp_pm_debugfs_dir, NULL,
> > +                                   &fops_zynqmp_pm_dbgfs);
> > +       if (!zynqmp_pm_debugfs_api_version) {
> > +               pr_err("debugfs_create_file api_version failed\n");
> > +               err =3D -ENODEV;
> > +               goto err_dbgfs;
> > +       }
>=20
> Why do you save these dentries at all anyway?  You never do anything with
> them, just create the files and away you go, no need to worry about anyth=
ing.
>=20
> Remember, debugfs was created to be very simple to use, don't make it mor=
e
> complex than it has to be please.
>=20
> thanks,
>=20
> greg k-h

Fixed in v3 patch series.

Thanks,
Jolly Shah
