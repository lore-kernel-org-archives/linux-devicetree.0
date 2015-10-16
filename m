From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 01/16] PM / OPP: Add 'supply-names' binding
Date: Fri, 16 Oct 2015 11:32:27 +0530
Message-ID: <20151016060227.GS19018@linux>
References: <cover.1441972771.git.viresh.kumar@linaro.org>
 <2b87b162eabd1570ae2311e1ef8655acda72f678.1441972771.git.viresh.kumar@linaro.org>
 <55F72C97.2030306@kernel.org>
 <20151016002243.GA23912@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151016002243.GA23912@codeaurora.org>
Sender: linux-pm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Rob Herring <robh@kernel.org>, Rafael Wysocki <rjw@rjwysocki.net>, nm@ti.com, linaro-kernel@lists.linaro.org, linux-pm@vger.kernel.org, rob.herring@linaro.org, lee.jones@linaro.org, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, open list <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
List-Id: devicetree@vger.kernel.org

On 15-10-15, 17:22, Stephen Boyd wrote:
> I'm lost why we need this property at all. What happened to using
> 
>  opp-microvolt-0 = <1 2 3>;
>  opp-microvolt-1 = <1>;
>  opp-microvolt-2 = <3 4 5>;
>  etc.

Perhaps you are confusing this with the bindings we came up for
picking right voltage levels based on the cuts/version of the hardware
we are running on. The problem that Lee Jones mentioned and that can
be used in your case as well.

> That seems to avoid any problem with 3 vs. 1 element properties
> combined into one large array.

That's not the problem I was trying to solve here.

> Having supply-names seems too
> brittle and would tie us to a particular OPP user's decision to
> call supplies by some name.

No. The name has to match the <name>-supply property present in the
device's node, that's why we need this property :)

> Also, I've seen devices that are split across two power domains.
> These devices aren't CPUs, but they are other devices including
> L2 caches. So we're going to need either multiple regulator
> support or multiple "power domain at a particular performance
> levels" support somehow.

Right, that's a good example of why we need multi-regulator support :)

-- 
viresh
