From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v3 3/3] cpufreq: Add a generic cpufreq-cpu0 driver
Date: Wed, 5 Sep 2012 21:59:40 +0800
Message-ID: <20120905135937.GA2362@S2101-09.ap.freescale.net>
References: <1344577046-14847-1-git-send-email-shawn.guo@linaro.org>
 <201209050118.39045.rjw@sisk.pl>
 <20120905011219.GN2362@S2101-09.ap.freescale.net>
 <201209051538.12916.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201209051538.12916.rjw@sisk.pl>
Sender: cpufreq-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, Shilimkar Santosh <santosh.shilimkar@ti.com>, Richard Zhao <richard.zhao@freescale.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Rob Herring <rob.herring@calxeda.com>, AnilKumar Ch <anilkumar@ti.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 05, 2012 at 03:38:12PM +0200, Rafael J. Wysocki wrote:
> Well, what about actually avoiding the code duplication?  That is,
> can you make OMAP be a user of your new core function and drop the
> OMAP-specific one, perhaps?
> 
I would expect that the driver will replace the omap-cpufreq driver
completely at some point, where omap becomes a DT only platform.

-- 
Regards,
Shawn
