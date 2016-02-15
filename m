From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH 4/4] dmaengine: pxa_dma: fix the maximum requestor line
Date: Mon, 15 Feb 2016 18:24:57 +0100
Message-ID: <87fuwt28eu.fsf@belgarion.home>
References: <1455225798-9510-1-git-send-email-robert.jarzmik@free.fr>
	<1455225798-9510-5-git-send-email-robert.jarzmik@free.fr>
	<20160215163524.GI19598@localhost>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160215163524.GI19598@localhost> (Vinod Koul's message of "Mon,
	15 Feb 2016 22:05:24 +0530")
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Vinod Koul <vinod.koul@intel.com> writes:

> On Thu, Feb 11, 2016 at 10:23:18PM +0100, Robert Jarzmik wrote:
>> @@ -1399,13 +1405,17 @@ static int pxad_probe(struct platform_device *op)
>>  		return PTR_ERR(pdev->base);
>>  
>>  	of_id = of_match_device(pxad_dt_ids, &op->dev);
>> -	if (of_id)
>> +	if (of_id) {
>>  		of_property_read_u32(op->dev.of_node, "#dma-channels",
>>  				     &dma_channels);
>> -	else if (pdata && pdata->dma_channels)
>> +		of_property_read_u32(op->dev.of_node, "#requestors",
>> +				     &nb_requestors);
>
> I think we should check the return value here. This might be err in case
> when we have older DT on platform, but still should work with default in
> that case

Okay, but how should the code react to the err case, more specifically to
-EINVAL or -ENODATA ? As this property is optional as per the device-tree
description, the current code leaves nb_requestors = 0, as is specified in the
description, and fits the mmp_pdma case.

What do you think should be done ? A warning message ? Something else ?

Cheers.
