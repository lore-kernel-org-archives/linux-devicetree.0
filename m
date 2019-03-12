From: Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v6 1/2] media: dt-bindings: media: xilinx: Add Xilinx MIPI
 CSI-2 Rx Subsystem
Date: Tue, 12 Mar 2019 16:03:19 +0100
Message-ID: <ff914561-a021-9405-8b26-11d4a5cc605d@lucaceresoli.net>
References: <1552365330-21155-1-git-send-email-vishal.sagar@xilinx.com>
 <1552365330-21155-2-git-send-email-vishal.sagar@xilinx.com>
 <20190312102118.6ianedkzscr7gdba@kekkonen.localdomain>
 <DM5PR02MB2713DB568A4AD713BE3B2621A7490@DM5PR02MB2713.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DM5PR02MB2713DB568A4AD713BE3B2621A7490@DM5PR02MB2713.namprd02.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vishal Sagar <vsagar@xilinx.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Vishal Sagar <vishal.sagar@xilinx.com>
Cc: Hyun Kwon <hyunk@xilinx.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Michal Simek <michals@xilinx.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinesh Kumar <dineshk@xilinx.com>, Sandip Kothari <sandipk@xilinx.com>
List-Id: devicetree@vger.kernel.org

Hi Vishal, Sakari,

On 12/03/19 15:45, Vishal Sagar wrote:
>>> +- xlnx,en-csi-v2-0: Present if CSI v2 is enabled in IP configuration.
>>> +- xlnx,en-vcx: When present, there are maximum 16 virtual channels, else
>>> +  only 4. This is present only if xlnx,en-csi-v2-0 is present.
>>> +- xlnx,en-active-lanes: present if the number of active lanes can be
>>> +  reconfigured at runtime in the Protocol Configuration Register.
>>> +  If present, the V4L2_CID_XILINX_MIPICSISS_ACT_LANES control is added.
>>> +  Otherwise all lanes, as set in IP configuration, are always active.
>>
>> The bindings document hardware, therefore a V4L2 control name doesn't
>> belong here.
>>
> Ok. I will remove this and revert to original description as below -
> 
> xlnx,en-active-lanes: present if the number of active lanes can be
> re-configured at runtime in the Protocol Configuration Register

I'm to blame here as I suggested that text. However I still find the
original wording was ambiguous: my initial reading of it was close to
the opposite of the intended meaning. xlnx,en-active-lanes means "a
register exists to configure the active lanes at runtime" and I just
care that this is stated clearly and unambiguously.

If we cannot mention a control name here, why not just dropping it:

- xlnx,en-active-lanes: present if the number of active lanes can be
  reconfigured at runtime in the Protocol Configuration Register.
  Otherwise all lanes are always active.

-- 
Luca
