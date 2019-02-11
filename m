From: Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v3 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem
Date: Mon, 11 Feb 2019 11:42:24 +0100
Message-ID: <3923069f-7c69-c601-0ded-f7629696ef9b@lucaceresoli.net>
References: <1549025766-135037-1-git-send-email-vishal.sagar@xilinx.com>
 <1549025766-135037-3-git-send-email-vishal.sagar@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549025766-135037-3-git-send-email-vishal.sagar@xilinx.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vishal Sagar <vishal.sagar@xilinx.com>, hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, michals@xilinx.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dineshk@xilinx.com, sandipk@xilinx.com
List-Id: devicetree@vger.kernel.org

Hi Vishal,

On 01/02/19 13:56, Vishal Sagar wrote:
> The Xilinx MIPI CSI-2 Rx Subsystem soft IP is used to capture images
> from MIPI CSI-2 camera sensors and output AXI4-Stream video data ready
> for image processing. Please refer to PG232 for details.

For those unused to Xilinx documentation I'd use the full document name
("MIPI CSI-2 Receiver Subsystem v4.0") or, even better, a stable URL if
available.

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

...

> +/**
> + * xcsi2rxss_reset - Does a soft reset of the MIPI CSI2 Rx Subsystem
> + * @core: Core Xilinx CSI2 Rx Subsystem structure pointer
> + *
> + * Core takes less than 100 video clock cycles to reset.
> + * So a larger timeout value is chosen for margin.
> + *
> + * Return: 0 - on success OR -ETIME if reset times out
> + */
> +static int xcsi2rxss_reset(struct xcsi2rxss_core *core)
> +{
> +	u32 timeout = XCSI_TIMEOUT_VAL;

The comment about the timeout is duplicated here and at the #define
line. Why not removing the define above and just putting

  u32 timeout = 1000; /* us */

here? It would make the entire timeout logic appear in a unique place.

> +static int xcsi2rxss_start_stream(struct xcsi2rxss_state *state)
> +{
> +	struct xcsi2rxss_core *core = &state->core;
> +	int ret = 0;
> +
> +	xcsi2rxss_enable(core);
> +
> +	ret = xcsi2rxss_reset(core);
> +	if (ret < 0) {
> +		state->streaming = false;
> +		return ret;
> +	}
> +
> +	xcsi2rxss_intr_enable(core);
> +	state->streaming = true;

Shouldn't you propagate s_stream to the upstream subdev here calling
v4l2_subdev_call(..., ..., s_stream, 1)?

> +	return ret;
> +}


-- 
Luca
