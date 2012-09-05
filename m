From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH v3 3/3] cpufreq: Add a generic cpufreq-cpu0 driver
Date: Wed, 5 Sep 2012 22:18:50 +0200
Message-ID: <201209052218.50634.rjw@sisk.pl>
References: <1344577046-14847-1-git-send-email-shawn.guo@linaro.org> <201209051538.12916.rjw@sisk.pl> <20120905135937.GA2362@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20120905135937.GA2362@S2101-09.ap.freescale.net>
Sender: cpufreq-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, Shilimkar Santosh <santosh.shilimkar@ti.com>, Richard Zhao <richard.zhao@freescale.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Rob Herring <rob.herring@calxeda.com>, AnilKumar Ch <anilkumar@ti.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wednesday, September 05, 2012, Shawn Guo wrote:
> On Wed, Sep 05, 2012 at 03:38:12PM +0200, Rafael J. Wysocki wrote:
> > Well, what about actually avoiding the code duplication?  That is,
> > can you make OMAP be a user of your new core function and drop the
> > OMAP-specific one, perhaps?
> > 
> I would expect that the driver will replace the omap-cpufreq driver
> completely at some point, where omap becomes a DT only platform.

That's fine, but why do we need two almost identical functions to start with?

Rafael
