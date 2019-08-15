From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v8 05/14] media: rkisp1: add Rockchip ISP1 subdev driver
Date: Thu, 15 Aug 2019 16:17:49 +0300
Message-ID: <20190815131748.GS6133@paasikivi.fi.intel.com>
References: <20190730184256.30338-1-helen.koike@collabora.com>
 <20190730184256.30338-6-helen.koike@collabora.com>
 <20190808091406.GQ21370@paasikivi.fi.intel.com>
 <da6c1d01-e3f6-ad73-db55-145d7832a665@collabora.com>
 <20190815082422.GM6133@paasikivi.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190815082422.GM6133@paasikivi.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Helen Koike <helen.koike@collabora.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de, jacob2.chen@rock-chips.com, jeffy.chen@rock-chips.com, zyc@rock-chips.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com, kernel@collabora.com, ezequiel@collabora.com, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, zhengsq@rock-chips.com, Jacob Chen <cc@rock-chips.com>, Allon Huang <allon.huang@rock-chips.com>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 15, 2019 at 11:24:22AM +0300, Sakari Ailus wrote:
> Hi Helen,
> 
> On Wed, Aug 14, 2019 at 09:58:05PM -0300, Helen Koike wrote:
> 
> ...
> 
> > >> +static int rkisp1_isp_sd_set_fmt(struct v4l2_subdev *sd,
> > >> +				 struct v4l2_subdev_pad_config *cfg,
> > >> +				 struct v4l2_subdev_format *fmt)
> > >> +{
> > >> +	struct rkisp1_device *isp_dev = sd_to_isp_dev(sd);
> > >> +	struct rkisp1_isp_subdev *isp_sd = &isp_dev->isp_sdev;
> > >> +	struct v4l2_mbus_framefmt *mf = &fmt->format;
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

The main reason is actually that these ops are also called through the
sub-device kAPI, not only through the uAPI, and the locks are only taken
through the calls via uAPI.

So adding the locks to uAPI calls alone would not address the issue.

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
