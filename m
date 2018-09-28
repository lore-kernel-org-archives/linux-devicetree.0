Return-Path: <SRS0=qBHb=MK=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:57682 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726045AbeI2AVk (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 28 Sep 2018 20:21:40 -0400
Date: Fri, 28 Sep 2018 10:56:43 -0700
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 0/4] Update dra7 dts to probe with ti-sysc
Message-ID: <20180928175643.GL5662@atomide.com>
References: <20180927210542.69703-1-tony@atomide.com>
 <c67f54bb-8995-5d5b-053d-3caa25772b35@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c67f54bb-8995-5d5b-053d-3caa25772b35@ti.com>
Sender: devicetree-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: linux-omap@vger.kernel.org, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, devicetree@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>, Tero Kristo <t-kristo@ti.com>
List-ID: <devicetree@vger.kernel.org>

* Keerthy <j-keerthy@ti.com> [180928 11:43]:
> I tried [1]. I see gpio throwing some errors while suspending:
> 
> https://pastebin.ubuntu.com/p/92qbWh4rgW/
> 
> [   64.610205] omap_gpio 44e07000.gpio: sysc_child_suspend_noirq busy at
> 1257: -16
> [   64.612509] omap_gpio 48320000.gpio: sysc_child_suspend_noirq busy at
> 1257: -16
> [   64.612754] omap_gpio 481ae000.gpio: sysc_child_suspend_noirq busy at
> 1257: -16

Thanks for testing :) Yeah I'm seeing those warnings too, the system
came up just fine from resume right?

With the gpio notifier changes we now only idle gpio interrupts
from the notifier so in general those warnings are harmless. We
should probably just make these warnings dev_dbg now.

Those warnings should only appear for gpio instances with interrupts
as in grep gpio /proc/interrupts. And we only idle those gpio banks
if a deeper idle state is entered, which is not the case for dra7.

I'm mostly worried that all the devices work as before on dra7
though, like LCD, USB, SATA and so on..

Regards,

Tony
