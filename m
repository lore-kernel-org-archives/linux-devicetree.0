From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCHv1 2/8] Documentation: arm: Link idle-states binding to
 code
Date: Fri, 10 May 2019 14:02:40 +0100
Message-ID: <20190510130240.GC10284@e107155-lin>
References: <cover.1557486950.git.amit.kucheria@linaro.org>
 <5f25e2b3096fa73f205e1797e355e049ed9f8c9c.1557486950.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5f25e2b3096fa73f205e1797e355e049ed9f8c9c.1557486950.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, andy.gross@linaro.org, David Brown <david.brown@linaro.org>, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri, May 10, 2019 at 04:59:40PM +0530, Amit Kucheria wrote:
> The enable-method needs to be psci for the psci_cpuidle_ops to be
> correctly registered.
>
> Add a note to the binding documentation on where to find the declaration
> of the enable-method since it is a macro and escapes any attempts to
> grep for it.
>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/idle-states.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/idle-states.txt b/Documentation/devicetree/bindings/arm/idle-states.txt
> index 45730ba60af5..3a42335a6f3d 100644
> --- a/Documentation/devicetree/bindings/arm/idle-states.txt
> +++ b/Documentation/devicetree/bindings/arm/idle-states.txt
> @@ -239,6 +239,10 @@ processor idle states, defined as device tree nodes, are listed.
>  			# On ARM v8 64-bit this property is required and must
>  			  be:
>  			   - "psci"
> +			     (This assumes that the enable-method is "psci"
> +			     in the cpu node[6] that then uses the
> +			     CPUIDLE_METHOD_OF_DECLARE macro to setup the
> +			     psci_cpuidle_ops callbacks)

I don't prefer to refer some Linux implementation macros in DT bindings
as they may disappear any day. Further, the use of CPUIDLE_METHOD_OF_DECLARE
is restricted to ARM32 platforms only. So better to move it down without
the reference to the above macro or any kernel implementation details if
possible.

>  			# On ARM 32-bit systems this property is optional
>

Something like:
"This assumes that the "enable-method" property is set to "psci" in
in the cpu node[6] and use this property to set up the CPU idle
management in OS PM implementations"

With something on these line, you can add:

Acked-by: Sudeep Holla <sudeep.holla@arm.com

--
Regards,
Sudeep
