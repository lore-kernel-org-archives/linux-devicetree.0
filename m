Return-Path: <SRS0=gCiJ=LV=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:55588 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726605AbeIGWRi (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 7 Sep 2018 18:17:38 -0400
Date: Fri, 7 Sep 2018 10:35:36 -0700
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] ARM: dts: Fix omap l4per idling with wlcore   edge
 sensitive interrupt
Message-ID: <20180907173536.GR5662@atomide.com>
References: <8665E2433BC68541A24DFFCA87B70F5B3646AF81@DFRE01.ent.ti.com>
 <20171015162230.GU4394@atomide.com>
 <20171015221536.ybe7x52tenocel6c@lenoch>
 <20171016140147.GV4394@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171016140147.GV4394@atomide.com>
Sender: devicetree-owner@vger.kernel.org
To: Ladislav Michl <ladis@linux-mips.org>
Cc: "Reizer, Eyal" <eyalr@ti.com>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Gerlach, Dave" <d-gerlach@ti.com>, "Strashko, Grygorii" <grygorii.strashko@ti.com>, Kalle Valo <kvalo@codeaurora.org>, "Menon, Nishanth" <nm@ti.com>, "Kristo, Tero" <t-kristo@ti.com>
List-ID: <devicetree@vger.kernel.org>

* Tony Lindgren <tony@atomide.com> [171016 14:03]:
> * Ladislav Michl <ladis@linux-mips.org> [171015 15:16]:
> > On Sun, Oct 15, 2017 at 09:22:31AM -0700, Tony Lindgren wrote:
> > > * Reizer, Eyal <eyalr@ti.com> [171014 23:55]:
> > > > > From: Tony Lindgren [mailto:tony@atomide.com]
> > > > > 
> > > > > On omaps, if the wlcore interrupt is configured as level instead of edge,
> > > > > L4PER will stop doing hardware based idling after ifconfig wlan0 down is
> > > > > done and the WL_EN line is pulled down.
> > > > > 
> > > > Do we understand why omap is doing this? Is it a bug or a normal behavior?

Just to document this, it looks like the gpio wake events
behave in a different way on omap4 and later. We must only
keep waken register configured during idle on omap4 and have
edge and level registers cleared to prevent the gpio from
keeping clocks on and blocking idle.

I'll be posting a proper fix for this at some point after
some more testing and cleaning up my patch.

Regards,

Tony
