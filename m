From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH] ARM: dts: msm8974-FP2: add reboot-mode node
Date: Thu, 20 Jun 2019 20:01:22 -0400
Message-ID: <20190621000122.GA13036@onstation.org>
References: <20190620225824.2845-1-luca@z3ntu.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190620225824.2845-1-luca@z3ntu.xyz>
Sender: linux-kernel-owner@vger.kernel.org
To: Luca Weiss <luca@z3ntu.xyz>
Cc: linux-arm-msm@vger.kernel.org, ~martijnbraam/pmos-upstream@lists.sr.ht, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Luca,

On Fri, Jun 21, 2019 at 12:58:24AM +0200, Luca Weiss wrote:
> This enables userspace to signal the bootloader to go into the
> bootloader or recovery mode.
> 
> The magic values can be found in both the downstream kernel and the LK
> kernel (bootloader).
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Sidenote: Why are there no userspace tools to be found that support
> this? Anyways, we have one now in postmarketOS :)
> 
>  arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
> index 643c57f84818..f86736a6d77e 100644
> --- a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
> @@ -338,6 +338,20 @@
>  			};
>  		};
>  	};
> +
> +	imem@fe805000 {
> +		compatible = "syscon", "simple-mfd";
> +		reg = <0xfe805000 0x1000>;
> +
> +		reboot-mode {
> +			compatible = "syscon-reboot-mode";
> +			offset = <0x65c>;
> +
> +			mode-normal	= <0x77665501>;
> +			mode-bootloader	= <0x77665500>;
> +			mode-recovery	= <0x77665502>;
> +		};
> +	};
>  };

I think that it makes sense to put this snippet in qcom-msm8974.dtsi
with a status of disabled, and then enable it in
qcom-msm8974-fairphone-fp2.dts like so:

imem@fe805000 {
	status = "ok";
};

What's the pmOS utility that utilizes this? I'll test it on the Nexus 5.

Thanks,

Brian
