From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 3/3] cpufreq: Add a generic cpufreq-cpu0 driver
Date: Tue, 31 Jul 2012 12:20:52 +0800
Message-ID: <20120731042050.GF762@S2101-09.ap.freescale.net>
References: <1342713281-31114-1-git-send-email-shawn.guo@linaro.org>
 <1342713281-31114-4-git-send-email-shawn.guo@linaro.org>
 <20120726131121.GB7306@sirena.org.uk>
 <20120730065218.GB31509@S2101-09.ap.freescale.net>
 <20120730185344.GT4468@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120730185344.GT4468@opensource.wolfsonmicro.com>
Sender: cpufreq-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, Richard Zhao <richard.zhao@freescale.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 30, 2012 at 07:53:45PM +0100, Mark Brown wrote:
> Quite honestly this seems totally unrealistic for the majority of users,

I doubt that.  Searching drivers/cpufreq folder, I can see there are
several cpufreq drivers scaling voltage with regulator API, but none
of them is calling regulator_set_voltage_time to find voltage latency.
That said, all these users are specify transition latency on their own.

> especially given the very poor documentation for this stuff which SoC
> vendors typically provide.  It's a reasonable amount of work to go back
> and figure this stuff out (especially given that it should be varying
> depending on the transition in question), and it's going to give us a
> bunch of magic numbers in people's bindings.
> 
There will be only one magic number, and it can easily become "magic"
with some comments put there.

> No, add a new API.
> 
Is the following patch what you are ordering here?

diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index da339fd..bfd3cfb 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -352,4 +352,11 @@ static inline void regulator_set_drvdata(struct regulator *regulator,

 #endif

+static inline int regulator_set_voltage_tolerance(struct regulator *regulator,
+                                                 int new_uV, int tol_uV)
+{
+       return regulator_set_voltage(regulator,
+                                    new_uV - tol_uV, new_uV + tol_uV);
+}
+
 #endif

-- 
Regards,
Shawn

