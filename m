From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH V3 2/4] dma: add Qualcomm Technologies HIDMA management
 driver
Date: Sat, 7 Nov 2015 23:08:47 -0600
Message-ID: <563ED8DF.6090307@codeaurora.org>
References: <1446958380-23298-1-git-send-email-okaya@codeaurora.org>
 <1446958380-23298-3-git-send-email-okaya@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1446958380-23298-3-git-send-email-okaya@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Sinan Kaya <okaya@codeaurora.org>, dmaengine@vger.kernel.org, cov@codeaurora.org, jcm@redhat.com
Cc: agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Sinan Kaya wrote:
> +	val = val & ~(MAX_BUS_REQ_LEN_MASK << MAX_BUS_WR_REQ_BIT_POS);
> +	val = val | (mgmtdev->max_write_request << MAX_BUS_WR_REQ_BIT_POS);
> +	val = val & ~(MAX_BUS_REQ_LEN_MASK);
> +	val = val | (mgmtdev->max_read_request);

val &= ~MAX_BUS_REQ_LEN_MASK << MAX_BUS_WR_REQ_BIT_POS;
val |= mgmtdev->max_write_request << MAX_BUS_WR_REQ_BIT_POS;
val &= ~MAX_BUS_REQ_LEN_MASK;
val |= mgmtdev->max_read_request;

> +static const struct of_device_id hidma_mgmt_match[] = {
> +	{ .compatible = "qcom,hidma-mgmt", },
> +	{ .compatible = "qcom,hidma-mgmt-1.0", },
> +	{ .compatible = "qcom,hidma-mgmt-1.1", },
> +	{},
> +};

I thought Rob said that he did NOT want to use version numbers in 
compatible strings.  And what's the difference between these three 
versions anyway?

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation.
