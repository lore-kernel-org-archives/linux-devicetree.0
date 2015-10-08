From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 01/16] PM / OPP: Add 'supply-names' binding
Date: Thu, 8 Oct 2015 14:57:09 +0530
Message-ID: <20151008092709.GC18898@linux>
References: <cover.1441972771.git.viresh.kumar@linaro.org>
 <2b87b162eabd1570ae2311e1ef8655acda72f678.1441972771.git.viresh.kumar@linaro.org>
 <55F72C97.2030306@kernel.org>
 <20150915024747.GI32551@linux>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150915024747.GI32551@linux>
Sender: linux-pm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, nm@ti.com, sboyd@codeaurora.org, linaro-kernel@lists.linaro.org, linux-pm@vger.kernel.org, rob.herring@linaro.org, lee.jones@linaro.org, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, open list <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
List-Id: devicetree@vger.kernel.org

Rob,

On 15-09-15, 08:17, Viresh Kumar wrote:
> On 14-09-15, 15:22, Rob Herring wrote:
> > What if we have a 2nd device and supply rail? For example, what if the
> > L2$ has a separate rail from the cores but is linked to the OPPs.
> 
> Right, so that is the case with the Mediatek SoC as well, AFAIR. How
> do we plan to treat L2 devices? For example, in the mediatek cpufreq
> driver, they change L2's supplies together with CPUs.
> 
> One way to get that done, with such very closely bound devices is to
> add two regulators:
> 
> cpu-supply = ...;
> l2-supply = ...;
> 
> And then a property in OPP table:
> 
> supply-name = "cpu", "l2";
> 
> And maybe fix the order in which the supplies which be updated, based
> on the order in which entries are present in the above property.
> 
> Any other way you suggest for doing that ?
> 
> > Remind me of when do we have multiple regulators for a cpu?
> 
> I haven't seen that yet, but its more like what I explained above.
> i.e. one for the CPU and other one for the L2 cache.
> 
> But, these bindings do apply for other devices as well, where it
> should be very much possible.

Not sure if you still have any objections to this patch?

-- 
viresh
