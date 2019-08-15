From: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v8 05/14] media: rkisp1: add Rockchip ISP1 subdev driver
Date: Thu, 15 Aug 2019 19:29:59 +0900
Message-ID: <CAAFQd5Cd2k5ZCDfu=a281NLOa88vpm-P7ZPWF4Nnx==iyEkn7A@mail.gmail.com>
References: <20190730184256.30338-1-helen.koike@collabora.com>
 <20190730184256.30338-6-helen.koike@collabora.com> <20190808091406.GQ21370@paasikivi.fi.intel.com>
 <da6c1d01-e3f6-ad73-db55-145d7832a665@collabora.com> <20190815082422.GM6133@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190815082422.GM6133@paasikivi.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Helen Koike <helen.koike@collabora.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, devicetree@vger.kernel.org, Eddie Cai <eddie.cai.linux@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Chen Jacob <jacob2.chen@rock-chips.com>, Jeffy <jeffy.chen@rock-chips.com>, =?UTF-8?B?6ZKf5Lul5bSH?= <zyc@rock-chips.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lis>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 15, 2019 at 5:25 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Helen,
>
> On Wed, Aug 14, 2019 at 09:58:05PM -0300, Helen Koike wrote:
>
> ...
>
> > >> +static int rkisp1_isp_sd_set_fmt(struct v4l2_subdev *sd,
> > >> +                           struct v4l2_subdev_pad_config *cfg,
> > >> +                           struct v4l2_subdev_format *fmt)
> > >> +{
> > >> +  struct rkisp1_device *isp_dev = sd_to_isp_dev(sd);
> > >> +  struct rkisp1_isp_subdev *isp_sd = &isp_dev->isp_sdev;
> > >> +  struct v4l2_mbus_framefmt *mf = &fmt->format;
> > >> +
> > >
> > > Note that for sub-device nodes, the driver is itself responsible for
> > > serialising the access to its data structures.
> >
> > But looking at subdev_do_ioctl_lock(), it seems that it serializes the
> > ioctl calls for subdevs, no? Or I'm misunderstanding something (which is
> > most probably) ?
>
> Good question. I had missed this change --- subdev_do_ioctl_lock() is
> relatively new. But setting that lock is still not possible as the struct
> is allocated in the framework and the device is registered before the
> driver gets hold of it. It's a good idea to provide the same serialisation
> for subdevs as well.
>
> I'll get back to this later.
>
> ...
>
> > >> +static int rkisp1_isp_sd_s_power(struct v4l2_subdev *sd, int on)
> > >
> > > If you support runtime PM, you shouldn't implement the s_power op.
> >
> > Is is ok to completly remove the usage of runtime PM then?
> > Like this http://ix.io/1RJb ?
>
> Please use runtime PM instead. In the long run we should get rid of the
> s_power op. Drivers themselves know better when the hardware they control
> should be powered on or off.
>

One also needs to use runtime PM to handle power domains and power
dependencies on auxiliary devices, e.g. IOMMU.

> >
> > tbh I'm not that familar with runtime PM and I'm not sure what is the
> > difference of it and using s_power op (and Documentation/power/runtime_pm.rst
> > is not being that helpful tbh).
>
> You can find a simple example e.g. in
> drivers/media/platform/atmel/atmel-isi.c .
>
> >
> > >
> > > You'll still need to call s_power on external subdevs though.
> > >
> > >> +{
> > >> +  struct rkisp1_device *isp_dev = sd_to_isp_dev(sd);
> > >> +  int ret;
> > >> +
> > >> +  v4l2_dbg(1, rkisp1_debug, &isp_dev->v4l2_dev, "s_power: %d\n", on);
> > >> +
> > >> +  if (on) {
> > >> +          ret = pm_runtime_get_sync(isp_dev->dev);
> >
> > If this is not ok to remove suport for runtime PM, then where should I put
> > the call to pm_runtime_get_sync() if not in this s_power op ?
>
> Basically the runtime_resume and runtime_suspend callbacks are where the
> device power state changes are implemented, and pm_runtime_get_sync and
> pm_runtime_put are how the driver controls the power state.
>
> So you no longer need the s_power() op at all. The op needs to be called on
> the pipeline however, as there are drivers that still use it.
>

For this driver, I suppose we would _get_sync() when we start
streaming (in the hardware, i.e. we want the ISP to start capturing
frames) and _put() when we stop and the driver shouldn't perform any
access to the hardware when the streaming is not active.

Best regards,
Tomasz
