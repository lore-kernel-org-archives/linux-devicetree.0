From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH] irqchip: add support for Marvell Orion SoCs
Date: Thu, 02 May 2013 21:34:30 +0200
Message-ID: <5182BFC6.3070709@gmail.com>
References: <1367519104-19677-1-git-send-email-sebastian.hesselbarth@gmail.com> <20130502185322.GA29333@obsidianresearch.com> <201305022111.41043.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <201305022111.41043.arnd@arndb.de>
Sender: linux-doc-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Andrew Lunn <andrew@lunn.ch>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Jean-Francois Moine <moinejf@free.fr>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/02/2013 09:11 PM, Arnd Bergmann wrote:
> On Thursday 02 May 2013, Jason Gunthorpe wrote:
>>> +static struct of_device_id orion_irq_dt_ids[] __initconst = {
>>> +     { .compatible = "marvell,orion-mpic", .data = orion_of_init },
>>> +     { }
>>
>> Is there a strong reason to change the compatible string? Looks to me
>> like either the new driver or the old driver will bind depending on
>> what is in the machine description. No need for a new string?
>>
>
> The compatible string should change if the binding changes in an
> incomptible way, and we should try not to change it unless it's
> fundamentally flawed.

Well, there is no _fundamental_ change in the binding syntax as it
is only reg, interrupts, and clocks. But there is a semantic change
in reg properties, as current orion irq controller wants the mask
registers (0x04,0x08) only while this also needs cause register
(0x00).

Nothing that couldn't be handled while moving Orion arch to irqchip
but if there are no further objections, I'd like to stick with the new
compatible string - also having orion-spic in mind.

Sebastian
