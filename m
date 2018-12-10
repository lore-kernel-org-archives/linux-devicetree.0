Return-Path: <SRS0=EUt7=OT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:57094 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727062AbeLJOu5 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 10 Dec 2018 09:50:57 -0500
Date: Mon, 10 Dec 2018 06:50:54 -0800
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] ARM: dts: Add am335x mcasp with l3 data port ranges
Message-ID: <20181210145054.GA6707@atomide.com>
References: <20181205230356.38855-1-tony@atomide.com>
 <3f44b350-17a9-bdf7-33b4-130b6eeae5f0@ti.com>
 <48ee14e0-1361-4840-42c6-f676f2911ce6@ti.com>
 <45fc55d2-8c8c-e831-cdaa-970d382a432f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45fc55d2-8c8c-e831-cdaa-970d382a432f@ti.com>
Sender: devicetree-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-omap@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

* Peter Ujfalusi <peter.ujfalusi@ti.com> [181210 13:45]:
> On 10/12/2018 11.53, Peter Ujfalusi wrote:
> > On 10/12/2018 9.05, Peter Ujfalusi wrote:
> > when looking for the non booting of am335x-evm-sk (nothing printed on
> > serial after stating kernel).
> > 
> > However there is another issue: the kernel boots, but ethernet is not
> > working in the kernel. That is pointing to:
> > Author: Tero Kristo <t-kristo@ti.com>
> > 69fd70c7ff31d3f00833c472c3994a02bb0ab287
> > ARM: dts: am33xx: convert to use new clkctrl layout
> > 
> > any idea what might causes these?
> 
> Things definitely go wrong at 69fd70c7ff31d3f00833c472c3994a02bb0ab287:
> 
> git checkout -b blah 69fd70c7ff31d3f00833c472c3994a02bb0ab287
> # can not mount the rootfs via nfs
> 
> git revert 69fd70c7ff31d3f00833c472c3994a02bb0ab287
> # boots up via nfs rootfs.
> 
> At commit 69fd70c7ff31d3f00833c472c3994a02bb0ab287 the bbb is not
> booting via nfs rootfs either.
> 
> Can not find where the ethernet started to work after these on bbb, but
> it does work on top of next-20181207.

Tero do you have any ideas on this one? Maybe a missing optional clock
somewhere?

Regards,

Tony
