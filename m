Return-Path: <SRS0=bwDs=SK=atomide.com=tony@kernel.org>
Date: Mon, 8 Apr 2019 10:04:21 -0700
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v2 0/6] ARM: dts: am335x: Replace numeric pinmux address
 with macro defines
Message-ID: <20190408170420.GK49658@atomide.com>
References: <20190314150524.GB19425@atomide.com>
 <20190402160949.14190-1-cquast@hanoverdisplays.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190402160949.14190-1-cquast@hanoverdisplays.com>
To: Christina Quast <cquast@hanoverdisplays.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Benoit Cousson <bcousson@baylibre.com>, linux-omap@vger.kernel.org, Russell King <linux@armlinux.org.uk>
List-ID: <devicetree@vger.kernel.org>

Hi,

* Christina Quast <cquast@hanoverdisplays.com> [190402 09:10]:
> This patchset replaces the register offsets for am335x with macro defines.
> The values are extraced from the "AM335x SitaraTM Processors Technical
> Reference Manual".
> 
> Updated AM33XX_IOPAD to take three instead of two parameters, to make
> future changes to #pinctrl-cells easier.

Great thanks, applying this set into omap-for-v5.2/dt-am3 today.

> For now, only the beaglebone black changes are attached.
> If this patch set passes, the rest will be sent in a second patch set.

OK that's nice.

Regards,

Tony
