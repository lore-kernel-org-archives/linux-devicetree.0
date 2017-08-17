From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv2 0/3] arm64 xilinx zynqmp firmware interface
Date: Thu, 17 Aug 2017 10:42:54 +0200
Message-ID: <0560c79f-e461-6010-0628-e99ce0a1f8c6@xilinx.com>
References: <cover.1502886277.git.michal.simek@xilinx.com>
 <43deeed7-32c8-7914-5f44-862ebbe14a3b@arm.com>
 <89e5469b-650e-64c7-1754-797b35bac523@xilinx.com>
 <a1970cb5-1cf1-d38a-3de3-c782c23fc8ac@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a1970cb5-1cf1-d38a-3de3-c782c23fc8ac-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: edgar.iglesias-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Kevin Brodsky <kevin.brodsky-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 17.8.2017 09:52, Marc Zyngier wrote:
> On 17/08/17 07:10, Michal Simek wrote:
>> On 16.8.2017 17:39, Marc Zyngier wrote:
>>> On 16/08/17 13:24, Michal Simek wrote:
>>>> Hi,
>>>>
>>>> xilinx is using this interface for very long time and we can't merge our
>>>> driver changes to Linux because of missing communication layer with
>>>> firmware. This interface was developed before scpi and scmi was
>>>> available. In connection to power management scpi and scmi are missing
>>>> pieces which we already use. There is a separate discussion how to
>>>> extend scmi to support all our use cases.
>>>
>>> So maybe we should wait and see where this discussion is going before we
>>> merge yet another firmware interface?
>>
>> It will take a lot of time when this discussion ends and I can't see any
>> benefit to hold all
> 
> Well, so far, the benefit of this series is exactly nil, as the code it
> brings is *unused*. It is impossible to review in isolation.
> 

Ok. I will add others drivers to this series that's not a problem.

> In the meantime, you can continue finding out how *not* to have to merge
> this code, and instead focus on using the infrastructure we already
> have, or at least influence the infrastructure that is being designed.
> It will be much better than dumping yet another slab of "I'm so
> different" code that is going to ultimately bitrot.

I am happy to look the better proposed way. SCPI is ancient and SCMI is
replacement and not merged yet. We already had a call with arm and
Sudeep was on it too where outcome from that was that we can't use that
because it doesn't support what we need to support now.

This code is compatible with current ARM SMC calling convention which
allocate range for vendors.

0xC2000000-0xC200FFFF SMC64: SiP Service Calls

Provides interfaces to SoC implementation-specific services on this
platform, for example secure platform initialization, configuration
, and some power control services.

> 
>>
>>
>>>> This simply patch is not adding any power management features but only
>>>> adding minimum functionality which are needed for drivers.
>>>
>>> I don't get it. 600 lines of firmware interface that isn't used by
>>> anything? Or is it? Needed by which driver?
>>
>> I can send that drivers for review. pinctrl, fpga manager, nvmem driver,
>> clock, serdes phy and reset drivers.
>> But this driver need to come first because they depend on this.
> My take is: no users, no use.
> 
> And if you need to hack all these drivers to hook into your specific
> firmware interface, I feel that you're doing it wrong. We have common
> APIs for device drivers. If these APIs are not good enough, we extend
> them. But designing drivers for a given firmware interface?

Let me send that users of this.

Thanks,
Michal

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
