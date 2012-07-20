From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 3/3] cpufreq: Add a generic cpufreq-cpu0 driver
Date: Fri, 20 Jul 2012 21:15:55 +0800
Message-ID: <20120720131554.GB32263@S2101-09.ap.freescale.net>
References: <1342713281-31114-1-git-send-email-shawn.guo@linaro.org>
 <1342713281-31114-4-git-send-email-shawn.guo@linaro.org>
 <d9889f8c-cebd-482d-af5c-c9e207c3dfae@email.android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d9889f8c-cebd-482d-af5c-c9e207c3dfae@email.android.com>
Sender: cpufreq-owner@vger.kernel.org
To: Richard Zhao <linuxzsc@gmail.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, Mike Turquette <mturquette@linaro.org>, linux-pm@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, cpufreq@vger.kernel.org, Richard Zhao <richard.zhao@freescale.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 20, 2012 at 08:51:17PM +0800, Richard Zhao wrote:
> Hi, Shawn,
> 
> I find you create a new driver rather than work on my generic cpufreq driver based on clk and regulator.
> Is there any reason besides adding opp support?
> 
Adopting OPP support forces me to look at omap-cpufreq driver, hence
makes me create a new driver by referencing to omap-cpufreq.

-- 
Regards,
Shawn

