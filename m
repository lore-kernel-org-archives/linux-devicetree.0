From: Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v3 1/2] media: dt-bindings: media: xilinx: Add Xilinx MIPI
 CSI-2 Rx Subsystem
Date: Mon, 11 Mar 2019 13:08:06 +0100
Message-ID: <1f698576-89b2-e264-387e-6db4c5a4713a@lucaceresoli.net>
References: <1549025766-135037-1-git-send-email-vishal.sagar@xilinx.com>
 <1549025766-135037-2-git-send-email-vishal.sagar@xilinx.com>
 <fe975327-2746-28d4-1340-5ad1e71858f1@lucaceresoli.net>
 <CY4PR02MB27098AB5D144C74AE6553699A74D0@CY4PR02MB2709.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CY4PR02MB27098AB5D144C74AE6553699A74D0@CY4PR02MB2709.namprd02.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vishal Sagar <vsagar@xilinx.com>, Vishal Sagar <vishal.sagar@xilinx.com>, Hyun Kwon <hyunk@xilinx.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Michal Simek <michals@xilinx.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinesh Kumar <dineshk@xilinx.com>Sa
List-Id: devicetree@vger.kernel.org

Hi Vishal,

On 08/03/19 20:04, Vishal Sagar wrote:
>>> +Optional properties:
>>> +--------------------
>>> +- xlnx,vfb: This is present when Video Format Bridge is enabled.
>>> +  Without this property the driver won't be loaded as IP won't be able to
>> generate
>>> +  media bus format compliant stream output.
>>> +- xlnx,en-csi-v2-0: Present if CSI v2 is enabled in IP configuration.
>>> +- xlnx,en-vcx: When present, there are maximum 16 virtual channels, else
>>> +  only 4. This is present only if xlnx,en-csi-v2-0 is present.
>>> +- xlnx,en-active-lanes: Enable Active lanes configuration in Protocol
>>> +  Configuration Register.
>>
>> This doesn't seem very clear to me. According to my understanding of the
>> IP and driver, I'd rather rephrase as:
>>
>> - xlnx,en-active-lanes: present if the number of active lanes can be
>>   reconfigured at runtime in the Protocol Configuration Register.
>>   If present, the V4L2_CID_XILINX_MIPICSISS_ACT_LANES is added.
>>   Otherwise all lanes are always active.
>>
> 
> Your description is better. I will update with this in next version.

Ok, thanks. But I just noticed an error in my own words...
"V4L2_CID_XILINX_MIPICSISS_ACT_LANES is added" ->
"V4L2_CID_XILINX_MIPICSISS_ACT_LANES control is added".

-- 
Luca
