From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v8 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem driver
Date: Tue, 18 Jun 2019 17:59:22 +0300
Message-ID: <20190618145922.sq4jovxoz2khs3tq@valkosipuli.retiisi.org.uk>
References: <1559555971-193235-1-git-send-email-vishal.sagar@xilinx.com>
 <1559555971-193235-3-git-send-email-vishal.sagar@xilinx.com>
 <20190605124851.xr2hmgyoe46q6xud@kekkonen.localdomain>
 <CH2PR02MB60889F3BF23FD96BF11053A2A7100@CH2PR02MB6088.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CH2PR02MB60889F3BF23FD96BF11053A2A7100@CH2PR02MB6088.namprd02.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vishal Sagar <vsagar@xilinx.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Vishal Sagar <vishal.sagar@xilinx.com>, Hyun Kwon <hyunk@xilinx.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Michal Simek <michals@xilinx.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinesh Kumar <dineshk@xilinx.com>, Sandip Kothari <sandipk@xilinx.com>Luca Ceresoli <lu>
List-Id: devicetree@vger.kernel.org

Hi Vishal,

On Fri, Jun 07, 2019 at 07:11:47AM +0000, Vishal Sagar wrote:
...
> > > +/**
> > > + * xcsi2rxss_s_ctrl - This is used to set the Xilinx MIPI CSI-2 V4L2 controls
> > > + * @ctrl: V4L2 control to be set
> > > + *
> > > + * This function is used to set the V4L2 controls for the Xilinx MIPI
> > > + * CSI-2 Rx Subsystem. It is used to set the active lanes in the system.
> > > + * The event counters can be reset.
> > > + *
> > > + * Return: 0 on success, errors otherwise
> > > + */
> > > +static int xcsi2rxss_s_ctrl(struct v4l2_ctrl *ctrl)
> > > +{
> > > +     struct xcsi2rxss_state *xcsi2rxss =
> > > +             container_of(ctrl->handler, struct xcsi2rxss_state,
> > > +                          ctrl_handler);
> > > +     struct xcsi2rxss_core *core = &xcsi2rxss->core;
> > > +     int ret = 0;
> > > +
> > > +     mutex_lock(&xcsi2rxss->lock);
> > > +
> > > +     switch (ctrl->id) {
> > > +     case V4L2_CID_XILINX_MIPICSISS_ACT_LANES:
> > > +             /*
> > > +              * This will be called only when "Enable Active Lanes" parameter
> > > +              * is set in design
> > > +              */
> > 
> > You generally get the number of lanes from firmware. There's no need to add
> > a control for it. 
> > 
> 
> I don't understand what firmware means here. There is no other code running.
> I don't see how to modify the number of lanes apart from using v4l control.

It's not the user that provides this information. Again, if you want this
feature right from the time the driver is merged to mainline, then rebase
the set on top of Jacopo's frame descriptor set. But it may take a while.

> 
> > > +             if (core->enable_active_lanes) {
> > > +                     u32 active_lanes;
> > > +
> > > +                     xcsi2rxss_clr_and_set(core, XCSI_PCR_OFFSET,
> > > +                                           XCSI_PCR_ACTLANES_MASK,
> > > +                                           ctrl->val - 1);
> > > +                     /*
> > > +                      * This delay is to allow the value to reflect as write
> > > +                      * and read paths are different.
> > > +                      */
> > > +                     udelay(1);
> > > +                     active_lanes = xcsi2rxss_read(core, XCSI_PCR_OFFSET);
> > > +                     active_lanes &= XCSI_PCR_ACTLANES_MASK;
> > > +                     active_lanes++;
> > > +                     if (active_lanes != ctrl->val)
> > > +                             dev_info(core->dev, "RxByteClkHS absent\n");
> > > +                     dev_dbg(core->dev, "active lanes = %d\n", ctrl->val);
> > > +             } else {
> > > +                     ret = -EINVAL;
> > > +             }
> > > +             break;
> > > +     case V4L2_CID_XILINX_MIPICSISS_RESET_COUNTERS:
> > > +             xcsi2rxss_reset_event_counters(xcsi2rxss);
> > > +             break;
> > > +     default:
> > > +             ret = -EINVAL;
> > > +             break;
> > > +     }
> > > +
> > > +     mutex_unlock(&xcsi2rxss->lock);
> > > +
> > > +     return ret;
> > > +}

-- 
Regards,

Sakari Ailus
