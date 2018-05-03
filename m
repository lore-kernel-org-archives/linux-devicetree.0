From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v6 05/17] media: rkisp1: add Rockchip ISP1 subdev driver
Date: Thu, 3 May 2018 12:09:09 +0300
Message-ID: <20180503090909.o3dyhukzs2y7em5z@tarshish>
References: <20180308094807.9443-1-jacob-chen@iotwrt.com>
 <20180308094807.9443-6-jacob-chen@iotwrt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180308094807.9443-6-jacob-chen@iotwrt.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacob Chen <jacob-chen@iotwrt.com>
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mchehab@kernel.org, linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, tfiga@chromium.org, zhengsq@rock-chips.com, laurent.pinchart@ideasonboard.com, zyc@rock-chips.com, eddie.cai.linux@gmail.com, jeffy.chen@rock-chips.com, devicetree@vger.kernel.org, heiko@sntech.de, Jacob Chen <jacob2.chen@rock-chips.com>, Jacob Chen <cc@rock-chips.com>, Allon Huang <allon.huang@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Hi Jacob,

On Thu, Mar 08, 2018 at 05:47:55PM +0800, Jacob Chen wrote:
> +static int rkisp1_isp_sd_s_power(struct v4l2_subdev *sd, int on)
> +{
> +	struct rkisp1_device *isp_dev = sd_to_isp_dev(sd);
> +	int ret;
> +
> +	v4l2_dbg(1, rkisp1_debug, &isp_dev->v4l2_dev, "s_power: %d\n", on);
> +
> +	if (on) {
> +		ret = pm_runtime_get_sync(isp_dev->dev);
> +		if (ret < 0)
> +			return ret;
> +
> +		rkisp1_config_clk(isp_dev);
> +	} else {
> +		ret = pm_runtime_put(isp_dev->dev);

I commented this line out to make more than one STREAMON work. Otherwise, the 
second STREAMON hangs. I guess the bug is not this driver. Probably something 
in drivers/soc/rockchip/pm_domains.c. Just noting that in case you or someone 
on Cc would like to investigate it further.

I tested v4.16-rc4 on the Tinkerboard.

baruch

> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
