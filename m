Return-Path: <SRS0=87Xd=TQ=atomide.com=tony@kernel.org>
Date: Thu, 16 May 2019 09:58:24 -0700
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 2/2] arm: dts: dra76-evm: Disable rtc target module
Message-ID: <20190516165824.GD5447@atomide.com>
References: <20190516090657.25211-1-j-keerthy@ti.com>
 <20190516090657.25211-2-j-keerthy@ti.com>
 <20190516161256.GB5447@atomide.com>
 <f3c2a6cd-b478-cec4-cde6-3eb5b6a11392@ti.com>
 <20190516164729.GC5447@atomide.com>
 <f2470149-0a17-cd1a-30d3-288fe2b821e3@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2470149-0a17-cd1a-30d3-288fe2b821e3@ti.com>
To: keerthy <j-keerthy@ti.com>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-omap@vger.kernel.org, t-kristo@ti.com
List-ID: <devicetree@vger.kernel.org>

* keerthy <j-keerthy@ti.com> [190516 16:54]:
> On 5/16/2019 10:17 PM, Tony Lindgren wrote:
> > But then any new board with dra76 or dra71 will need to debug
> > the same issue again. Sure we can get away for now tweaking the
> > board file, but to me it sounds like it's going to be more
> > devices that will be affected too?
> 
> Okay. This is a SoC related issue so yes any new board will have to again
> implement disabling.

OK

> > Is there some feature matrix available somewhere online?
> 
> Not that i know of. I will try finding something.

OK thanks.

> > How about add minimal dra76 and dra71 dtsi files in addition to
> > the board specific fix(es)? Then for v5.3, we can deal adding more
> > dra7 specifc evm files using these dtsi files or dynamically start
> > disabling modules.
> 
> You mean having a dra76/dra71.dtsi with rtc/usb4_tm disabled and that gets
> included in dra76/dra71-evm.dts?

Yeah, add dra76.dtsi and dra71.dtsi, then include those.

If however you have the same evm dts file with multiple SoC variants
available, then for now you need to also disable devices in the
evm dts. Or add another evm dts file.

Regards,

Tony
