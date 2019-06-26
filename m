From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 1/3] media: i2c: ov02a10: Add ov02a10 camera sensor driver
Date: Wed, 26 Jun 2019 12:58:26 +0300
Message-ID: <20190626095826.3w4lj4vmfnfgxv53@valkosipuli.retiisi.org.uk>
References: <20190523102204.24112-1-dongchun.zhu@mediatek.com>
 <20190523102204.24112-2-dongchun.zhu@mediatek.com>
 <20190531170307.tv652oech6vh4rye@valkosipuli.retiisi.org.uk>
 <1560262189.9392.42.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1560262189.9392.42.camel@mhfsdcap03>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, menghui.lin@mediatek.com, tfiga@google.com, shengnan.wang@mediatek.com, louis.kuo@mediatek.com, sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Dongchun,

On Tue, Jun 11, 2019 at 10:09:49PM +0800, Dongchun Zhu wrote:
...
> > > +		return -EINVAL;
> > > +
> > > +	fse->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> > 
> > Instead you need check the caller set this. The frame sizes could be
> > different for different media bus formats.
> > 
> 
> For one sensor mode, there should be one Bayer sequence.
> In next version, this para could be changed when mirror/flip enabled.
> 

You should change the check based on the configuration.

...

> > > +#ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
> > > +static int ov02a10_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> > > +{
> > > +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > +	struct v4l2_mbus_framefmt *try_fmt;
> > > +
> > > +	mutex_lock(&ov02a10->mutex);
> > > +
> > > +	try_fmt = v4l2_subdev_get_try_format(sd, fh->pad, 0);
> > > +	/* Initialize try_fmt */
> > > +	ov02a10_fill_fmt(&supported_modes[0], try_fmt);
> > 
> > If this is all you need, you should implement the init_cfg pad op.
> > 
> 
> It seems that other sensors (for instance, OV8856, OV13858 etc.)
> initialize try_fmt in the same way.

Yes; these drivers should be changed as well.

...

> > > +					  ov02a10_test_pattern_val[ctrl->val]);
> > > +		break;
> > > +	case V4L2_CID_HFLIP:
> > > +		if (ov02a10->streaming)
> > > +			return -EBUSY;
> > 
> > You could instead use v4l2_ctrl_grab() (or the unlocked variant) when
> > streaming starts. Same below.
> > 
> 
> It seems that other sensors (for instance, OV2680 etc.)
> call V4L2_CID_HFLIP/V4L2_CID_VFLIP in the same way.

That's ok.

-- 
Regards,

Sakari Ailus
