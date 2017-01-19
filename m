From: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: phy: Add support for QMP phy
Date: Thu, 19 Jan 2017 10:42:05 +0530
Message-ID: <5cee25c5-434b-6e73-301e-3942dedd16fa@codeaurora.org>
References: <1484045519-19030-1-git-send-email-vivek.gautam@codeaurora.org>
 <1484045519-19030-4-git-send-email-vivek.gautam@codeaurora.org>
 <587C88FE.2040900@ti.com>
 <50612693-5345-55da-8207-8c5e721fb68a@codeaurora.org>
 <20170118182223.GP10531@minitux> <20170119004028.GA4857@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170119004028.GA4857-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 01/19/2017 06:10 AM, Stephen Boyd wrote:
> On 01/18, Bjorn Andersson wrote:
>> On Tue 17 Jan 22:54 PST 2017, Vivek Gautam wrote:
>>> On 01/16/2017 02:19 PM, Kishon Vijay Abraham I wrote:
>>>> On Tuesday 10 January 2017 04:21 PM, Vivek Gautam wrote:
>> [..]
>>>>> +		reset-names = "phy", "common", "cfg",
>>>>> +				"lane0", "lane1", "lane2";
>>>> Each lane has a separate clock, separate reset.. why not create sub-nodes for
>>>> each lane?
>>> Yes, each lane has separate pipe clock and resets.
>>> I can have a binding such as written below.
>> +1
>>
>>> Does it makes sense to pull in the tx, rx and pcs offsets as well
>>> to the child node, and iomap the entire address space of the phy ?
>>>
>> Note that you don't have to follow the same structure in your device
>> driver as you describe your hardware in devicetree.
>>
>> I would suggest that you replace the lane-offset and various lane
>> specific resources with subnodes, but keep the driver "as is".
>>
> Didn't we already move away from subnodes for lanes in an earlier
> revision of these patches? I seem to recall we did that because
> lanes are not devices and the whole "phy as a bus" concept not
> making sense.

Yea, we started out without having any sub-nodes and we
argued that we don't require them since the qmp device is
represented by the qmp node itself.
The lanes otoh are representative of gen_phys and related properties.

In the driver -
"struct qmp_phy " represents the lanes and holds "struct phy",
"struct qcom_qmp" represents the qmp block as a whole and holds "struct 
device"
Does this make lanes qualify to be childs of qmp ?

"phy as a bus" (just trying to understand here) -
let's say a usb phy controller has one HSIC phy port and one USB2 phy port.
So, should this phy controller be a bus providing two ports (and so we 
will have
couple of child nodes to the phy controller) ?


Regards
Vivek

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
