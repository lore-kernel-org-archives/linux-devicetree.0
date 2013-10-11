From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 1/2] ARM: DT: msm: Add Qualcomm's PRNG driver
 binding document
Date: Fri, 11 Oct 2013 13:46:40 -0700
Message-ID: <20131011204640.GD13139@codeaurora.org>
References: <1381504601-23773-1-git-send-email-svarbanov@mm-sol.com>
 <1381504601-23773-2-git-send-email-svarbanov@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1381504601-23773-2-git-send-email-svarbanov@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org, Rob Landley <rob@landley.net>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 10/11, Stanimir Varbanov wrote:
> This adds Qualcomm PRNG driver device tree binding documentation
> to use as an example in dts trees.
> 
> Signed-off-by: Stanimir Varbanov <svarbanov@mm-sol.com>
> ---
>  Documentation/devicetree/bindings/rng/qcom,prng.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rng/qcom,prng.txt
> 
> diff --git a/Documentation/devicetree/bindings/rng/qcom,prng.txt b/Documentation/devicetree/bindings/rng/qcom,prng.txt
> new file mode 100644
> index 000000000000..92be00085ab1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rng/qcom,prng.txt
> @@ -0,0 +1,17 @@
> +Qualcomm MSM pseudo random number generator.
> +
> +Required properties:
> +
> +- compatible  : should be "qcom,prng"
> +- reg         : specifies base physical address and size of the registers map
> +- clocks      : phandle to clock-controller plus clock-specifier pair
> +- clock-names : "prng" clocks all registers, FIFO and circuits in PRNG IP block

We're trying to keep to more generic names such as "core" for
clocks like this. We've had problems in the past where hardware
designers named the clock input after the name of the hardware
and then the name of the hardware changed in the next version of
the chip (although the hardware was mostly compatible with the
previous version) and so they renamed the clock input. This
leaked into the software drivers and we had horrible things like
platform data for clock names. Sticking to "core" indicates what
the clock does (i.e. it clocks the core PRNG hardware) while
staying generic enough to prevent problems in the future if the
block is renamed to something else. It might also help us in the
future should our bus layer become smart enough to manage clocks
for drivers without their knowing.

> +
> +Example:
> +
> +	rng {

It's good practice to add the unit address here, so rng@f9bff000.

> +		compatible = "qcom,prng";
> +		reg = <0xf9bff000 0x200>;
> +		clocks = <&clock GCC_PRNG_AHB_CLK>;
> +		clock-names = "prng";
> +	};

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
