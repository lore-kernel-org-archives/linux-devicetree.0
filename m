From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: phy: Add support for QMP phy
Date: Wed, 18 Jan 2017 16:40:28 -0800
Message-ID: <20170119004028.GA4857@codeaurora.org>
References: <1484045519-19030-1-git-send-email-vivek.gautam@codeaurora.org>
 <1484045519-19030-4-git-send-email-vivek.gautam@codeaurora.org>
 <587C88FE.2040900@ti.com>
 <50612693-5345-55da-8207-8c5e721fb68a@codeaurora.org>
 <20170118182223.GP10531@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170118182223.GP10531@minitux>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Vivek Gautam <vivek.gautam@codeaurora.org>, Kishon Vijay Abraham I <kishon@ti.com>, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/18, Bjorn Andersson wrote:
> On Tue 17 Jan 22:54 PST 2017, Vivek Gautam wrote:
> > On 01/16/2017 02:19 PM, Kishon Vijay Abraham I wrote:
> > > On Tuesday 10 January 2017 04:21 PM, Vivek Gautam wrote:
> [..]
> > > > +		reset-names = "phy", "common", "cfg",
> > > > +				"lane0", "lane1", "lane2";
> > > Each lane has a separate clock, separate reset.. why not create sub-nodes for
> > > each lane?
> > 
> > Yes, each lane has separate pipe clock and resets.
> > I can have a binding such as written below.
> 
> +1
> 
> > Does it makes sense to pull in the tx, rx and pcs offsets as well
> > to the child node, and iomap the entire address space of the phy ?
> > 
> 
> Note that you don't have to follow the same structure in your device
> driver as you describe your hardware in devicetree.
> 
> I would suggest that you replace the lane-offset and various lane
> specific resources with subnodes, but keep the driver "as is".
> 

Didn't we already move away from subnodes for lanes in an earlier
revision of these patches? I seem to recall we did that because
lanes are not devices and the whole "phy as a bus" concept not
making sense.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
