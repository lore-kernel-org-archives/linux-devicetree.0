From: Stephen Boyd <sboyd@kernel.org>
Subject: RE: [PATCH v3 07/10] clk: qcom: clk-cpu-8996: Prepare PLLs on probe
Date: Tue, 20 Mar 2018 13:03:30 -0700
Message-ID: <152157621010.125118.6503833008829122560@swboyd.mtv.corp.google.com>
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org>
 <1518616792-29028-8-git-send-email-ilialin@codeaurora.org>
 <152147821849.242365.7709382599118820578@swboyd.mtv.corp.google.com>
 <013c01d3c052$ca49ecd0$5eddc670$@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <013c01d3c052$ca49ecd0$5eddc670$@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: ilialin@codeaurora.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, rnayak@codeaurora.org, robh@kernel.org, will.deacon@arm.com, amit.kucheria@linaro.org, tfinkel@codeaurora.org, nicolas.dechesne@linaro.org, celster@codeaurora.org
List-Id: devicetree@vger.kernel.org

Quoting ilialin@codeaurora.org (2018-03-20 06:53:08)
> 
> 
> > -----Original Message-----
> > From: Stephen Boyd <sboyd@kernel.org>
> > Sent: Monday, March 19, 2018 18:50
> > To: Ilia Lin <ilialin@codeaurora.org>; linux-arm-kernel@lists.infradead.org;
> > linux-arm-msm@vger.kernel.org; linux-clk@vger.kernel.org;
> > sboyd@codeaurora.org
> > Cc: mark.rutland@arm.com; devicetree@vger.kernel.org;
> > rnayak@codeaurora.org; robh@kernel.org; will.deacon@arm.com;
> > amit.kucheria@linaro.org; tfinkel@codeaurora.org; ilialin@codeaurora.org;
> > nicolas.dechesne@linaro.org; celster@codeaurora.org
> > Subject: Re: [PATCH v3 07/10] clk: qcom: clk-cpu-8996: Prepare PLLs on probe
> > 
> > Quoting Ilia Lin (2018-02-14 05:59:49)
> > > The PLLs must be prepared enabled during the probe to be accessible by
> > > the OPPs. Otherwise an OPP may switch to non-enabled clock.
> > 
> > Sounds like an OPP problem.
> 
> And again, it could be solved by a platform specific cpufreq driver. Worth it?
> 
> > 
> > >  #include "clk-alpha-pll.h"
> > >
> > >  #define VCO(a, b, c) { \
> > > @@ -376,6 +376,18 @@ struct clk_hw_clks {
> > >         clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
> > >         clk_alpha_pll_configure(&pwrcl_alt_pll, regmap,
> > > &altpll_config);
> > >
> > > +       /* Enable all PLLs and alt PLLs */
> > > +       clk_prepare_enable(pwrcl_alt_pll.clkr.hw.clk);
> > > +       clk_prepare_enable(perfcl_alt_pll.clkr.hw.clk);
> > > +       clk_prepare_enable(pwrcl_pll.clkr.hw.clk);
> > > +       clk_prepare_enable(perfcl_pll.clkr.hw.clk);
> > 
> > And this can't be done by the cpufreq-dt driver?
> 
> Are you suggesting changing the cpufreq-dt as well?

Yes?

> 
> > 
> > > +
> > > +       /* Set initial boot frequencies for power/perf PLLs */
> > > +       clk_set_rate(pwrcl_alt_pll.clkr.hw.clk, 652800000);
> > > +       clk_set_rate(perfcl_alt_pll.clkr.hw.clk, 652800000);
> > > +       clk_set_rate(pwrcl_pll.clkr.hw.clk, 652800000);
> > > +       clk_set_rate(perfcl_pll.clkr.hw.clk, 652800000);
> > 
> > We have assigned rates in DT for this.
> 
> I assumed that the clock driver can live without the OPP table and any cpufreq driver. Or do you mean adding this as parameters for the kryocc DT node?
> 

Yes I mean adding assigned rates to the kroycc DT node to setup PLLs to
rates you want.
