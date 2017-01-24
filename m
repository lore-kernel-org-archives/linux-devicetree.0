From: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: phy: Add support for QMP phy
Date: Tue, 24 Jan 2017 15:03:33 +0530
Message-ID: <58871F6D.1090206@ti.com>
References: <1484045519-19030-1-git-send-email-vivek.gautam@codeaurora.org>
 <1484045519-19030-4-git-send-email-vivek.gautam@codeaurora.org>
 <587C88FE.2040900@ti.com>
 <50612693-5345-55da-8207-8c5e721fb68a@codeaurora.org>
 <20170118182223.GP10531@minitux> <20170119004028.GA4857@codeaurora.org>
 <5cee25c5-434b-6e73-301e-3942dedd16fa@codeaurora.org>
 <20170119214258.GD7829@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170119214258.GD7829-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Friday 20 January 2017 03:12 AM, Stephen Boyd wrote:
> On 01/19, Vivek Gautam wrote:
>>
>> On 01/19/2017 06:10 AM, Stephen Boyd wrote:
>>>>
>>> Didn't we already move away from subnodes for lanes in an earlier
>>> revision of these patches? I seem to recall we did that because
>>> lanes are not devices and the whole "phy as a bus" concept not
>>> making sense.
>>
>> Yea, we started out without having any sub-nodes and we
>> argued that we don't require them since the qmp device is
>> represented by the qmp node itself.
>> The lanes otoh are representative of gen_phys and related properties.
>>
>> In the driver -
>> "struct qmp_phy " represents the lanes and holds "struct phy",
>> "struct qcom_qmp" represents the qmp block as a whole and holds
>> "struct device"
>> Does this make lanes qualify to be childs of qmp ?
> 
> Hmm... maybe I was recalling the DSI phy binding. I think there
> are lanes there too but we decided to just have one node.
> 
>>
>> "phy as a bus" (just trying to understand here) -
>> let's say a usb phy controller has one HSIC phy port and one USB2 phy port.
>> So, should this phy controller be a bus providing two ports (and so
>> we will have
>> couple of child nodes to the phy controller) ?
>>
> 
> Typically in DT a subnode or collection of subnodes means there's
> some sort of bus involved. Usually each node corresponds to a
> struct device, and the parent node corresponds to the bus or
> controller for the logical bus.
> 
> In this case (only PCIe though? not UFS or USB?) it seems like we
> have multiple phys that share a common register space, but
> otherwise they have their own register space and power
> management. Would you have each PCIe controller point to a
> different subnode for their associated phy? I'm trying to
> understand the benefit of the subnodes if they aren't treated as
> struct devices.

Yes, instead of having all the controller having a phandle to the same PHY and
then using other mechanisms to differentiate between the PHYs, each controller
can have a phandle to the exact port that it is connected to.

This also gives a better representation of the hardware and can avoid lot of
boilerplate code in the driver.

Thanks
Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
