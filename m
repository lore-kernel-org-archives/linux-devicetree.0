From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4 2/6] dt-bindings: power: Add qcom rpm power domain
 driver bindings
Date: Wed, 4 Jul 2018 11:27:57 +0530
Message-ID: <20180704055757.4li26b6poxllmh2k@vireshk-i7>
References: <20180627045234.27403-1-rnayak@codeaurora.org>
 <20180627045234.27403-3-rnayak@codeaurora.org>
 <20180703223554.GA32313@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180703223554.GA32313@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, mka@chromium.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 03-07-18, 16:35, Rob Herring wrote:
> > +qcom,level values specified in the OPP tables for RPMh power domains
> > +should use the RPMH_REGULATOR_LEVEL_* constants from
> > +<dt-bindings/power/qcom-rpmhpd.h>
> > +
> > +	rpmhpd: power-controller {
> > +		compatible = "qcom,sdm845-rpmhpd";
> > +		#power-domain-cells = <1>;
> > +		operating-points-v2 = <&rpmhpd_opp_table>;
> > +	};
> > +
> > +	rpmhpd_opp_table: opp-table {
> > +		compatible = "operating-points-v2-qcom-level";
> > +
> > +		rpmhpd_opp_ret: opp1 {
> > +			qcom,level = <RPMH_REGULATOR_LEVEL_RETENTION>;
> > +		};
> 
> I don't see the point in using the OPP binding here when you aren't 
> using *any* of the properties from it.

Yeah, that's the case for now. But there are cases (as Stephen
mentioned earlier [1]) where the voltage values (and maybe other
values like current, etc) would be known and filled in DT. And that's
why we all agreed to use OPP tables for PM domains as well, as these
are really "operating performance points" of these PM domains.

-- 
viresh

[1] lkml.kernel.org/r/20180110025454.GG21040@codeaurora.org
