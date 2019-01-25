Return-Path: <SRS0=ySGx=QB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:35504 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729115AbfAYQxK (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 25 Jan 2019 11:53:10 -0500
Date: Fri, 25 Jan 2019 08:53:07 -0800
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] ARM: dts: omap4-droid4: Fix typo in cpcap IRQ flags
Message-ID: <20190125165307.GW5720@atomide.com>
References: <20190107175907.45268-1-tony@atomide.com>
 <20190125162814.GA7571@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20190125162814.GA7571@amd>
Sender: devicetree-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-omap@vger.kernel.org, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, devicetree@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
List-ID: <devicetree@vger.kernel.org>

* Pavel Machek <pavel@ucw.cz> [190125 16:28]:
> Hi!
> 
> > We're now getting the following error:
> > 
> > genirq: Setting trigger mode 1 for irq 230 failed
> > (regmap_irq_set_type+0x0/0x15c)
> > cpcap-usb-phy cpcap-usb-phy.0: could not get irq dp: -524
> > 
> > This is because of a typo in the irq flags. Really these interrupts
> > are LEVEL, but before we change them we need to test them. So let's
> > do a minimal fix first.
> 
> Could we get this one applied? It is regression fix for 5.0-rc1...

Yes thanks for reminding me, was planning to send off
the first set earlier but got hit with more regressions
and delays. Anyways, I just sent a pull request for
the dts regressions.

Regards,

Tony
