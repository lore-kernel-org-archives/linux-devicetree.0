From: "Shenhar, Talel" <talel@amazon.com>
Subject: Re: [UNVERIFIED SENDER] Re: [PATCH v4 2/2] soc: amazon: al-pos-edac:
 Introduce Amazon's Annapurna Labs POS EDAC driver
Date: Mon, 7 Oct 2019 14:34:03 +0300
Message-ID: <6815f9e9-f250-bd62-33b3-e3ab30aa47e2@amazon.com>
References: <1570102361-11696-1-git-send-email-talel@amazon.com>
 <1570102361-11696-3-git-send-email-talel@amazon.com>
 <86k19gztil.wl-maz@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <86k19gztil.wl-maz@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <maz@kernel.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, davem@davemloft.net, gregkh@linuxfoundation.org, paulmck@linux.ibm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, dwmw@amazon.co.uk, benh@kernel.crashing.org, hhhawa@amazon.com, ronenk@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, amirkl@amazon.com, barakw@amazon.com
List-Id: devicetree@vger.kernel.org

thanks for the review

On 10/7/2019 2:26 PM, Marc Zyngier wrote:
> On Thu, 03 Oct 2019 12:32:41 +0100,
> Talel Shenhar <talel@amazon.com> wrote:
>> +	log1 = readl(al_pos->mmio_base + AL_POS_ERROR_LOG_1);
> I already commented on the misuse of strict accesses. Unless you can
> explain and document *why* you need the extra ordering, please use
> relaxed accesses.
agreeing on relaxed, shall be part of v5
>
>> +
>> +	if (al_pos->irq > 0) {
>> +		ret = devm_request_irq(&pdev->dev,
>> +				       al_pos->irq,
>> +				       al_pos_irq_handler,
>> +				       0,
>> +				       pdev->name,
>> +				       pdev);
>> +		if (ret != 0) {
>> +			dev_err(&pdev->dev,
>> +				"failed to register to irq %d (%d)\n",
>> +				al_pos->irq, ret);
>> +			goto err_remove_edac;
> Would it be worth continuing without interrupts? After all, the
> interrupt seems to be an optional part of the device...

indeed interrupts are optional, however, this is optional for some of 
the systems.

in some cases (and some systems), this error event is critical and 
should cause fast handling. for those, we define the interrupts.

so bottom line, i would like to keep this error in case of error in 
interrupt.

>
> Thanks,
>
> 	M.
>
