From: "Hawa, Hanna" <hhhawa@amazon.com>
Subject: Re: [PATCH v2 2/4] edac: Add support for Amazon's Annapurna Labs L1
 EDAC
Date: Tue, 9 Jul 2019 14:01:03 +0300
Message-ID: <45e9ac35-9ffc-8f5f-cbdb-f85453227363@amazon.com>
References: <1562500658-14717-1-git-send-email-hhhawa@amazon.com>
 <1562500658-14717-3-git-send-email-hhhawa@amazon.com>
 <20190709173229.0000135f@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190709173229.0000135f@huawei.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, davem@davemloft.net, gregkh@linuxfoundation.org, linus.walleij@linaro.org, nicolas.ferre@microchip.com, paulmck@linux.ibm.com, dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com, talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 7/9/2019 12:32 PM, Jonathan Cameron wrote:
>> Signed-off-by: Hanna Hawa<hhhawa@amazon.com>
> A quick drive by review as I was feeling curious.
> 
> Just a couple of trivial queries and observation on the fact it
> might be useful to add a few devm managed functions to cut down
> on edac driver boilerplate.
> 
> Thanks,
> 
> Jonathan
> 
>> +#define ARM_CA57_CPUMERRSR_VALID		GENMASK(31, 31)
> For a single bit it's common to use BIT(31) rather than GENMASK to make
> it explicit.

Will fix.

> 
> 
>> +	edac_dev->mod_name = dev_name(dev);
> I'd admit I'm not that familiar with edac, but seems odd that a
> module name field would have the dev_name.

Will fix when I got more inputs.

> 
>> +	edac_device_free_ctl_info(edac_dev);
> More a passing observation than a suggestion for this driver, but if there was
> ever a place where it looked like a couple of devm_ allocation functions would
> be useful, this is it;)
> 
> edac_dev = devm_device_alloc_ctrl_info(dev, ...)
> ...
> devm_edac_device_add_device(dev, ...)

I agree.
I can implement the devm_* functions in separate patches as this is not 
related to my patches (and not to delay this patches).

> 
> 
