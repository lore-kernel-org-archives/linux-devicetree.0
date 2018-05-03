Return-Path: <SRS0=RkuC=HW=linaro.org=viresh.kumar@kernel.org>
Date: Thu, 3 May 2018 09:57:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V2 02/11] PM / OPP: dt-bindings: Make "opp-hz" optional
 for power domains
Message-ID: <20180503042756.thse23whxq3b2suf@vireshk-i7>
References: <cover.1523273291.git.viresh.kumar@linaro.org>
 <5c4a3a3fb4bf7320e592aabf582bfb6bdec4ee69.1523273291.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c4a3a3fb4bf7320e592aabf582bfb6bdec4ee69.1523273291.git.viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Rajendra Nayak <rnayak@codeaurora.org>, Vincent Guittot <vincent.guittot@linaro.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 09-04-18, 17:13, Viresh Kumar wrote:
> The "opp-hz" property is not relevant across all the devices that use
> the OPP tables now. For example, for a power domain a frequency value
> wouldn't mean anything. Though they must have another property, which
> may be implementation defined, which uniquely identifies the OPP nodes.
> 
> Make "opp-hz" optional for such devices.
> 
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  Documentation/devicetree/bindings/opp/opp.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/opp/opp.txt b/Documentation/devicetree/bindings/opp/opp.txt
> index 788052d66c9d..c396c4c0af92 100644
> --- a/Documentation/devicetree/bindings/opp/opp.txt
> +++ b/Documentation/devicetree/bindings/opp/opp.txt
> @@ -82,7 +82,10 @@ This defines voltage-current-frequency combinations along with other related
>  properties.
>  
>  Required properties:
> -- opp-hz: Frequency in Hz, expressed as a 64-bit big-endian integer.
> +- opp-hz: Frequency in Hz, expressed as a 64-bit big-endian integer. This is a
> +  required property for all device nodes but devices like power domains. The
> +  power domain nodes must have another (implementation dependent) property which
> +  uniquely identifies the OPP nodes.
>  
>  Optional properties:
>  - opp-microvolt: voltage in micro Volts.

Hi Rob,

Can you please review/Ack this patch as well? I can then pick this
series for 4.18 branch.

-- 
viresh
