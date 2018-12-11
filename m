Return-Path: <SRS0=IqaF=OU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:57358 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726690AbeLKOUv (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 11 Dec 2018 09:20:51 -0500
Date: Tue, 11 Dec 2018 06:20:47 -0800
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] ARM: dts: am33xx-l4: Fix epwmssX/ecapX/ehrpwmX ranges
 and reg
Message-ID: <20181211142047.GN6707@atomide.com>
References: <20181211105430.4359-1-peter.ujfalusi@ti.com>
 <d460a896-660a-abf0-90e4-4ced81fd7aba@ti.com>
 <dea21560-3e1f-5158-9fb0-3fedd0044a0a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dea21560-3e1f-5158-9fb0-3fedd0044a0a@ti.com>
Sender: devicetree-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Vignesh R <vigneshr@ti.com>, bcousson@baylibre.com, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, t-kristo@ti.com, jsarha@ti.com
List-ID: <devicetree@vger.kernel.org>

* Peter Ujfalusi <peter.ujfalusi@ti.com> [181211 11:00]:
> 
> 
> On 11/12/2018 13.00, Vignesh R wrote:
> > 
> > 
> > On 11/12/18 4:24 PM, Peter Ujfalusi wrote:
> >> Correct the ranges for epwmsX nodes and the reg for the subnodes.
> >>
> >> Fixes: 87fc89ced3a78 ("ARM: dts: am335x: Move l4 child devices to probe them with ti-sysc")
> >>
> >> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> >> ---
> >> Hi Tony,
> >>
> >> with this patch am335x-evmsk LCD is working.
> >>
> > 
> > I guess Tony has already posted a patch: https://patchwork.kernel.org/patch/10722671/
> 
> Yep, I just noticed it, this can be ignored.

OK. In the long run we can just leave out the extra parent module
for epwmss as it just probes the children. But let's do that later
for v4.22 as clean-up, I did some initial patches for that yesterday.

Regards,

Tony
