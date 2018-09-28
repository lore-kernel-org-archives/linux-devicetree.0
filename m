Return-Path: <SRS0=qBHb=MK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:57790 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727181AbeI2E6p (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 29 Sep 2018 00:58:45 -0400
Date: Fri, 28 Sep 2018 15:32:50 -0700
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 0/4] Update dra7 dts to probe with ti-sysc
Message-ID: <20180928223250.GQ5662@atomide.com>
References: <20180927210542.69703-1-tony@atomide.com>
 <c67f54bb-8995-5d5b-053d-3caa25772b35@ti.com>
 <20180928175643.GL5662@atomide.com>
 <a851a00d-a0da-f46c-a6d4-d0dd2481a165@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a851a00d-a0da-f46c-a6d4-d0dd2481a165@ti.com>
Sender: devicetree-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Keerthy <j-keerthy@ti.com>, linux-omap@vger.kernel.org, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>, Tero Kristo <t-kristo@ti.com>
List-ID: <devicetree@vger.kernel.org>

* Grygorii Strashko <grygorii.strashko@ti.com> [180928 21:35]:
> 
> 
> On 09/28/2018 12:56 PM, Tony Lindgren wrote:
> > * Keerthy <j-keerthy@ti.com> [180928 11:43]:
> >> I tried [1]. I see gpio throwing some errors while suspending:
> >>
> >> https://pastebin.ubuntu.com/p/92qbWh4rgW/
> >>
> >> [   64.610205] omap_gpio 44e07000.gpio: sysc_child_suspend_noirq busy at
> >> 1257: -16
> >> [   64.612509] omap_gpio 48320000.gpio: sysc_child_suspend_noirq busy at
> >> 1257: -16
> >> [   64.612754] omap_gpio 481ae000.gpio: sysc_child_suspend_noirq busy at
> >> 1257: -16
> > 
> > Thanks for testing :) Yeah I'm seeing those warnings too, the system
> > came up just fine from resume right?
> > 
> > With the gpio notifier changes we now only idle gpio interrupts
> > from the notifier so in general those warnings are harmless. We
> > should probably just make these warnings dev_dbg now.
> > 
> > Those warnings should only appear for gpio instances with interrupts
> > as in grep gpio /proc/interrupts. And we only idle those gpio banks
> > if a deeper idle state is entered, which is not the case for dra7.
> > 
> > I'm mostly worried that all the devices work as before on dra7
> > though, like LCD, USB, SATA and so on..
> 
> This is suspend, not idle and there is difference between omap_device and 
> ti-sysc (not all ti-sysc nodes works in legacy mode as you have hwmod props in DT:
> 
> sysc_child_suspend_noirq()
> 	if (!pm_runtime_status_suspended(dev)) {
> 		error = pm_generic_runtime_suspend(dev);
> 		if (error) {
> 			dev_warn(dev, "%s busy at %i: %i\n",
> 				 __func__, __LINE__, error);
> ^^^ with your recent gpio changes this case will be hit for gpio banks
> with irs enabled always.
> 
> 			return 0;
> 		}
> 
> omap_device:
> 
> 	ret = pm_generic_suspend_noirq(dev);
> 
> 	if (!ret && !pm_runtime_status_suspended(dev)) {
> 		if (pm_generic_runtime_suspend(dev) == 0) {
> ^^ will be silent in the same case
> 
> 			omap_device_idle(pdev);
> 			od->flags |= OMAP_DEVICE_SUSPENDED;
> 		}
> 	}
> 
> So, may be you can change dev_warn() -> dev_dbg().

Yeah here's the patch to do that.

Regards,

Tony

8< ------------------------
>From tony Mon Sep 17 00:00:00 2001
From: Tony Lindgren <tony@atomide.com>
Date: Fri, 28 Sep 2018 15:21:50 -0700
Subject: [PATCH] bus: ti-sysc: Make some warnings debug only

We're currently warning about busy children on suspend in
sysc_child_suspend_noirq() but the legacy code omap_device does
not do that. Let's just make it dev_dbg() instead of dev_warn().

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/bus/ti-sysc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1253,8 +1253,8 @@ static int sysc_child_suspend_noirq(struct device *dev)
 	if (!pm_runtime_status_suspended(dev)) {
 		error = pm_generic_runtime_suspend(dev);
 		if (error) {
-			dev_warn(dev, "%s busy at %i: %i\n",
-				 __func__, __LINE__, error);
+			dev_dbg(dev, "%s busy at %i: %i\n",
+				__func__, __LINE__, error);
 
 			return 0;
 		}
-- 
2.19.0
