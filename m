From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH 1/2] memory: ti-aemif: introduce AEMIF driver
Date: Fri, 29 Nov 2013 10:43:35 -0500
Message-ID: <5298B627.5000409@ti.com>
References: <1384962416-14862-1-git-send-email-ivan.khoronzhuk@ti.com> <1384962416-14862-2-git-send-email-ivan.khoronzhuk@ti.com> <5298B370.3090405@ti.com> <5298B440.1020905@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5298B440.1020905@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Kumar Gala <galak@kernel.crashing.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, gregkh@linuxfoundation.org
List-Id: devicetree@vger.kernel.org

On Friday 29 November 2013 10:35 AM, Grygorii Strashko wrote:
> On 11/29/2013 05:32 PM, Santosh Shilimkar wrote:
>> On Wednesday 20 November 2013 10:46 AM, Ivan Khoronzhuk wrote:
>>> Add new AEMIF driver for EMIF16 Texas Instruments controller.
>>> The EMIF16 module is intended to provide a glue-less interface to
>>> a variety of asynchronous memory devices like ASRA M, NOR and NAND
>>> memory. A total of 256M bytes of any of these memories can be
>>> accessed at any given time via four chip selects with 64M byte access
> 
> [...]
> 
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct of_device_id aemif_of_match[] = {
>>> +    { .compatible = "ti,davinci-aemif", },
>>> +    { .compatible = "ti,keystone-aemif", },
>>> +    { .compatible = "ti,omap-L138-aemif", },
>>> +    {},
>>> +};
>>> +
>> Looks like you are yet to update the patches from
>> previous comments. Did I miss v2 or you haven't posted
>> that yet ?
> 
> No. This is v2, actually :( (the mess was already noticed) it was posted after v1 (https://lkml.org/lkml/2013/11/11/352), but people continue commenting v1, for some reasons.
>
OK.
 
> Next version will be posted when bindings will be clarified finally.
> 
Yeah. lets get the binding sorted out first and send the update
with all the comments included.

Regards,
Santosh
