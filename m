From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V3 2/4] dma: add Qualcomm Technologies HIDMA management
 driver
Date: Sun, 8 Nov 2015 21:17:20 -0500
Message-ID: <56400230.8030303@codeaurora.org>
References: <1446958380-23298-1-git-send-email-okaya@codeaurora.org>
 <1446958380-23298-3-git-send-email-okaya@codeaurora.org>
 <563ED8DF.6090307@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <563ED8DF.6090307@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>, dmaengine@vger.kernel.org, cov@codeaurora.org, jcm@redhat.com
Cc: agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/8/2015 12:08 AM, Timur Tabi wrote:

On 11/8/2015 12:08 AM, Timur Tabi wrote:
> Sinan Kaya wrote:
>> +    val = val & ~(MAX_BUS_REQ_LEN_MASK << MAX_BUS_WR_REQ_BIT_POS);
>> +    val = val | (mgmtdev->max_write_request << MAX_BUS_WR_REQ_BIT_POS);
>> +    val = val & ~(MAX_BUS_REQ_LEN_MASK);
>> +    val = val | (mgmtdev->max_read_request);
>
> val &= ~MAX_BUS_REQ_LEN_MASK << MAX_BUS_WR_REQ_BIT_POS;
> val |= mgmtdev->max_write_request << MAX_BUS_WR_REQ_BIT_POS;
> val &= ~MAX_BUS_REQ_LEN_MASK;
> val |= mgmtdev->max_read_request;
>
>> +static const struct of_device_id hidma_mgmt_match[] = {
>> +    { .compatible = "qcom,hidma-mgmt", },
>> +    { .compatible = "qcom,hidma-mgmt-1.0", },
>> +    { .compatible = "qcom,hidma-mgmt-1.1", },
>> +    {},
>> +};
>
> I thought Rob said that he did NOT want to use version numbers in
> compatible strings.  And what's the difference between these three
> versions anyway?
>

This was already discussed here.

https://lkml.org/lkml/2015/11/2/689

The agreement was to use

compatible = "qcom,hidma-mgmt-1.1", "qcom,hidma-mgmt-1.0", 
"qcom,hidma-mgmt";

I'll be adding code for v1.1 specifically in the future.


-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
