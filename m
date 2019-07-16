From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v9 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem driver
Date: Tue, 16 Jul 2019 21:33:18 +0300
Message-ID: <20190716183318.GE850@valkosipuli.retiisi.org.uk>
References: <1560247809-117978-1-git-send-email-vishal.sagar@xilinx.com>
 <1560247809-117978-3-git-send-email-vishal.sagar@xilinx.com>
 <20190618151933.zqepfqdjjjlhea7h@valkosipuli.retiisi.org.uk>
 <CH2PR02MB6088B5E97833233486C53E9BA7F30@CH2PR02MB6088.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CH2PR02MB6088B5E97833233486C53E9BA7F30@CH2PR02MB6088.namprd02.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vishal Sagar <vsagar@xilinx.com>
Cc: Vishal Sagar <vishal.sagar@xilinx.com>, Hyun Kwon <hyunk@xilinx.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Michal Simek <michals@xilinx.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinesh Kumar <dineshk@xilinx.com>, Sandip Kothari <sandipk@xilinx.com>, Luca Ceresoli <luca@lucaceresoli.net>, Jacopo Mondi <jacopo@jm>
List-Id: devicetree@vger.kernel.org

Hi Vishal,

On Thu, Jul 11, 2019 at 09:09:37AM +0000, Vishal Sagar wrote:
...
> > > +static int xcsi2rxss_subscribe_event(struct v4l2_subdev *sd,
> > > +                                  struct v4l2_fh *fh,
> > > +                                  struct v4l2_event_subscription *sub)
> > > +{
> > > +     struct xcsi2rxss_state *xcsi2rxss = to_xcsi2rxssstate(sd);
> > > +     int ret;
> > > +
> > > +     mutex_lock(&xcsi2rxss->lock);
> > > +
> > > +     switch (sub->type) {
> > > +     case V4L2_EVENT_XILINX_CSI2RX_SLBF:
> > > +             ret = v4l2_event_subscribe(fh, sub, XCSI_MAX_EVENT, NULL);
> > 
> > Please either use dev_dbg() or propose an API for conveying this
> > information downstream in the pipeline.
> > 
> 
> I will use a dev_alert() in the irq handler for this for now and remove this event.

dev_dbg(), please, as this is certainly not fatal. We should probably have
an API to tell this to the downstream sub-device driver in the pipeline if
the hardware has no way to detect this independently.

-- 
Regards,

Sakari Ailus
