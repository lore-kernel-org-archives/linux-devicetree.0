From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v8 05/14] media: rkisp1: add Rockchip ISP1 subdev driver
Date: Thu, 15 Aug 2019 22:35:11 +0300
Message-ID: <20190815193511.GB5011@pendragon.ideasonboard.com>
References: <20190730184256.30338-1-helen.koike@collabora.com>
 <20190730184256.30338-6-helen.koike@collabora.com>
 <86e17716-193f-ca49-1104-9c599a667eeb@collabora.com>
 <f229a840-bcf3-50c8-27c6-363c72de1d01@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f229a840-bcf3-50c8-27c6-363c72de1d01@xs4all.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Helen Koike <helen.koike@collabora.com>, hans.verkuil@cisco.com, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de, jacob2.chen@rock-chips.com, jeffy.chen@rock-chips.com, zyc@rock-chips.com, linux-kernel@vger.kernel.org, tfiga@chromium.org, sakari.ailus@linux.intel.com, kernel@collabora.com, ezequiel@collabora.com, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, zhengsq@rock-chips.com, Jacob Chen <cc@rock-chips.com>, Allon Huang <allon.huang@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Hi Hans,

On Wed, Aug 07, 2019 at 12:39:17PM +0200, Hans Verkuil wrote:
> On 8/6/19 8:51 PM, Helen Koike wrote:
> > On 7/30/19 3:42 PM, Helen Koike wrote:
> >> From: Jacob Chen <jacob2.chen@rock-chips.com>
> >>
> >> Add the subdev driver for rockchip isp1.
> >>
> >> Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
> >> Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
> >> Signed-off-by: Yichong Zhong <zyc@rock-chips.com>
> >> Signed-off-by: Jacob Chen <cc@rock-chips.com>
> >> Signed-off-by: Eddie Cai <eddie.cai.linux@gmail.com>
> >> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
> >> Signed-off-by: Allon Huang <allon.huang@rock-chips.com>
> >> Signed-off-by: Tomasz Figa <tfiga@chromium.org>
> >> [fixed unknown entity type / switched to PIXEL_RATE]
> >> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> >> [update for upstream]
> >> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> >>
> >> ---
> >>
> >> Changes in v8: None
> >> Changes in v7:
> >> - fixed warning because of unknown entity type
> >> - fixed v4l2-compliance errors regarding rkisp1 formats, try formats
> >> and default values
> >> - fix typo riksp1/rkisp1
> >> - redesign: remove mipi/csi subdevice, sensors connect directly to the
> >> isp subdevice in the media topology now. As a consequence, remove the
> >> hack in mipidphy_g_mbus_config() where information from the sensor was
> >> being propagated through the topology.
> >> - From the old dphy:
> >>         * cache get_remote_sensor() in s_stream
> >>         * use V4L2_CID_PIXEL_RATE instead of V4L2_CID_LINK_FREQ
> >> - Replace stream state with a boolean
> >> - code styling and checkpatch fixes
> >> - fix stop_stream (return after calling stop, do not reenable the stream)
> >> - fix rkisp1_isp_sd_get_selection when V4L2_SUBDEV_FORMAT_TRY is set
> >> - fix get format in output (isp_sd->out_fmt.mbus_code was being ignored)
> >> - s/intput/input
> >> - remove #define sd_to_isp_sd(_sd), add a static inline as it will be
> >> reused by the capture
> >>
> >>  drivers/media/platform/rockchip/isp1/rkisp1.c | 1286 +++++++++++++++++
> >>  drivers/media/platform/rockchip/isp1/rkisp1.h |  111 ++
> >>  2 files changed, 1397 insertions(+)
> >>  create mode 100644 drivers/media/platform/rockchip/isp1/rkisp1.c
> >>  create mode 100644 drivers/media/platform/rockchip/isp1/rkisp1.h
> >>
> >> diff --git a/drivers/media/platform/rockchip/isp1/rkisp1.c b/drivers/media/platform/rockchip/isp1/rkisp1.c
> >> new file mode 100644
> >> index 000000000000..6d0c0ffb5e03
> >> --- /dev/null
> >> +++ b/drivers/media/platform/rockchip/isp1/rkisp1.c
> >> @@ -0,0 +1,1286 @@
> 
> <snip>
> 
> >> +static int rkisp1_isp_sd_get_fmt(struct v4l2_subdev *sd,
> >> +				 struct v4l2_subdev_pad_config *cfg,
> >> +				 struct v4l2_subdev_format *fmt)
> >> +{
> >> +	struct rkisp1_isp_subdev *isp_sd = sd_to_isp_sd(sd);
> >> +	struct v4l2_mbus_framefmt *mf = &fmt->format;
> >> +
> >> +	if ((fmt->pad != RKISP1_ISP_PAD_SINK) &&
> >> +	    (fmt->pad != RKISP1_ISP_PAD_SOURCE_PATH)) {
> >> +		fmt->format.code = MEDIA_BUS_FMT_FIXED;
> >> +		/*
> >> +		 * NOTE: setting a format here doesn't make much sense
> >> +		 * but v4l2-compliance complains
> >> +		 */
> >> +		fmt->format.width = RKISP1_DEFAULT_WIDTH;
> >> +		fmt->format.height = RKISP1_DEFAULT_HEIGHT;
> > 
> > As I had mentioned to you, this is called for the isp pads connected to the
> > DMA engines for statistics and parameters (meta data).
> > 
> > If I remove those, I get the following errors:
> > 
> > Sub-Device ioctls (Sink Pad 1):
> >         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> >                 fail: v4l2-test-subdevs.cpp(311): fmt.width == 0 || fmt.width > 65536
> >                 fail: v4l2-test-subdevs.cpp(356): checkMBusFrameFmt(node, fmt.format)
> >         test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
> >         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
> >         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> >                 fail: v4l2-test-subdevs.cpp(311): fmt.width == 0 || fmt.width > 65536
> >                 fail: v4l2-test-subdevs.cpp(356): checkMBusFrameFmt(node, fmt.format)
> >         test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
> >         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
> >         test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > 
> > Here is the full log: http://ix.io/1QNt
> > 
> > Is this a bug in v4l2-compliance?
> 
> Yes and no :-)
> 
> Currently v4l2-compliance assumes that only video is transferred over a media bus.
> But that's not the case here, and testing the code field doesn't help v4l2-compliance
> since MEDIA_BUS_FMT_FIXED is also still used by some older subdev drivers for video.
> 
> I think we need a new bus format: MEDIA_BUS_FMT_FIXED_METADATA. Then v4l2-compliance
> can tell it apart from the regular fixed video bus format.

Wouldn't a pad flag that identifies the type of data transmitted by a
pad be a better, backward-compatible option ? This could be useful for
audio as well.

> If I do a 'git grep MEDIA_BUS_FMT_FIXED' then I see that it is also in use by vsp1
> for histogram information, so that should also be converted to use the new FIXED_METADATA
> format, although that might be too late (there might be userspace complications).

Yes, probably not a good idea.

> >> +		fmt->format.field = V4L2_FIELD_NONE;
> >> +		return 0;
> >> +	}
> >> +
> >> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> >> +		mf = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> >> +		fmt->format = *mf;
> >> +		return 0;
> >> +	}
> >> +
> >> +	if (fmt->pad == RKISP1_ISP_PAD_SINK) {
> >> +		*mf = isp_sd->in_frm;
> >> +	} else if (fmt->pad == RKISP1_ISP_PAD_SOURCE_PATH) {
> >> +		/* format of source pad */
> >> +		*mf = isp_sd->in_frm;
> >> +		mf->code = isp_sd->out_fmt.mbus_code;
> >> +		/* window size of source pad */
> >> +		mf->width = isp_sd->out_crop.width;
> >> +		mf->height = isp_sd->out_crop.height;
> >> +		mf->quantization = isp_sd->quantization;
> >> +	}
> >> +	mf->field = V4L2_FIELD_NONE;
> >> +
> >> +	return 0;
> >> +}

-- 
Regards,

Laurent Pinchart
