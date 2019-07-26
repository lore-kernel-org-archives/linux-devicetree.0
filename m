From: "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Subject: Re: [RFC PATCH 14/17] ipmi: kcs: Finish configuring ASPEED KCS device
 before enable
Date: Sat, 27 Jul 2019 01:24:43 +0800
Message-ID: <b4d60d12-0a1f-906a-1f3a-da0cfdd06be3@linux.intel.com>
References: <20190726053959.2003-1-andrew@aj.id.au>
 <20190726053959.2003-15-andrew@aj.id.au>
 <29a2d999-23bd-8e95-a1b8-f00e25a11df5@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <29a2d999-23bd-8e95-a1b8-f00e25a11df5@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Corey Minyard <minyard@acm.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openipmi-developer@lists.sourceforge.net
List-Id: devicetree@vger.kernel.org


在 2019-07-27 01:04, Wang, Haiyue 写道:
> 在 2019-07-26 13:39, Andrew Jeffery 写道:
>> The currently interrupts are configured after the channel was enabled.
>>
>> Cc: Haiyue Wang<haiyue.wang@linux.intel.com>
>> Cc: Corey Minyard<minyard@acm.org>
>> Cc: Arnd Bergmann<arnd@arndb.de>
>> Cc: Greg Kroah-Hartman<gregkh@linuxfoundation.org>
>> Cc:openipmi-developer@lists.sourceforge.net
>> Signed-off-by: Andrew Jeffery<andrew@aj.id.au>
>> ---
>>   drivers/char/ipmi/kcs_bmc_aspeed.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c 
>> b/drivers/char/ipmi/kcs_bmc_aspeed.c
>> index 3c955946e647..e3dd09022589 100644
>> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
>> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
>> @@ -268,13 +268,14 @@ static int aspeed_kcs_probe(struct 
>> platform_device *pdev)
>>       kcs_bmc->io_inputb = aspeed_kcs_inb;
>>       kcs_bmc->io_outputb = aspeed_kcs_outb;
>>   +    rc = aspeed_kcs_config_irq(kcs_bmc, pdev);
>> +    if (rc)
>> +        return rc;
>> +
>>       dev_set_drvdata(dev, kcs_bmc);
>
>
> Thanks for catching this, for not miss the data.
>
Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
