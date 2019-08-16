From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 06/14] dt-bindings: cpufreq: qcom-nvmem: Support
 pstates provided by a power domain
Date: Fri, 16 Aug 2019 16:21:29 -0500
Message-ID: <20190816212129.GA22090@bogus>
References: <20190725104144.22924-1-niklas.cassel@linaro.org>
 <20190725104144.22924-7-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190725104144.22924-7-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Andy Gross <agross@kernel.org>, Ilia Lin <ilia.lin@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org, ulf.hansson@linaro.org, Niklas Cassel <niklas.cassel@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 25 Jul 2019 12:41:34 +0200, Niklas Cassel wrote:
> Some Qualcomm SoCs have support for Core Power Reduction (CPR).
> On these platforms, we need to attach to the power domain provider
> providing the performance states, so that the leaky device (the CPU)
> can configure the performance states (which represent different
> CPU clock frequencies).
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> ---
>  .../bindings/opp/qcom-nvmem-cpufreq.txt       | 111 ++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
