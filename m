From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 13/15] arm: dts: r8a7743: Add missing OPP properties for
 CPUs
Date: Mon, 28 May 2018 16:28:31 +0530
Message-ID: <20180528105831.vesrswazlagynemq@vireshk-i7>
References: <cover.1527244200.git.viresh.kumar@linaro.org>
 <5821a6dbe413b5a217ca1e24ddf8ebfa63ba6ef0.1527244201.git.viresh.kumar@linaro.org>
 <20180528092331.3jon45nsqfdzs5ds@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180528092331.3jon45nsqfdzs5ds@verge.net.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: arm@kernel.org, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Vincent Guittot <vincent.guittot@linaro.org>, ionela.voinescu@arm.com, Daniel Lezcano <daniel.lezcano@linaro.org>, chris.redpath@arm.com, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

On 28-05-18, 11:23, Simon Horman wrote:
> [Cc Biju Das]
> 
> On Fri, May 25, 2018 at 04:01:59PM +0530, Viresh Kumar wrote:
> > The OPP properties, like "operating-points", should either be present
> > for all the CPUs of a cluster or none. If these are present only for a
> > subset of CPUs of a cluster then things will start falling apart as soon
> > as the CPUs are brought online in a different order. For example, this
> > will happen because the operating system looks for such properties in
> > the CPU node it is trying to bring up, so that it can create an OPP
> > table.
> > 
> > Add such missing properties.
> > 
> > Fix other missing property (clock latency) as well to make it all
> > work.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Thanks, this looks good to me and it looks like it should have:
> 
> Fixes: 0417814ea140 ("ARM: dts: r8a7743: Add OPP table for frequency scaling")

Sure.

Will you be picking this patch directly and send it part of your pull
request ? Maybe add Fixes tag then only ?

-- 
viresh
