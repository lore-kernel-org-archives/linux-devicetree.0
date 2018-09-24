Return-Path: <SRS0=1y5o=MG=atomide.com=tony@kernel.org>
Date: Mon, 24 Sep 2018 15:01:29 -0700
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] arm: dts: am57xx-idk-common: Hook smps12 regulator as
 cpu vdd-supply
Message-ID: <20180924220129.GF5662@atomide.com>
References: <1537528978-31780-1-git-send-email-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1537528978-31780-1-git-send-email-j-keerthy@ti.com>
To: Keerthy <j-keerthy@ti.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, nm@ti.com
List-ID: <devicetree@vger.kernel.org>

* Keerthy <j-keerthy@ti.com> [180921 04:27]:
> am574x-idk has no cpu vdd-supply at the moment. Hence hook smps12
> regulator as cpu vdd-supply in am57xx-idk-common as the same regulator
> feeds on to cpu on am571/2/4-idks. So remove all the individual
> instances and place that in common place.

Applying into omap-for-v4.20/dt thanks.

Regards,

Tony
