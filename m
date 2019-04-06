Return-Path: <SRS0=CEXC=SI=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:44606 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726475AbfDFQmS (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 6 Apr 2019 12:42:18 -0400
Date: Sat, 6 Apr 2019 09:42:14 -0700
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v2 1/6] ARM: dts: am33xx: Added macros for numeric pinmux
 addresses
Message-ID: <20190406164214.GH49658@atomide.com>
References: <20190314150524.GB19425@atomide.com>
 <20190402160949.14190-1-cquast@hanoverdisplays.com>
 <20190402160949.14190-2-cquast@hanoverdisplays.com>
 <5ca841f3.1c69fb81.e8386.644f@mx.google.com>
 <CAHCN7xLwva4F6NdH=Ljbz_K3jG11zC=xiyCjp=+XyP3f0-vAwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xLwva4F6NdH=Ljbz_K3jG11zC=xiyCjp=+XyP3f0-vAwg@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Adam Ford <aford173@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Christina Quast <cquast@hanoverdisplays.com>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Benoit Cousson <bcousson@baylibre.com>, Linux-OMAP <linux-omap@vger.kernel.org>, Russell King <linux@armlinux.org.uk>
List-ID: <devicetree@vger.kernel.org>

Hi,

* Adam Ford <aford173@gmail.com> [190406 11:30]:
> Is this something you want done for the omap3 as well?  If this get's
> pulled in for am33xx, I can work on doing it for omap3 unless someone
> else already is.

Sure.. There are few things to consider for omap3 though.

The padconf modes are different between various SoC
revisions. I think the base register range should be
the same though. This can be checked in git history
with something like:

$ git show 195c7a52b76d:arch/arm/mach-omap2/mux34xx.c

and

$ git show 195c7a52b76d:arch/arm/mach-omap2/mux34xx.h

So probably as long as we only define the register name,
and not the mode names, we should be good to go.

And making the macro use separate pinconf and mode values
would make things easier eventually to switch to use
#pinctrl-cells = <2> instead of <1> later on.

Regards,

Tony
