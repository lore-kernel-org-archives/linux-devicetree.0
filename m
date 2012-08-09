From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2 3/4] regulator: add a new API
 regulator_set_voltage_tol()
Date: Thu, 9 Aug 2012 11:53:50 +0100
Message-ID: <20120809105349.GL24328@opensource.wolfsonmicro.com>
References: <1344179121-17738-1-git-send-email-shawn.guo@linaro.org>
 <1344179121-17738-4-git-send-email-shawn.guo@linaro.org>
 <20120808133540.GB16861@opensource.wolfsonmicro.com>
 <20120808143004.GB14718@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120808143004.GB14718@S2101-09.ap.freescale.net>
Sender: cpufreq-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, Shilimkar Santosh <santosh.shilimkar@ti.com>, Richard Zhao <richard.zhao@freescale.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 08, 2012 at 10:30:07PM +0800, Shawn Guo wrote:
> On Wed, Aug 08, 2012 at 02:35:40PM +0100, Mark Brown wrote:

> > Applied, thanks!  It's on a separate branch so can easily be either
> > applied somewhere else or merged into another tree if required for
> > dependencies, just let me know.

> I intended to have the whole series go via cpufreq tree with your ack
> on this patch.  But I could also ask Rafael to merge your branch to
> resolve the dependency.

I anticipate wanting the new API in other trees too (I have one likely
use in mind) so having it only in the cpufreq tree would be inconvenient.
The whole reason to have this in the regulator API is that it's
something that's useful outside your cpufreq code!
