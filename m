Return-Path: <SRS0=RDbo=FO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from anchovy3.45ru.net.au ([203.30.46.155]:44738 "EHLO
        anchovy3.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932267AbeBTBM2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 19 Feb 2018 20:12:28 -0500
Subject: Re: [PATCH v4 3/3] pinctrl: mcp23s08: add open drain configuration
 for irq output
References: <1519032320-103817-1-git-send-email-preid@electromag.com.au>
 <1519032320-103817-4-git-send-email-preid@electromag.com.au>
 <56c7f046-21af-4105-a2a0-1a79ceda2858@cesnet.cz>
From: Phil Reid <preid@electromag.com.au>
Message-ID: <5e9a306c-c2da-3c7b-8fe6-52588ba4c898@electromag.com.au>
Date: Tue, 20 Feb 2018 09:12:21 +0800
MIME-Version: 1.0
In-Reply-To: <56c7f046-21af-4105-a2a0-1a79ceda2858@cesnet.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: =?UTF-8?Q?Jan_Kundr=c3=a1t?= <jan.kundrat@cesnet.cz>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, sre@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 20/02/2018 05:43, Jan Kundrát wrote:
> Thanks for looking into this.
> 
> Is there a reason why the DT documentation is updated in a separate commit?
> 
>>      if ((status & IOCON_SEQOP) || !(status & IOCON_HAEN) || mirror ||
>> -         mcp->irq_active_high) {
>> +         mcp->irq_active_high || open_drain) {
> 
> This `if` is getting quite complex. I don't think that saving one SPI write transaction is worth the effort here. What about just setting the chip to a 
> known-good state unconditionally by removing that `if`?
> 
> The condition also looks wrong to me (as-is in the kernel now). If the chip is somehow configured to use active-high IRQ and the DT does not ask for either 
> active-high or open-drain IRQ, then the reconfiguration gets skipped and the chip runs with wrong settings.

I agree, I don't think we should be preserving any of the bits in the chip config.
But I think we need that as a separate patch for people to mull over.

> 
>>          /* mcp23s17 has IOCON twice, make sure they are in sync */
>>          status &= ~(IOCON_SEQOP | (IOCON_SEQOP << 8));
>>          status |= IOCON_HAEN | (IOCON_HAEN << 8);
>> @@ -898,6 +900,9 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
>>          if (mirror)
>>              status |= IOCON_MIRROR | (IOCON_MIRROR << 8);
>>
>> +        if (open_drain)
>> +            status |= IOCON_ODR | (IOCON_ODR << 8);
>> +
>>          if (type == MCP_TYPE_S18 || type == MCP_TYPE_018)
>>              status |= IOCON_INTCC | (IOCON_INTCC << 8);
> 
> I think that it would be better to explicitly error out if irq_active_high and open_drain are both set. When I sent my attempt at this, I did it like this:

Which is something I want to do. As I've got a inverter in between :)
For the mcp the open-drain config bit takes precedence over active-high.
Really needs to be fixed by fixing up the irq request, but I still haven't got a good
fix for the irq request polarity based on active-high in this driver.
I can't see how to fix it without breaking existing dt interface.


> 
> +        if (irq_active_high && irq_open_drain) {
> +            dev_err(dev, "microchip,irq-open-drain and "
> +                "drive-active-high are mutually exclusive\n");
> +            ret = -EINVAL;
> +            goto fail;
> +        } else if (irq_active_high) {
> +            ...
> +        } else if (irq_open_drain) {
> +            ...
> +        }
> 
> But anyway, even as-is, the patch is a net improvement, so:
> 
> Reviewed-by: Jan Kundrát <jan.kundrat@cesnet.cz>
> 
> With kind regards,
> Jan
> 
> 


-- 
Regards
Phil Reid
