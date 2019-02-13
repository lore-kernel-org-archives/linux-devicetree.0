From: Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [v3,2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx Subsystem
Date: Wed, 13 Feb 2019 11:45:42 -0800
Message-ID: <20190213194539.GA11819@smtp.xilinx.com>
References: <1549025766-135037-3-git-send-email-vishal.sagar@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1549025766-135037-3-git-send-email-vishal.sagar@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vishal Sagar <vishal.sagar@xilinx.com>
Cc: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, michals@xilinx.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dineshk@xilinx.com, sandipk@xilinx.com
List-Id: devicetree@vger.kernel.org

Hi Vishal,

Thanks for the patch. Sorry for the delay.

On Fri, 2019-02-01 at 18:26:06 +0530, Vishal Sagar wrote:
> The Xilinx MIPI CSI-2 Rx Subsystem soft IP is used to capture images
> from MIPI CSI-2 camera sensors and output AXI4-Stream video data ready
> for image processing. Please refer to PG232 for details.
> 
> The driver is used to set the number of active lanes, if enabled
> in hardware. The CSI2 Rx controller filters out all packets except for
> the packets with data type fixed in hardware. RAW8 packets are always
> allowed to pass through.
> 
> It is also used to setup and handle interrupts and enable the core. It
> logs all the events in respective counters between streaming on and off.
> The generic short packets received are notified to application via
> v4l2_events.
> 
> The driver supports only the video format bridge enabled configuration.
> Some data types like YUV 422 10bpc, RAW16, RAW20 are supported when the
> CSI v2.0 feature is enabled in design. When the VCX feature is enabled,
> the maximum number of virtual channels becomes 16 from 4.
> 
> Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> ---
> v3
> - Fixed comments given by Hyun.
> - Removed DPHY 200 MHz clock. This will be controlled by DPHY driver
> - Minor code formatting
> - en_csi_v20 and vfb members removed from struct and made local to dt parsing

[snip]

> +};
> +
> +/*
> + * struct xcsi2rxss_core - Core configuration CSI2 Rx Subsystem device structure
> + * @dev: Platform structure
> + * @iomem: Base address of subsystem
> + * @irq: requested irq number
> + * @enable_active_lanes: If number of active lanes can be modified
> + * @max_num_lanes: Maximum number of lanes present
> + * @datatype: Data type filter
> + * @bayer: bayer pattern
> + * @events: Structure to maintain event logs
> + * @vcx_events: Structure to maintain VCX event logs
> + * @en_vcx: If more than 4 VC are enabled
> + * @lite_aclk: AXI4-Lite interface clock
> + * @video_aclk: Video clock
> + */
> +struct xcsi2rxss_core {
> +	struct device *dev;
> +	void __iomem *iomem;
> +	int irq;

This doesn't have to be stored.

> +	bool enable_active_lanes;
> +	u32 max_num_lanes;
> +	u32 datatype;
> +	u32 bayer;
> +	struct xcsi2rxss_event *events;
> +	struct xcsi2rxss_event *vcx_events;
> +	bool en_vcx;
> +	struct clk *lite_aclk;
> +	struct clk *video_aclk;
> +};
> +
> +/**
> + * struct xcsi2rxss_state - CSI2 Rx Subsystem device structure
> + * @core: Core structure for MIPI CSI2 Rx Subsystem
> + * @subdev: The v4l2 subdev structure

[snip]

> +
> +/* Print event counters */
> +static void xcsi2rxss_log_counters(struct xcsi2rxss_state *state)
> +{
> +	struct xcsi2rxss_core *core = &state->core;
> +	int i;
> +
> +	for (i = 0; i < XCSI_NUM_EVENTS; i++) {
> +		if (core->events[i].counter > 0)

Does checkpatch warn if putting {} here, and

> +			dev_info(core->dev, "%s events: %d\n",
> +				 core->events[i].name,
> +				 core->events[i].counter);
> +	}
> +
> +	if (core->en_vcx)

here, and

> +		for (i = 0; i < XCSI_VCX_NUM_EVENTS; i++) {
> +			if (core->vcx_events[i].counter > 0)

here? But up to you.

> +				dev_info(core->dev,
> +					 "VC %d Frame %s err vcx events: %d\n",
> +					 (i / 2) + XCSI_VCX_START,
> +					 i & 1 ? "Sync" : "Level",
> +					 core->vcx_events[i].counter);
> +		}
> +}
> +
> +/**
> + * xcsi2rxss_log_status - Logs the status of the CSI-2 Receiver
> + * @sd: Pointer to V4L2 subdevice structure
> + *
> + * This function prints the current status of Xilinx MIPI CSI-2

[snip]

> +
> +/**
> + * xcsi2rxss_s_ctrl - This is used to set the Xilinx MIPI CSI-2 V4L2 controls
> + * @ctrl: V4L2 control to be set
> + *
> + * This function is used to set the V4L2 controls for the Xilinx MIPI
> + * CSI-2 Rx Subsystem. It is used to set the active lanes in the system.
> + * The event counters can be reset.
> + *
> + * Return: 0 on success, errors otherwise
> + */
> +static int xcsi2rxss_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct xcsi2rxss_state *xcsi2rxss =
> +		container_of(ctrl->handler, struct xcsi2rxss_state,
> +			     ctrl_handler);
> +	struct xcsi2rxss_core *core = &xcsi2rxss->core;
> +	int ret = 0;
> +
> +	mutex_lock(&xcsi2rxss->lock);
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_XILINX_MIPICSISS_ACT_LANES:
> +		/*
> +		 * This will be called only when "Enable Active Lanes" parameter
> +		 * is set in design
> +		 */
> +		if (core->enable_active_lanes) {
> +			u32 active_lanes;
> +
> +			xcsi2rxss_clr_and_set(core, XCSI_PCR_OFFSET,
> +					      XCSI_PCR_ACTLANES_MASK,
> +					      ctrl->val - 1);
> +			/*
> +			 * This delay is to allow the value to reflect as write
> +			 * and read paths are different.
> +			 */
> +			udelay(1);
> +			active_lanes = xcsi2rxss_read(core, XCSI_PCR_OFFSET);
> +			active_lanes &= XCSI_PCR_ACTLANES_MASK;
> +			active_lanes++;
> +			if (active_lanes != ctrl->val)
> +				dev_info(core->dev, "RxByteClkHS absent\n");
> +			dev_dbg(core->dev, "active lanes = %d\n", ctrl->val);
> +		} else {
> +			ret = -EINVAL;
> +		}
> +		break;
> +	case V4L2_CID_XILINX_MIPICSISS_RESET_COUNTERS:
> +		xcsi2rxss_reset_event_counters(xcsi2rxss);
> +		break;
> +	default:

-EINVAL?

> +		break;
> +	}
> +
> +	mutex_unlock(&xcsi2rxss->lock);
> +
> +	return ret;
> +}
> +

[snip]

> +
> +static void xcsi2rxss_clk_disable(struct xcsi2rxss_core *core)
> +{
> +	clk_disable_unprepare(core->video_aclk);
> +	clk_disable_unprepare(core->lite_aclk);
> +}
> +
> +static int xcsi2rxss_parse_of(struct xcsi2rxss_state *xcsi2rxss)
> +{
> +	struct xcsi2rxss_core *core = &xcsi2rxss->core;
> +	struct device_node *node = xcsi2rxss->core.dev->of_node;
> +	struct device_node *ports = NULL;
> +	struct device_node *port = NULL;
> +	unsigned int nports;
> +	bool en_csi_v20, vfb;
> +	int ret;
> +
> +	en_csi_v20 = of_property_read_bool(node, "xlnx,en-csi-v2-0");
> +	if (en_csi_v20) {
> +		core->en_vcx = of_property_read_bool(node, "xlnx,en-vcx");
> +		dev_dbg(core->dev, "vcx %s", core->en_vcx ? "enabled" :
> +			"disabled");
> +	}
> +
> +	dev_dbg(core->dev, "en_csi_v20 %s", en_csi_v20 ? "enabled" :
> +		"disabled");

Would it be better to have these options visible with log?
It can be printed as a part of final banner in probe. Up to you.

> +
> +	core->enable_active_lanes =
> +		of_property_read_bool(node, "xlnx,en-active-lanes");
> +	dev_dbg(core->dev, "Enable active lanes property = %s\n",
> +		core->enable_active_lanes ? "Present" : "Absent");
> +
> +	ret = of_property_read_u32(node, "xlnx,csi-pxl-format",
> +				   &core->datatype);
> +	if (ret < 0) {
> +		dev_err(core->dev, "missing xlnx,csi-pxl-format property\n");
> +		return ret;
> +	}
> +
> +	switch (core->datatype) {
> +	case XCSI_DT_YUV4228B:
> +	case XCSI_DT_RGB444:
> +	case XCSI_DT_RGB555:
> +	case XCSI_DT_RGB565:
> +	case XCSI_DT_RGB666:
> +	case XCSI_DT_RGB888:
> +	case XCSI_DT_RAW6:
> +	case XCSI_DT_RAW7:
> +	case XCSI_DT_RAW8:
> +	case XCSI_DT_RAW10:
> +	case XCSI_DT_RAW12:
> +	case XCSI_DT_RAW14:
> +		break;
> +	case XCSI_DT_YUV42210B:
> +	case XCSI_DT_RAW16:
> +	case XCSI_DT_RAW20:
> +		if (!en_csi_v20) {
> +			ret = -EINVAL;
> +			dev_dbg(core->dev, "enable csi v2 for this pixel format");
> +		}
> +		break;
> +	default:
> +		ret = -EINVAL;
> +	}
> +
> +	if (ret < 0) {
> +		dev_err(core->dev, "invalid csi-pxl-format property!\n");
> +		return ret;
> +	}
> +
> +	dev_dbg(core->dev, "pixel format set as 0x%x\n", core->datatype);
> +
> +	vfb = of_property_read_bool(node, "xlnx,vfb");
> +	dev_dbg(core->dev, "Video Format Bridge property = %s\n",
> +		vfb ? "Present" : "Absent");

I'd collect all these print in one print or one location. But up to you.

> +
> +	if (!vfb) {
> +		dev_err(core->dev, "failed as VFB is disabled!\n");
> +		return -EINVAL;
> +	}

[snip]

> +	/* Register interrupt handler */
> +	core->irq = irq_of_parse_and_map(node, 0);
> +	ret = devm_request_irq(core->dev, core->irq, xcsi2rxss_irq_handler,
> +			       IRQF_SHARED, "xilinx-csi2rxss", xcsi2rxss);
> +	if (ret) {
> +		dev_err(core->dev, "Err = %d Interrupt handler reg failed!\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xcsi2rxss_probe(struct platform_device *pdev)
> +{
> +	struct v4l2_subdev *subdev;
> +	struct xcsi2rxss_state *xcsi2rxss;
> +	struct xcsi2rxss_core *core;
> +	struct resource *res;
> +	int ret, num_ctrls, i;
> +
> +	xcsi2rxss = devm_kzalloc(&pdev->dev, sizeof(*xcsi2rxss), GFP_KERNEL);
> +	if (!xcsi2rxss)
> +		return -ENOMEM;
> +
> +	core = &xcsi2rxss->core;
> +	core->dev = &pdev->dev;
> +
> +	mutex_init(&xcsi2rxss->lock);
> +
> +	ret = xcsi2rxss_parse_of(xcsi2rxss);
> +	if (ret < 0)
> +		return ret;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	core->iomem = devm_ioremap_resource(core->dev, res);
> +	if (IS_ERR(core->iomem))
> +		return PTR_ERR(core->iomem);
> +
> +	ret = xcsi2rxss_clk_get(core);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = xcsi2rxss_clk_enable(core);
> +	if (ret < 0)
> +		return ret;

Not sure if I mentioned, please consider having these with
stream on / off later.

I only have minor comments, and it looks fine to me. Please take a look at
those comments, then

	Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>

Thanks,
-hyun
