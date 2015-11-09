From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 2/4] dma: add Qualcomm Technologies HIDMA management
 driver
Date: Mon, 9 Nov 2015 12:25:14 -0600
Message-ID: <20151109182514.GA10896@rob-hp-laptop>
References: <1446958380-23298-1-git-send-email-okaya@codeaurora.org>
 <1446958380-23298-3-git-send-email-okaya@codeaurora.org>
 <563ED8DF.6090307@codeaurora.org>
 <56400230.8030303@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56400230.8030303@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>
Cc: Timur Tabi <timur@codeaurora.org>, dmaengine@vger.kernel.org, cov@codeaurora.org, jcm@redhat.com, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Nov 08, 2015 at 09:17:20PM -0500, Sinan Kaya wrote:
> On 11/8/2015 12:08 AM, Timur Tabi wrote:
> 
> On 11/8/2015 12:08 AM, Timur Tabi wrote:
> >Sinan Kaya wrote:
> >>+    val = val & ~(MAX_BUS_REQ_LEN_MASK << MAX_BUS_WR_REQ_BIT_POS);
> >>+    val = val | (mgmtdev->max_write_request << MAX_BUS_WR_REQ_BIT_POS);
> >>+    val = val & ~(MAX_BUS_REQ_LEN_MASK);
> >>+    val = val | (mgmtdev->max_read_request);
> >
> >val &= ~MAX_BUS_REQ_LEN_MASK << MAX_BUS_WR_REQ_BIT_POS;
> >val |= mgmtdev->max_write_request << MAX_BUS_WR_REQ_BIT_POS;
> >val &= ~MAX_BUS_REQ_LEN_MASK;
> >val |= mgmtdev->max_read_request;
> >
> >>+static const struct of_device_id hidma_mgmt_match[] = {
> >>+    { .compatible = "qcom,hidma-mgmt", },
> >>+    { .compatible = "qcom,hidma-mgmt-1.0", },
> >>+    { .compatible = "qcom,hidma-mgmt-1.1", },
> >>+    {},
> >>+};
> >
> >I thought Rob said that he did NOT want to use version numbers in
> >compatible strings.  And what's the difference between these three
> >versions anyway?
> >
> 
> This was already discussed here.
> 
> https://lkml.org/lkml/2015/11/2/689
> 
> The agreement was to use

The suggestion...
 
> compatible = "qcom,hidma-mgmt-1.1", "qcom,hidma-mgmt-1.0",
> "qcom,hidma-mgmt";

I don't really want to see 3 generic-ish strings.
 
> I'll be adding code for v1.1 specifically in the future.

Please drop "qcom,hidma-mgmt" altogether. It is already meaningless. 
Then add the 1.1 compatible when you add the code for it. Hopefully you 
all can decide on part number(s) by then.

Rob
