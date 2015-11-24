From: Simon Arlott <simon@fire.lp0.eu>
Subject: Re: [PATCH (v4) 2/2] mtd: brcmnand: Add support for the BCM63268
Date: Tue, 24 Nov 2015 08:12:03 +0000
Message-ID: <56541BD3.4070202@simon.arlott.org.uk>
References: <56506D55.3000907@simon.arlott.org.uk>
 <20151122215945.GA5930@rob-hp-laptop> <56523E85.905@simon.arlott.org.uk>
 <56523EFF.9050502@simon.arlott.org.uk> <56535977.9050201@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56535977.9050201@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonas Gorski <jogo@openwrt.org>
List-Id: devicetree@vger.kernel.org

On 23/11/15 18:22, Florian Fainelli wrote:
> On 22/11/15 14:17, Simon Arlott wrote:
>> The BCM63268 has a NAND interrupt register with combined status and enable
>> registers. It also has a clock for the NAND controller that needs to be
>> enabled.
>> 
>> Set up the device by enabling the clock, disabling and acking all
>> interrupts, then handle the CTRL_READY interrupt.
>> 
>> Add a "device_remove" function to struct brcmnand_soc so that the clock
>> can be disabled when the device is removed.
>> 
>> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
>> ---
>> On 22/11/15 21:59, Rob Herring wrote:
>>>>>> + * "brcm,nand-bcm63268"
>>>>>> + - compatible: should contain "brcm,nand-bcm<soc>", "brcm,nand-bcm63268"
>>>>
>>>> vendor,<soc>-device is preferred.
>> 
>> The existing two bindings use brcm,nand-<soc>, but I've changed this one.
> 
> Could we stick with the existing binding naming convention of using:
> 
> brcm,nand-<soc> just so automated tools or other things can match this
> one too, and +1 for consistency?

I could submit another patch renaming the existing bindings to
brcm,<soc>-nand, and add that to the drivers? Then they'd be consistent.

> Other than, that, same comment as Jonas, why do we we need the
> device_remove callback to be called from the main driver down to this one?

I'll add a "struct brcmnand_soc *brcmnand_get_socdata(struct device *)"
instead so that I can access the soc data before calling brcmnand_remove.

-- 
Simon Arlott
