From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 01/16] PM / OPP: Add 'supply-names' binding
Date: Tue, 27 Oct 2015 13:49:17 +0530
Message-ID: <20151027081917.GD5505@ubuntu>
References: <cover.1441972771.git.viresh.kumar@linaro.org>
 <2b87b162eabd1570ae2311e1ef8655acda72f678.1441972771.git.viresh.kumar@linaro.org>
 <55F72C97.2030306@kernel.org>
 <20151016002243.GA23912@codeaurora.org>
 <20151016060227.GS19018@linux>
 <20151016191658.GA16437@codeaurora.org>
 <20151017041055.GZ19018@linux>
 <20151022163942.GX8232@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151022163942.GX8232@sirena.org.uk>
Sender: linux-pm-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh@kernel.org>, Rafael Wysocki <rjw@rjwysocki.net>, nm@ti.com, linaro-kernel@lists.linaro.org, linux-pm@vger.kernel.org, rob.herring@linaro.org, lee.jones@linaro.org, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, open list <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
List-Id: devicetree@vger.kernel.org

On 23-10-15, 01:39, Mark Brown wrote:
> When we start doing this we also start having to worry about things like
> the sequencing of the updates between the various supplies and end up in
> full on power sequencing (or at least baking some sequencing into the DT
> which will doubtless need extending at some point).

Absolutely.

> I'm not sure that's
> a place we want to end up just yet, I think it's safer to just have a
> little bit of code in the kernel that glues things together in the cases
> where this is needed.  

So you are effectively saying that we shouldn't go ahead with multi
regulator support in OPP library, right?

I went ahead with it as it came as a requirement (specially from
Qcom).

To the problem of sequencing, maybe we can just support that for the
simple case, where supplies will be programmed in the order in which
they are present in the property I added in this patch. And not try to
solve problem for the complex cases, if we feel it is getting ugly.

@Stephen ?

-- 
viresh
