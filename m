From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCHv2 0/3] arm64 xilinx zynqmp firmware interface
Date: Thu, 17 Aug 2017 08:52:27 +0100
Message-ID: <a1970cb5-1cf1-d38a-3de3-c782c23fc8ac@arm.com>
References: <cover.1502886277.git.michal.simek@xilinx.com>
 <43deeed7-32c8-7914-5f44-862ebbe14a3b@arm.com>
 <89e5469b-650e-64c7-1754-797b35bac523@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <89e5469b-650e-64c7-1754-797b35bac523@xilinx.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Cc: edgar.iglesias@xilinx.com, Rob Herring <robh@kernel.org>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, Jean Delvare <jdelvare@suse.de>, Dinh Nguyen <dinguyen@opensource.altera.com>, Rob Herring <robh+dt@kernel.org>, Tero Kristo <t-kristo@ti.com>, Catalin Marinas <catalin.marinas@arm.com>, Olof Johansson <olof@lixom.net>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Kevin Hilman <khilman@baylibre.com>, Nishanth Menon <nm@ti.com>, Thierry Reding <treding@nvidia.com>, Kevin Brodsky <kevin.brodsky@arm.com>, Will Deacon <will.deacon@arm.com>, devicetree@vger.kernel.org, Alexander Graf <agraf@suse.de>, Sudeep Holla <sudeep.holla@arm.com>, Moritz Fischer <mdf@kernel.org>, Michal Simek <monstr@monstr.eu>
List-Id: devicetree@vger.kernel.org

On 17/08/17 07:10, Michal Simek wrote:
> On 16.8.2017 17:39, Marc Zyngier wrote:
>> On 16/08/17 13:24, Michal Simek wrote:
>>> Hi,
>>>
>>> xilinx is using this interface for very long time and we can't merge our
>>> driver changes to Linux because of missing communication layer with
>>> firmware. This interface was developed before scpi and scmi was
>>> available. In connection to power management scpi and scmi are missing
>>> pieces which we already use. There is a separate discussion how to
>>> extend scmi to support all our use cases.
>>
>> So maybe we should wait and see where this discussion is going before we
>> merge yet another firmware interface?
> 
> It will take a lot of time when this discussion ends and I can't see any
> benefit to hold all

Well, so far, the benefit of this series is exactly nil, as the code it
brings is *unused*. It is impossible to review in isolation.

In the meantime, you can continue finding out how *not* to have to merge
this code, and instead focus on using the infrastructure we already
have, or at least influence the infrastructure that is being designed.
It will be much better than dumping yet another slab of "I'm so
different" code that is going to ultimately bitrot.

> 
> 
>>> This simply patch is not adding any power management features but only
>>> adding minimum functionality which are needed for drivers.
>>
>> I don't get it. 600 lines of firmware interface that isn't used by
>> anything? Or is it? Needed by which driver?
> 
> I can send that drivers for review. pinctrl, fpga manager, nvmem driver,
> clock, serdes phy and reset drivers.
> But this driver need to come first because they depend on this.
My take is: no users, no use.

And if you need to hack all these drivers to hook into your specific
firmware interface, I feel that you're doing it wrong. We have common
APIs for device drivers. If these APIs are not good enough, we extend
them. But designing drivers for a given firmware interface?

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
