From: "Hawa, Hanna" <hhhawa@amazon.com>
Subject: Re: [PATCH v3 4/4] edac: Add support for Amazon's Annapurna Labs L2
 EDAC
Date: Tue, 3 Sep 2019 11:28:41 +0300
Message-ID: <2bce020a-bf7e-1d54-48c3-0aa6d23c84d8@amazon.com>
References: <1563197049-12679-1-git-send-email-hhhawa@amazon.com>
 <1563197049-12679-5-git-send-email-hhhawa@amazon.com>
 <20190903072655.kz5x7n3477dg4yap@rric.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190903072655.kz5x7n3477dg4yap@rric.localdomain>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Richter <rrichter@marvell.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "bp@alien8.de" <bp@alien8.de>, "mchehab@kernel.org" <mchehab@kernel.org>, "james.morse@arm.com" <james.morse@arm.com>, "davem@davemloft.net" <davem@davemloft.net>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "dwmw@amazon.co.uk" <dwmw@amazon.co.uk>, "benh@amazon.com" <benh@amazon.com>, "ronenk@amazon.com" <ronenk@amazon.com>, "talel@amazon.com" <talel@amazon.com>, "jonnyc@amazon.com" <jonnyc@amazon.com>, "hanochu@amazon.com" <hanochu@>
List-Id: devicetree@vger.kernel.org



On 9/3/2019 10:27 AM, Robert Richter wrote:
> On 15.07.19 16:24:09, Hanna Hawa wrote:
>> Adds support for Amazon's Annapurna Labs L2 EDAC driver to detect and
>> report L2 errors.
>>
>> Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
>> ---
>>   MAINTAINERS               |   6 ++
>>   drivers/edac/Kconfig      |   8 ++
>>   drivers/edac/Makefile     |   1 +
>>   drivers/edac/al_l2_edac.c | 187 ++++++++++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 202 insertions(+)
>>   create mode 100644 drivers/edac/al_l2_edac.c
> 
>  From a brief look at it, it seems some of my comments from 2/4 apply
> here too. Please look through it.

Thanks for your review, will look and fix on top of v5.

Thanks,
Hanna

> 
> -Robert
> 
