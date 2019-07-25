From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH 11/13] arm64: dts: qcom: qcs404: Add CPR and populate OPP
 table
Date: Thu, 25 Jul 2019 12:40:31 +0200
Message-ID: <20190725104031.GA21998@centauri>
References: <20190705095726.21433-1-niklas.cassel@linaro.org>
 <20190705095726.21433-12-niklas.cassel@linaro.org>
 <20190710090303.tb5ue3wq6r7ofyev@vireshk-i7>
 <20190715132405.GA5040@centauri>
 <20190716103436.az5rdk6f3yoa3apz@vireshk-i7>
 <20190716105318.GA26592@centauri>
 <20190717044923.ccmebeewbinlslkm@vireshk-i7>
 <20190719154558.GA32518@centauri>
 <20190723015635.rl5a2isjnjn23fzh@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190723015635.rl5a2isjnjn23fzh@vireshk-i7>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org, ulf.hansson@linaro.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 23, 2019 at 07:26:35AM +0530, Viresh Kumar wrote:
> On 19-07-19, 17:45, Niklas Cassel wrote:
> > Hello Viresh,
> > 
> > Could you please have a look at the last two patches here:
> > https://git.linaro.org/people/niklas.cassel/kernel.git/log/?h=cpr-opp-hz
> 
> There is no sane way of providing review comments with a link to the
> git tree :)
> 
> I still had a look and I see that you don't search for max frequency
> but just any OPP that has required-opps set to the level u want. Also,
> can't there be multiple phandles in required-opps in your case ?

For each OPP in the CPR OPP table, we need three things,
opp-level, qcom,fuse-level and opp-hz.
The first two can simply be parsed from the OPP node
itself while iterating the CPR OPP table.
The opp-hz has to be fetched from the CPU OPP table.

Several OPPs might have the same qcom,fuse-level value.
However, they will have unique opp-level values and unique
opp-hz values. Each opp-level has a matching opp-hz.

required-opps is basically a connection between a opp-hz
(CPU OPP table) and and a opp-level (CPR OPP table).

So there will be only one match. No need to search for
max frequency.

I think you are confusing this with something else.
The CPR hardware has to be programmed with the highest
frequency for each qcom,fuse-corner.
This is done here:
https://git.linaro.org/people/niklas.cassel/kernel.git/tree/drivers/power/avs/qcom-cpr.c?h=cpr-full#n1219
by saving the highest frequency for each fuse level
while iterating the OPP table.


There can be only one phandle in the required-opps in my case,
this is one of the reasons why I prefer implementing it in the
CPR driver. If it were to be implemented in OPP core, it probably
has to handle multiple phandles.

> 
> > If you like my proposal then I could send out the first patch (the one to
> > OPP core) as a real patch (with an improved commit message), and
> > incorporate the second patch into my CPR patch series when I send out a V2.
> 
> Send them both in your series only, otherwise the first one is useless
> anyway.

Ok, will do.


Kind regards,
Niklas
