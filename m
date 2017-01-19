From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: phy: Add support for QMP phy
Date: Thu, 19 Jan 2017 13:42:58 -0800
Message-ID: <20170119214258.GD7829@codeaurora.org>
References: <1484045519-19030-1-git-send-email-vivek.gautam@codeaurora.org>
 <1484045519-19030-4-git-send-email-vivek.gautam@codeaurora.org>
 <587C88FE.2040900@ti.com>
 <50612693-5345-55da-8207-8c5e721fb68a@codeaurora.org>
 <20170118182223.GP10531@minitux>
 <20170119004028.GA4857@codeaurora.org>
 <5cee25c5-434b-6e73-301e-3942dedd16fa@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5cee25c5-434b-6e73-301e-3942dedd16fa@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/19, Vivek Gautam wrote:
> 
> On 01/19/2017 06:10 AM, Stephen Boyd wrote:
> >>
> >Didn't we already move away from subnodes for lanes in an earlier
> >revision of these patches? I seem to recall we did that because
> >lanes are not devices and the whole "phy as a bus" concept not
> >making sense.
> 
> Yea, we started out without having any sub-nodes and we
> argued that we don't require them since the qmp device is
> represented by the qmp node itself.
> The lanes otoh are representative of gen_phys and related properties.
> 
> In the driver -
> "struct qmp_phy " represents the lanes and holds "struct phy",
> "struct qcom_qmp" represents the qmp block as a whole and holds
> "struct device"
> Does this make lanes qualify to be childs of qmp ?

Hmm... maybe I was recalling the DSI phy binding. I think there
are lanes there too but we decided to just have one node.

> 
> "phy as a bus" (just trying to understand here) -
> let's say a usb phy controller has one HSIC phy port and one USB2 phy port.
> So, should this phy controller be a bus providing two ports (and so
> we will have
> couple of child nodes to the phy controller) ?
> 

Typically in DT a subnode or collection of subnodes means there's
some sort of bus involved. Usually each node corresponds to a
struct device, and the parent node corresponds to the bus or
controller for the logical bus.

In this case (only PCIe though? not UFS or USB?) it seems like we
have multiple phys that share a common register space, but
otherwise they have their own register space and power
management. Would you have each PCIe controller point to a
different subnode for their associated phy? I'm trying to
understand the benefit of the subnodes if they aren't treated as
struct devices.

At the least, please get DT reviewers to ack the new binding
before rewriting the code.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
