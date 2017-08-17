From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv2 0/3] arm64 xilinx zynqmp firmware interface
Date: Thu, 17 Aug 2017 08:10:33 +0200
Message-ID: <89e5469b-650e-64c7-1754-797b35bac523@xilinx.com>
References: <cover.1502886277.git.michal.simek@xilinx.com>
 <43deeed7-32c8-7914-5f44-862ebbe14a3b@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <43deeed7-32c8-7914-5f44-862ebbe14a3b-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: edgar.iglesias-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>, Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Kevin Brodsky <kevin.brodsky-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Moritz Fischer <mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 16.8.2017 17:39, Marc Zyngier wrote:
> On 16/08/17 13:24, Michal Simek wrote:
>> Hi,
>>
>> xilinx is using this interface for very long time and we can't merge our
>> driver changes to Linux because of missing communication layer with
>> firmware. This interface was developed before scpi and scmi was
>> available. In connection to power management scpi and scmi are missing
>> pieces which we already use. There is a separate discussion how to
>> extend scmi to support all our use cases.
> 
> So maybe we should wait and see where this discussion is going before we
> merge yet another firmware interface?

It will take a lot of time when this discussion ends and I can't see any
benefit to hold all


>> This simply patch is not adding any power management features but only
>> adding minimum functionality which are needed for drivers.
> 
> I don't get it. 600 lines of firmware interface that isn't used by
> anything? Or is it? Needed by which driver?

I can send that drivers for review. pinctrl, fpga manager, nvmem driver,
clock, serdes phy and reset drivers.
But this driver need to come first because they depend on this.

Thanks,
Michal

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
