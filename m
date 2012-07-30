From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 3/3] cpufreq: Add a generic cpufreq-cpu0 driver
Date: Mon, 30 Jul 2012 16:20:54 +0800
Message-ID: <20120730082052.GD31509@S2101-09.ap.freescale.net>
References: <1342713281-31114-1-git-send-email-shawn.guo@linaro.org>
 <1342713281-31114-4-git-send-email-shawn.guo@linaro.org>
 <20120726131121.GB7306@sirena.org.uk>
 <20120730065218.GB31509@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120730065218.GB31509@S2101-09.ap.freescale.net>
Sender: cpufreq-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, Mike Turquette <mturquette@linaro.org>, linux-pm@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Richard Zhao <richard.zhao@freescale.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 30, 2012 at 02:52:20PM +0800, Shawn Guo wrote:
> On Thu, Jul 26, 2012 at 02:11:21PM +0100, Mark Brown wrote:
> > regulator_get_voltage() might be a bit expensive, many regulators will
> > query the hardware every time.  Since it's just for diagnostic purposes
> > it'd be better to not bother and let people read the historical
> > information from the logs.
> > 
> Ok, makes sense to me.
> 
In the reply to one of Richard's comment, the volt_old will be used
not only for diagnostic purpose but also for reverting voltage back
when clk_set_rate fails.

-- 
Regards,
Shawn

