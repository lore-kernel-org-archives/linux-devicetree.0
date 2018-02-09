From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [Query] thermal: Who is using "cooling-{min|max}-level}"
 properties ?
Date: Fri, 9 Feb 2018 12:12:11 +0530
Message-ID: <20180209064211.GY28462@vireshk-i7>
References: <20180207065959.GN28462@vireshk-i7>
 <c7bd6ed5-b93e-3a07-b4a2-4c3b1eef5fac@linaro.org>
 <20180207102446.GS28462@vireshk-i7>
 <11fbba25-7029-8a13-476e-ea2f2de6fbf9@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <11fbba25-7029-8a13-476e-ea2f2de6fbf9@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Vincent Guittot <vincent.guittot@linaro.org>, linux-pm@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, Punit.Agrawal@arm.com, ionela.voinescu@arm.com
List-Id: devicetree@vger.kernel.org

On 07-02-18, 11:45, Daniel Lezcano wrote:
> Yes, that is my understanding. cooling-min-level and cooling-max-level
> are not used in the thermal framework code today.

Right.

> So if they are defined, we should check the cooling-device max and min
> are in the boundaries (if they are different from no-limit).

Hmm, I am not sure. We do compare those values (from maps) with the
max reported by the cooling driver, so there is some boundary check
happening. And I don't think it is worth comparing the min/max values
from DT cooling device's nodes. Why not just leave those for the
driver to return (which is already happening btw).

I don't think it would be correct for the thermal core to go and look
at the min/max properties of the cooling device directly, as those are
more for the thermal driver's help. The thermal core should just call
the get_max_state() callback and that's it.

Anyway, we can take decision on the binding itself after some time but
I will send some patches to get rid of this property from CPU nodes
for now. It doesn't make sense to have it there (anyway it is
optional), as the cpu cooling devices are kind of virtual cooling
devices which rely on OPP or freq-table currently. Maybe I will begin
by just updating one platform and once that is merged, update
everything else as well.

-- 
viresh
