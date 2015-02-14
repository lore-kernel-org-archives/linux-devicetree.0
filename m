From: Scott Branden <sbranden@broadcom.com>
Subject: Re: [PATCH 1/2] hwrng: iproc-rng200 - Add Broadcom IPROC RNG driver
Date: Sat, 14 Feb 2015 09:02:25 -0800
Message-ID: <54DF7FA1.1090906@broadcom.com>
References: <Scott Branden <sbranden@broadcom.com>	 <1423526830-29516-1-git-send-email-sbranden@broadcom.com>	 <1423526830-29516-2-git-send-email-sbranden@broadcom.com> <1423528033.2933.29.camel@perches.com> <54DF797B.40407@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54DF797B.40407@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Grant Likely <grant.likely@linaro.org>, Ray Jui <rjui@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

I didn't read this properly.  Will add \n in the dev_err messages.

Thanks,
  Scott

On 15-02-14 08:36 AM, Scott Branden wrote:
> Hi Joe,
>
> I really don't see the missing terminating newlines in the patch or
> source code.  The lines look the same as every other line???
>
> Regards,
>   Scott
>
> On 15-02-09 04:27 PM, Joe Perches wrote:
>> On Mon, 2015-02-09 at 16:07 -0800, Scott Branden wrote:
>>> This adds a driver for random number generator present on Broadcom
>>> IPROC devices.
>>
>> trivia:
>>
>>> diff --git a/drivers/char/hw_random/iproc-rng200.c
>>> b/drivers/char/hw_random/iproc-rng200.c
>> []
>>> +static int iproc_rng200_probe(struct platform_device *pdev)
>>> +{
>> []
>>> +    if (!res) {
>>> +        dev_err(dev, "failed to get rng resources");
>>
>> Missing terminating newline:
>>
>>         dev_err(dev, "failed to get rng resources\n");
>>
>>> +    rng_base = devm_ioremap_resource(dev, res);
>>> +    if (!rng_base) {
>>> +        dev_err(dev, "failed to remap rng regs");
>>
>> here too.
>>
>>
>
