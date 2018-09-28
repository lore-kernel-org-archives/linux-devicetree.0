Return-Path: <SRS0=qBHb=MK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35968 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729359AbeI1SCJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 28 Sep 2018 14:02:09 -0400
Subject: Re: [PATCH 0/4] Update dra7 dts to probe with ti-sysc
References: <20180927210542.69703-1-tony@atomide.com>
From: Keerthy <j-keerthy@ti.com>
Message-ID: <c67f54bb-8995-5d5b-053d-3caa25772b35@ti.com>
Date: Fri, 28 Sep 2018 17:08:41 +0530
MIME-Version: 1.0
In-Reply-To: <20180927210542.69703-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc: =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>, Tero Kristo <t-kristo@ti.com>
List-ID: <devicetree@vger.kernel.org>



On Friday 28 September 2018 02:35 AM, Tony Lindgren wrote:
> Hi all,
> 
> Here are four patches to make dra7 l4 devices to probe with ti-sysc
> driver similar to what we've already done for omap4. The related
> legacy hwmod platform data will be removed few merge cycles later.
> 
> I've only lightly tested these so far, but then again with this being
> SoC #4 to get converted things should be quite trivial now.
> 
> These are based on v4.19-rc5 merged with my omap-for-v4.20/dt branch
> plus the following additional series of patches:
> 
> [PATCH 00/11] clk: ti: clkctrl data split based on clkdm boundaries
> [PATCH 0/3] ARM: dts: am3/am4/dra7 clkctrl data conversion
> [PATCH 0/4] TI sysc driver updates for am335x and am437x
> [PATCH 0/4] Update am437x and am335x dts to probe with ti-sysc
> [PATCH] i2c: omap: Use noirq system sleep pm ops to idle device for suspend
> 
> At least v4.19-rc3 is needed for commit 18eb8aea7fb2 ("net: ethernet:
> cpsw-phy-sel: prefer phandle for phy sel") and omap-for-v4.20/dt
> is needed to avoid conflicts with clean-up.
> 
> I've also pushed out a new temporary branch for people to test as
> as omap-for-v4.20/dt-ti-sysc-tmp-testing-v2 [0][1].
> 
> Regards,
> 
> Tony
> 
> [0] git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git omap-for-v4.20/dt-ti-sysc-tmp-testing-v2
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git/log/?h=omap-for-v4.20/dt-ti-sysc-tmp-testing-v2

Hey Tony,

I tried [1]. I see gpio throwing some errors while suspending:

https://pastebin.ubuntu.com/p/92qbWh4rgW/

[   64.610205] omap_gpio 44e07000.gpio: sysc_child_suspend_noirq busy at
1257: -16
[   64.612509] omap_gpio 48320000.gpio: sysc_child_suspend_noirq busy at
1257: -16
[   64.612754] omap_gpio 481ae000.gpio: sysc_child_suspend_noirq busy at
1257: -16

Regards,
Keerthy
> 
> Tony Lindgren (4):
>   bus: ti-sysc: Detect timer and gpio on dra7
>   bus: ti-sysc: Detect devices for debug on dra7
>   ARM: dts: dra7: Add l4 interconnect hierarchy and ti-sysc data
>   ARM: dts: dra7: Move l4 child devices to probe them with ti-sysc
> 
