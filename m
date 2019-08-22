From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH v3 06/14] dt-bindings: cpufreq: qcom-nvmem: Support
 pstates provided by a power domain
Date: Thu, 22 Aug 2019 12:27:23 +0200
Message-ID: <20190822102723.GB8494@centauri>
References: <20190725104144.22924-7-niklas.cassel@linaro.org>
 <20190819100957.17095-1-niklas.cassel@linaro.org>
 <5d5ae389.1c69fb81.cb730.3225@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5d5ae389.1c69fb81.cb730.3225@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Andy Gross <agross@kernel.org>, Ilia Lin <ilia.lin@kernel.org>, Nishanth Menon <nm@ti.com>, Viresh Kumar <vireshk@kernel.org>, linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org, ulf.hansson@linaro.org, Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 19, 2019 at 10:59:36AM -0700, Stephen Boyd wrote:
> Quoting Niklas Cassel (2019-08-19 03:09:57)
> > +
> > +soc {
> > +....
> > +       cprpd: cpr@b018000 {
> 
> Maybe node name should be 'avs' for the industry standard adaptive
> voltage scaling acronym?

I see where this is coming from, but "git grep avs" gives a single result.

Also, since the label is cprpd, it doesn't make sense to simply rename the
node name, and I don't think that avspd would be a good name, since it is
less correct.

So if you don't insist, I would prefer to leave it as it is.

> 
> 
> > +               compatible = "qcom,qcs404-cpr", "qcom,cpr";
> > +               reg = <0x0b018000 0x1000>;
> > +               ....
> > +               vdd-apc-supply = <&pms405_s3>;
> > +               #power-domain-cells = <0>;
