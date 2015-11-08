From: Sinan Kaya <okaya@codeaurora.org>
Subject: Re: [PATCH V3 4/4] dma: add Qualcomm Technologies HIDMA channel
 driver
Date: Sun, 8 Nov 2015 16:51:38 -0500
Message-ID: <563FC3EA.1040303@codeaurora.org>
References: <1446958380-23298-1-git-send-email-okaya@codeaurora.org>
 <1446958380-23298-5-git-send-email-okaya@codeaurora.org>
 <CAHp75VebMdGRkgddoaCH_d_7hzXJt9QXqWc4yvSY=PJ-FcsRLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAHp75VebMdGRkgddoaCH_d_7hzXJt9QXqWc4yvSY=PJ-FcsRLA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: dmaengine <dmaengine@vger.kernel.org>, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com, Andy Gross <agross@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 11/8/2015 3:47 PM, Andy Shevchenko wrote:
>> +       trca_resource = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> >+       if (!trca_resource) {
>> >+               rc = -ENODEV;
>> >+               goto bailout;
>> >+       }
> Why did you ignore my comment about this block?
> Remove that condition entirely.
>
>> >+
>> >+       trca = devm_ioremap_resource(&pdev->dev, trca_resource);
>> >+       if (IS_ERR(trca)) {
>> >+               rc = -ENOMEM;
>> >+               goto bailout;
>> >+       }

Sorry, I didn't quite get your comment. I thought you wanted to see 
platform_get_resource and devm_ioremap_resource together.

Which one do you want me to remove?

-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
