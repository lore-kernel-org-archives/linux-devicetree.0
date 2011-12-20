From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH V3 4/7] cpufreq: add generic cpufreq driver
Date: Tue, 20 Dec 2011 23:48:45 +0000
Message-ID: <20111220234844.GC6551@opensource.wolfsonmicro.com>
References: <1324264903-15395-1-git-send-email-richard.zhao@linaro.org>
 <1324264903-15395-5-git-send-email-richard.zhao@linaro.org>
 <20111220145904.GD29727@sirena.org.uk>
 <20111220232701.GA1698@richard-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111220232701.GA1698@richard-laptop>
Sender: cpufreq-owner@vger.kernel.org
To: Richard Zhao <richard.zhao@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux@arm.linux.org.uk, arnd@arndb.de, mark.langsdorf@calxeda.com, patches@linaro.org, marc.zyngier@arm.com, catalin.marinas@arm.com, bryanh@codeaurora.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, rdunlap@xenotime.net, eric.miao@linaro.org, kernel@pengutronix.de, jamie@jamieiles.com, davej@redhat.com, davidb@codeaurora.org, shawn.guo@linaro.org, linaro-dev@lists.linaro.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 21, 2011 at 07:27:03AM +0800, Richard Zhao wrote:
> On Tue, Dec 20, 2011 at 02:59:04PM +0000, Mark Brown wrote:

> > My comments on the previous version of the patch still apply:

> >  - The voltage ranges being set need to be specified as ranges.

> cpu normally need strict voltages. and only proved operating opints
> are allowed to set in dts. If the voltage changes slightly especially
> for high frequency, it's easy to cause unstable.

Clearly there will be limits which get more and more restrictive as the
frequencies get higher but there will always be at least some play in
the numbers as one must at a minimum specify tolerance ranges, and at
lower frequencies the ranges specified will typically get compartively
large.

Note also that not all hardware specifies things in terms of a fixed set
of operating points, sometimes only the minimum voltage specification is
varied with frequency or sometimes you see maximum and minimum stepping
independently.

Further note that if all hardware really does have as tight a set of
requirements as you suggest then the regulator support in the driver
needs to be non-optional otherwise a board without software regulator
control might drop the frequency without also dropping the voltage.

> >  - Frequencies that can't be supported due to limitations of the
> >    available supplies shouldn't be exposed to users.

> As I said, only proved operation points are allowed.

This statement appears to be unrelated to the comment you're replying
to.

> > You also need to define how the core supplies get looked up.

> It's pure software. platform uses this driver have to define "cpu" consumer.

You still need to define this in the binding.

> > > +	pr_info("Generic CPU frequency driver\n");

> > This seems noisy...

> Why? Do you think only errors and warnings can print out?

Yes.
