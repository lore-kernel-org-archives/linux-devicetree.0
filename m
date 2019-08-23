From: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 00/20] Initial support for Marvell MMP3 SoC
Date: Fri, 23 Aug 2019 10:42:52 +0100
Message-ID: <08a0e65e-4a80-f611-e36e-8e3f70fa8113@kernel.org>
References: <20190822092643.593488-1-lkundrak@v3.sk>
 <244fdc87-0fe5-be79-d9cd-2395d0ac3f57@kernel.org>
 <424d2881edcaf7cedbfa5cbbf2e73aaff5355df3.camel@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <424d2881edcaf7cedbfa5cbbf2e73aaff5355df3.camel@v3.sk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>, Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Kishon Vijay Abraham I <kishon@ti.com>, Russell King <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 23/08/2019 08:21, Lubomir Rintel wrote:
> On Thu, 2019-08-22 at 11:31 +0100, Marc Zyngier wrote:
>> On 22/08/2019 10:26, Lubomir Rintel wrote:
>>> Hi, 
>>>
>>> this is a second spin of a patch set that adds support for the Marvell
>>> MMP3 processor. MMP3 is used in OLPC XO-4 laptops, Panasonic Toughpad
>>> FZ-A1 tablet and Dell Wyse 3020 Tx0D thin clients. 
>>>
>>> Compared to v1, there's a handful of fixes in response to reviews. Patch
>>> 02/20 is new. Details in individual patches.
>>>  
>>> Apart from the adjustments in mach-mmp/, the patch makes necessary 
>>> changes to the irqchip driver and adds an USB2 PHY driver. The latter 
>>> has a dependency on the mach-mmp/ changes, so it can't be submitted 
>>> separately.
>>>  
>>> The patch set has been tested to work on Wyse Tx0D and not ruin MMP2 
>>> support on XO-1.75. 
>>
>> How do you want this series to be merged? I'm happy to take the irqchip
>> related patches as well as the corresponding DT change (once reviewed)
>> through my tree.
> 
> I was hoping for the Arm SoC tree, because there are some dependencies
> (MMP3 USB PHY depends on MMP3 SoC).
> 
> That said, the irqchip patches are rather independent and the only
> downside of them going in via a different tree will be that the other
> tree that will lack them won't boot on MMP3 (things will compile
> though). I don't know if that's okay. What's typically done in cases
> like these?

I usually take the irqchip patches that can be built standalone (without
dependency on header files, for example). If you want them to go via
another tree, stick my

	Acked-by: Marc Zyngier <maz@kernel.org>

on patches #6 through #9.

Thanks,

	M.
-- 
Jazz is not dead, it just smells funny...
