From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 08/13] dt-bindings: opp: Add qcom-opp bindings with
 properties needed for CPR
Date: Wed, 24 Jul 2019 10:03:59 -0600
Message-ID: <20190724160359.GA32565@bogus>
References: <20190705095726.21433-1-niklas.cassel@linaro.org>
 <20190705095726.21433-9-niklas.cassel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190705095726.21433-9-niklas.cassel@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org, ulf.hansson@linaro.org, Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 05, 2019 at 11:57:19AM +0200, Niklas Cassel wrote:
> Add qcom-opp bindings with properties needed for Core Power Reduction
> (CPR).
> 
> CPR is included in a great variety of Qualcomm SoCs, e.g. msm8916 and
> msm8996. CPR was first introduced in msm8974.
> 
> Changes since RFC:
> -Removed opp-hz. It is already an optional property in opp.txt
> so no need to specify it with the same definition here.
> 
> Co-developed-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> ---
>  .../devicetree/bindings/opp/qcom-opp.txt      | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/opp/qcom-opp.txt
> 
> diff --git a/Documentation/devicetree/bindings/opp/qcom-opp.txt b/Documentation/devicetree/bindings/opp/qcom-opp.txt
> new file mode 100644
> index 000000000000..f204685d029c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/opp/qcom-opp.txt
> @@ -0,0 +1,19 @@
> +Qualcomm OPP bindings to describe OPP nodes
> +
> +The bindings are based on top of the operating-points-v2 bindings
> +described in Documentation/devicetree/bindings/opp/opp.txt
> +Additional properties are described below.
> +
> +* OPP Table Node
> +
> +Required properties:
> +- compatible: Allow OPPs to express their compatibility. It should be:
> +  "operating-points-v2-qcom-level"
> +
> +* OPP Node
> +
> +Optional properties:
> +- qcom,opp-fuse-level: A positive value representing the fuse corner/level
> +  associated with this OPP node. Sometimes several corners/levels shares
> +  a certain fuse corner/level. A fuse corner/level contains e.g. ref uV,
> +  min uV, and max uV.

Doesn't match the example in patch 5.

> -- 
> 2.21.0
> 
