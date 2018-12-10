Return-Path: <SRS0=EUt7=OT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:57114 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726392AbeLJQV1 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 10 Dec 2018 11:21:27 -0500
Date: Mon, 10 Dec 2018 08:21:23 -0800
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] ARM: dts: Add am335x mcasp with l3 data port ranges
Message-ID: <20181210162123.GC6707@atomide.com>
References: <20181205230356.38855-1-tony@atomide.com>
 <3f44b350-17a9-bdf7-33b4-130b6eeae5f0@ti.com>
 <48ee14e0-1361-4840-42c6-f676f2911ce6@ti.com>
 <20181210144851.GZ6707@atomide.com>
 <20181210154426.GB6707@atomide.com>
 <7e50de23-10d3-511b-a16d-4c32ba58a842@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e50de23-10d3-511b-a16d-4c32ba58a842@ti.com>
Sender: devicetree-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-omap@vger.kernel.org, Tero Kristo <t-kristo@ti.com>, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

* Peter Ujfalusi <peter.ujfalusi@ti.com> [181210 16:13]:
> Tony,
> 
> On 10/12/2018 17.44, Tony Lindgren wrote:
> > * Tony Lindgren <tony@atomide.com> [181210 14:49]:
> >> * Peter Ujfalusi <peter.ujfalusi@ti.com> [181210 09:52]:
> >>> On 10/12/2018 9.05, Peter Ujfalusi wrote:
> >>>> Works fine on bbb + audio cape.
> >>>> For some reason my am335x-evm-sk is not booting up at all w/ linux-next,
> >>>> but I believe it is not related to this (disabled audio and still not
> >>>> booting).
> >>>
> >>> bisect on next-20181207 (am335x-evm-sk) points to:
> >>> Author: Tony Lindgren <tony@atomide.com>
> >>> 87fc89ced3a78f7f0845afab1934d509ef4ad0f2
> >>> ARM: dts: am335x: Move l4 child devices to probe them with ti-sysc
> >>>
> >>> when looking for the non booting of am335x-evm-sk (nothing printed on
> >>> serial after stating kernel).
> >>
> >> OK I'm pretty sure this is because we now need to move the gpio1
> >> ti,no-reset-on-init up to the module level because of the DDR being
> >> GPIO controlled. I'll send a patch out shortly for that.
> >>
> >> It might be also worth adding a check for having ti,no-reset-on-init
> >> at the child level to ti-sysc driver too.
> > 
> > Looks like we have quite a few boards variants with probably
> > DDR powered by a gpio1 pin. So let's fix the ti-sysc driver first,
> > care to try the following patch?
> 
> am335x-evmsk is still not booting with this patch on top of next-20181210.

Oh interesting.

> Fwiw 'git grep ti,no-reset-on-idle' yields no results...
> Where it should be?

Sorry it should be ti,no-reset-on-init.

Regards,

Tony
