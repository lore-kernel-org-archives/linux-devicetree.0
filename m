From: Vishal Sagar <vsagar@xilinx.com>
Subject: RE: [PATCH v8 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem driver
Date: Thu, 11 Jul 2019 09:09:33 +0000
Message-ID: <CH2PR02MB6088CAF1D2DE08B71B57B668A7F30@CH2PR02MB6088.namprd02.prod.outlook.com>
References: <1559555971-193235-1-git-send-email-vishal.sagar@xilinx.com>
 <1559555971-193235-3-git-send-email-vishal.sagar@xilinx.com>
 <20190605124851.xr2hmgyoe46q6xud@kekkonen.localdomain>
 <CH2PR02MB60889F3BF23FD96BF11053A2A7100@CH2PR02MB6088.namprd02.prod.outlook.com>
 <20190618145922.sq4jovxoz2khs3tq@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618145922.sq4jovxoz2khs3tq@valkosipuli.retiisi.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Vishal Sagar <vishal.sagar@xilinx.com>, Hyun Kwon <hyunk@xilinx.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Michal Simek <michals@xilinx.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinesh Kumar <dineshk@xilinx.com>, Sandip Kothari <sandipk@xilinx.com>Luca Ceresoli <lu>
List-Id: devicetree@vger.kernel.org

Hi Sakari,

> -----Original Message-----
> From: Sakari Ailus [mailto:sakari.ailus@iki.fi]
> Sent: Tuesday, June 18, 2019 8:29 PM
> To: Vishal Sagar <vsagar@xilinx.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>; Vishal Sagar
> <vishal.sagar@xilinx.com>; Hyun Kwon <hyunk@xilinx.com>;
> laurent.pinchart@ideasonboard.com; mchehab@kernel.org;
> robh+dt@kernel.org; mark.rutland@arm.com; Michal Simek
> <michals@xilinx.com>; linux-media@vger.kernel.org;
> devicetree@vger.kernel.org; hans.verkuil@cisco.com; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Dinesh Kumar
> <dineshk@xilinx.com>; Sandip Kothari <sandipk@xilinx.com>; Luca Ceresoli
> <luca@lucaceresoli.net>; Jacopo Mondi <jacopo@jmondi.org>
> Subject: Re: [PATCH v8 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
> Subsystem driver
>=20
> Hi Vishal,
>=20
> On Fri, Jun 07, 2019 at 07:11:47AM +0000, Vishal Sagar wrote:
> ...
> > > > +/**
> > > > + * xcsi2rxss_s_ctrl - This is used to set the Xilinx MIPI CSI-2 V4=
L2 controls
> > > > + * @ctrl: V4L2 control to be set
> > > > + *
> > > > + * This function is used to set the V4L2 controls for the Xilinx M=
IPI
> > > > + * CSI-2 Rx Subsystem. It is used to set the active lanes in the s=
ystem.
> > > > + * The event counters can be reset.
> > > > + *
> > > > + * Return: 0 on success, errors otherwise
> > > > + */
> > > > +static int xcsi2rxss_s_ctrl(struct v4l2_ctrl *ctrl)
> > > > +{
> > > > +     struct xcsi2rxss_state *xcsi2rxss =3D
> > > > +             container_of(ctrl->handler, struct xcsi2rxss_state,
> > > > +                          ctrl_handler);
> > > > +     struct xcsi2rxss_core *core =3D &xcsi2rxss->core;
> > > > +     int ret =3D 0;
> > > > +
> > > > +     mutex_lock(&xcsi2rxss->lock);
> > > > +
> > > > +     switch (ctrl->id) {
> > > > +     case V4L2_CID_XILINX_MIPICSISS_ACT_LANES:
> > > > +             /*
> > > > +              * This will be called only when "Enable Active Lanes=
" parameter
> > > > +              * is set in design
> > > > +              */
> > >
> > > You generally get the number of lanes from firmware. There's no need =
to
> add
> > > a control for it.
> > >
> >
> > I don't understand what firmware means here. There is no other code
> running.
> > I don't see how to modify the number of lanes apart from using v4l cont=
rol.
>=20
> It's not the user that provides this information. Again, if you want this
> feature right from the time the driver is merged to mainline, then rebase
> the set on top of Jacopo's frame descriptor set. But it may take a while.
>=20

Thanks for reviewing again and sharing this.=20
Since Jacopo's frame descriptor set will take a while, I will remove this c=
ontrol for now from the driver so that the driver can get into upstream.

Regards
Vishal Sagar

> >
> > > > +             if (core->enable_active_lanes) {
> > > > +                     u32 active_lanes;
> > > > +
> > > > +                     xcsi2rxss_clr_and_set(core, XCSI_PCR_OFFSET,
> > > > +                                           XCSI_PCR_ACTLANES_MASK,
> > > > +                                           ctrl->val - 1);
> > > > +                     /*
> > > > +                      * This delay is to allow the value to reflec=
t as write
> > > > +                      * and read paths are different.
> > > > +                      */
> > > > +                     udelay(1);
> > > > +                     active_lanes =3D xcsi2rxss_read(core, XCSI_PC=
R_OFFSET);
> > > > +                     active_lanes &=3D XCSI_PCR_ACTLANES_MASK;
> > > > +                     active_lanes++;
> > > > +                     if (active_lanes !=3D ctrl->val)
> > > > +                             dev_info(core->dev, "RxByteClkHS abse=
nt\n");
> > > > +                     dev_dbg(core->dev, "active lanes =3D %d\n", c=
trl->val);
> > > > +             } else {
> > > > +                     ret =3D -EINVAL;
> > > > +             }
> > > > +             break;
> > > > +     case V4L2_CID_XILINX_MIPICSISS_RESET_COUNTERS:
> > > > +             xcsi2rxss_reset_event_counters(xcsi2rxss);
> > > > +             break;
> > > > +     default:
> > > > +             ret =3D -EINVAL;
> > > > +             break;
> > > > +     }
> > > > +
> > > > +     mutex_unlock(&xcsi2rxss->lock);
> > > > +
> > > > +     return ret;
> > > > +}
>=20
> --
> Regards,
>=20
> Sakari Ailus
