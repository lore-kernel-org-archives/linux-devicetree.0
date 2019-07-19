From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH 11/13] arm64: dts: qcom: qcs404: Add CPR and populate OPP
 table
Date: Fri, 19 Jul 2019 17:45:58 +0200
Message-ID: <20190719154558.GA32518@centauri>
References: <20190705095726.21433-1-niklas.cassel@linaro.org>
 <20190705095726.21433-12-niklas.cassel@linaro.org>
 <20190710090303.tb5ue3wq6r7ofyev@vireshk-i7>
 <20190715132405.GA5040@centauri>
 <20190716103436.az5rdk6f3yoa3apz@vireshk-i7>
 <20190716105318.GA26592@centauri>
 <20190717044923.ccmebeewbinlslkm@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190717044923.ccmebeewbinlslkm@vireshk-i7>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org, ulf.hansson@linaro.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 17, 2019 at 10:19:23AM +0530, Viresh Kumar wrote:
> On 16-07-19, 12:53, Niklas Cassel wrote:
> > Here I cheated and simply used get_cpu_device(0).
> > 
> > Since I cheated, I used get_cpu_device(0) always,
> > so even when CPU1,CPU2,CPU3 is attached, dev_pm_opp_get_opp_count(cpu0) is
> > still 0.
> > 
> > I added a print in
> > [    3.836533] cpr_set_performance: number of OPPs for dev: cpu0: 3
> > 
> > And there I can see that OPP count is 3, so it appears that with the
> > current code, we need to wait until cpufreq-dt.c:cpufreq_init()
> > has been called, maybe dev_pm_opp_of_cpumask_add_table() needs
> > to be called before dev_pm_opp_get_opp_count(cpu0) actually returns 3.
> > 
> > cpufreq_init() is called by platform_device_register_simple("cpufreq-dt", -1,
> >                                                           NULL, 0);
> > which is called after dev_pm_opp_attach_genpd().
> > 
> > What I don't understand is that dev_pm_opp_attach_genpd() actually returns
> > a OPP table. So why do we need to wait for dev_pm_opp_of_cpumask_add_table(),
> > before either dev_pm_opp_get_opp_count(cpu0) or
> > dev_pm_opp_get_opp_count(genpd_virtdev_for_cpu0) returns 3?
> 
> Ah, I see the problems now. No, cpufreq table can't be available at
> this point of time and we aren't going to change that. It is the right
> thing to do.
> 
> Now, even if the kernel isn't written in a way which works for you, it
> isn't right to put more things in DT than required. DT is (should be)
> very much independent of the Linux kernel.
> 
> So we have to parse DT to find highest frequency for each
> required-opp. Best is to put that code in the OPP core and use it from
> your driver.

Hello Viresh,

Could you please have a look at the last two patches here:
https://git.linaro.org/people/niklas.cassel/kernel.git/log/?h=cpr-opp-hz

If you like my proposal then I could send out the first patch (the one to
OPP core) as a real patch (with an improved commit message), and
incorporate the second patch into my CPR patch series when I send out a V2.


Kind regards,
Niklas
