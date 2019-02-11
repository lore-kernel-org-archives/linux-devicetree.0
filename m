From: Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v3 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem
Date: Mon, 11 Feb 2019 15:30:47 +0100
Message-ID: <7fc3bd7b-4537-3df5-12ee-55ebec17a8bd@lucaceresoli.net>
References: <1549025766-135037-1-git-send-email-vishal.sagar@xilinx.com>
 <1549025766-135037-3-git-send-email-vishal.sagar@xilinx.com>
 <3923069f-7c69-c601-0ded-f7629696ef9b@lucaceresoli.net>
 <CY4PR02MB2709000898D5E290B5EE99F4A7640@CY4PR02MB2709.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CY4PR02MB2709000898D5E290B5EE99F4A7640@CY4PR02MB2709.namprd02.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vishal Sagar <vsagar@xilinx.com>, Vishal Sagar <vishal.sagar@xilinx.com>, Hyun Kwon <hyunk@xilinx.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Michal Simek <michals@xilinx.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinesh Kumar <dineshk@xilinx.com>Sa
List-Id: devicetree@vger.kernel.org

Hi,

thanks for the quick reply.

On 11/02/19 13:43, Vishal Sagar wrote:
>>> +static int xcsi2rxss_start_stream(struct xcsi2rxss_state *state)
>>> +{
>>> +     struct xcsi2rxss_core *core = &state->core;
>>> +     int ret = 0;
>>> +
>>> +     xcsi2rxss_enable(core);
>>> +
>>> +     ret = xcsi2rxss_reset(core);
>>> +     if (ret < 0) {
>>> +             state->streaming = false;
>>> +             return ret;
>>> +     }
>>> +
>>> +     xcsi2rxss_intr_enable(core);
>>> +     state->streaming = true;
>>
>> Shouldn't you propagate s_stream to the upstream subdev here calling
>> v4l2_subdev_call(..., ..., s_stream, 1)?
>>
> 
> This is done by the xvip_pipeline_start_stop() in xilinx-dma.c for Xilinx Video pipeline.

Indeed it does, however other CSI2 RX drivers do propagate s_stream in
their own s_stream. Not strictly related to this driver, but what's the
logic for having these two different behaviors?

Also xvip_pipeline_start_stop() only follows the graph through
entity->pads[0], so it looks like it cannot handle entities with
multiple sink pads. How would it be able to handle e.g. the AXI4-Stream
Switch [0], which has 2+ sink pads?

[0]
https://www.xilinx.com/support/documentation/ip_documentation/axis_infrastructure_ip_suite/v1_1/pg085-axi4stream-infrastructure.pdf
(page 16).

-- 
Luca
