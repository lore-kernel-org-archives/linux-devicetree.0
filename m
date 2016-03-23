From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2 03/11] ARM: davinci: da850: use clk->set_parent for
 async3
Date: Wed, 23 Mar 2016 22:59:35 +0530
Message-ID: <56F2D27F.6040001@ti.com>
References: <1458181615-27782-1-git-send-email-david@lechnology.com>
 <1458181615-27782-4-git-send-email-david@lechnology.com>
 <56F2BCAB.3040404@ti.com> <56F2D05C.8030909@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56F2D05C.8030909@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: Petr Kulhavy <petr@barix.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kevin Hilman <khilman@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bin Liu <b-liu@ti.com>, Robert Jarzmik <robert.jarzmik@free.fr>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, Tony Lindgren <tony@atomide.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 23 March 2016 10:50 PM, David Lechner wrote:
> On 03/23/2016 10:56 AM, Sekhar Nori wrote:
>> On Thursday 17 March 2016 07:56 AM, David Lechner wrote:
>>> The da850 family of processors has an async3 clock domain that can be
>>> muxed to either pll0_sysclk2 or pll1_sysclk2. Now that the davinci
>>> clocks
>>> have a set_parent callback, we can use this to control the async3 mux
>>> instead of a stand-alone function.
>>>
>>> This adds a new async3_clk and sets the appropriate child clocks. The
>>> default is use to pll1_sysclk2 since it is not affected by processor
>>> frequency scaling.
>>>
>>> Signed-off-by: David Lechner <david@lechnology.com>
>>> ---
>>
>>> +static int da850_async3_set_parent(struct clk *clk, struct clk *parent)
>>> +{
>>> +    u32 __iomem *cfgchip3;
>>> +    u32 val;
>>> +
>>> +    /*
>>> +     * Can't use DA8XX_SYSCFG0_VIRT() here since this can be called
>>> before
>>> +     * da8xx_syscfg0_base is initialized.
>>> +     */
>>> +    cfgchip3 = ioremap(DA8XX_SYSCFG0_BASE + DA8XX_CFGCHIP3_REG, 4);
>>
>> Is this just a theoretical possibility or have you seen this happen? I
>> would like to see if there are ways of avoiding this rather than throw
>> away usage of DA8XX_SYSCFG0_VIRT()
> 
> Yes, it will not boot without this. The problem comes from the fact that
> clocks are setup in davinci_common_init() which is called before
> da8xx_syscfg0_base = ioremap(DA8XX_SYSCFG0_BASE, SZ_4K) in da850_init()
> (and da830_init()). I also tried moving the ioremap() before
> davinci_common_init(), but davinci_common_init() sets up the iomem, so
> that doesn't work either.
> 
> So, if you want to use DA8XX_SYSCFG0_VIRT() here, the clock init would
> have to be split out from davinci_common_init() which would affect all
> davinci devices.

Alright, I guess 'can be called' in the comment should have used
stronger language :) How about late registration of USB clocks as I
suggested. It should also help consolidate code across da830 and da850.

Thanks,
Sekhar
