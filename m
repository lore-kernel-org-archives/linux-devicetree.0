Return-Path: <SRS0=Bz/z=T7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from lelv0142.ext.ti.com ([198.47.23.249]:34080 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfEaMEi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 May 2019 08:04:38 -0400
Subject: Re: [PATCH] clk: ti: clkctrl: Fix returning uninitialized data
References: <20190530065557.42741-1-tony@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <47c47d4f-54fe-956d-7936-eb4bc651c464@ti.com>
Date: Fri, 31 May 2019 15:04:26 +0300
MIME-Version: 1.0
In-Reply-To: <20190530065557.42741-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Tero Kristo <t-kristo@ti.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-ID: <devicetree@vger.kernel.org>

On 30/05/2019 09:55, Tony Lindgren wrote:
> If we do a clk_get() for a clock that does not exists, we have
> _ti_omap4_clkctrl_xlate() return uninitialized data if no match
> is found. This can be seen in some cases with SLAB_DEBUG enabled:
> 
> Unable to handle kernel paging request at virtual address 5a5a5a5a
> ...
> clk_hw_create_clk.part.33
> sysc_notifier_call
> notifier_call_chain
> blocking_notifier_call_chain
> device_add
> 
> Let's fix this by setting a found flag only when we find a match.
> 
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reported-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Fixes: 88a172526c32 ("clk: ti: add support for clkctrl clocks")
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   drivers/clk/ti/clkctrl.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

I can boot again with this fix, thanks!

Tested-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
