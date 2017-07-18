From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 3/7] phy: qcom-qmp: Fix phy pipe clock name
Date: Tue, 18 Jul 2017 09:56:44 -0700
Message-ID: <20170718165644.GF20973@minitux>
References: <1500293043-1887-1-git-send-email-varada@codeaurora.org>
 <1500293043-1887-4-git-send-email-varada@codeaurora.org>
 <20170717223047.GA20973@minitux>
 <20170718085440.GD32439@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170718085440.GD32439@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Varadarajan Narayanan <varada@codeaurora.org>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, svarbanov@mm-sol.com, kishon@ti.com, sboyd@codeaurora.org, vivek.gautam@codeaurora.org, fengguang.wu@intel.com, weiyongjun1@huawei.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 18 Jul 01:54 PDT 2017, Varadarajan Narayanan wrote:
> On Mon, Jul 17, 2017 at 03:30:47PM -0700, Bjorn Andersson wrote:
[..]
> >
> > This would be the case for any existing dts files, so you're not allowed
> > to treat this as an error.
> 
> Since, there are no dts files that presently enable this driver,
> wouldn't it be better to flag this as an error now itself instead
> of having to fall back to old handling (which as mentioned above
> is incomplete). Please let me know.
> 

You're right, hopefully we can introduce it in the upstream dts for
v4.14...

So it does make sense to fix this up now, rather than live with the
fallback forever. Can you ensure we get an "ack" from Vivek on this?

Regards,
Bjorn
