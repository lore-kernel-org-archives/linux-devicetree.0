From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v5 04/11] ARM: STi: STiH407: Provide generic (safe) DVFS
 configuration
Date: Tue, 8 Dec 2015 20:33:40 +0530
Message-ID: <20151208150340.GI3692@ubuntu>
References: <1449585124-15596-1-git-send-email-lee.jones@linaro.org>
 <1449585124-15596-5-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449585124-15596-5-git-send-email-lee.jones@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, maxime.coquelin@st.com, linux-pm@vger.kernel.org, rjw@rjwysocki.net, devicetree@vger.kernel.org, ajitpal.singh@st.com
List-Id: devicetree@vger.kernel.org

On 08-12-15, 14:31, Lee Jones wrote:
> diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
> index 81f8121..9fa1e58 100644
> --- a/arch/arm/boot/dts/stih407-family.dtsi
> +++ b/arch/arm/boot/dts/stih407-family.dtsi
> @@ -22,15 +22,29 @@
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a9";
>  			reg = <0>;
> +
>  			/* u-boot puts hpen in SBC dmem at 0xa4 offset */
>  			cpu-release-addr = <0x94100A4>;
> +
> +					 /* kHz     uV   */
> +			operating-points = <1500000 0
> +					    1200000 0
> +					    800000  0
> +					    500000  0>;
>  		};
>  		cpu@1 {
>  			device_type = "cpu";
>  			compatible = "arm,cortex-a9";
>  			reg = <1>;
> +
>  			/* u-boot puts hpen in SBC dmem at 0xa4 offset */
>  			cpu-release-addr = <0x94100A4>;
> +
> +					 /* kHz     uV   */
> +			operating-points = <1500000 0
> +					    1200000 0
> +					    800000  0
> +					    500000  0>;

Why didn't you move to opp-v2 ?

-- 
viresh
