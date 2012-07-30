From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 3/3] cpufreq: Add a generic cpufreq-cpu0 driver
Date: Mon, 30 Jul 2012 19:55:01 +0100
Message-ID: <20120730185501.GU4468@opensource.wolfsonmicro.com>
References: <1342713281-31114-1-git-send-email-shawn.guo@linaro.org>
 <1342713281-31114-4-git-send-email-shawn.guo@linaro.org>
 <20120726131121.GB7306@sirena.org.uk>
 <20120730065218.GB31509@S2101-09.ap.freescale.net>
 <20120730082052.GD31509@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120730082052.GD31509@S2101-09.ap.freescale.net>
Sender: cpufreq-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, Mike Turquette <mturquette@linaro.org>, linux-pm@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Richard Zhao <richard.zhao@freescale.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 30, 2012 at 04:20:54PM +0800, Shawn Guo wrote:
> On Mon, Jul 30, 2012 at 02:52:20PM +0800, Shawn Guo wrote:

> > Ok, makes sense to me.

> In the reply to one of Richard's comment, the volt_old will be used
> not only for diagnostic purpose but also for reverting voltage back
> when clk_set_rate fails.

We should be able to figure out what operating point we set without
having to read it back from the hardware like this.
