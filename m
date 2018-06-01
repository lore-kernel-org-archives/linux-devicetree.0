From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 6/6] arm64: dts: socionext: Add missing cooling device
 properties for CPUs
Date: Fri, 1 Jun 2018 12:25:22 +0900
Message-ID: <CAK7LNASv90x3QKPYEy-3Msow0wi99hV8aRiU32aAjS7jMJKydA@mail.gmail.com>
References: <cover.1527225682.git.viresh.kumar@linaro.org> <744f4c0a9a6f0d3acfc36e49ef62f17f53831b3b.1527225682.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <744f4c0a9a6f0d3acfc36e49ef62f17f53831b3b.1527225682.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: arm-soc <arm@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Vincent Guittot <vincent.guittot@linaro.org>, ionela.voinescu@arm.com, Daniel Lezcano <daniel.lezcano@linaro.org>, chris.redpath@arm.com, DTML <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

2018-05-25 14:40 GMT+09:00 Viresh Kumar <viresh.kumar@linaro.org>:
> The cooling device properties, like "#cooling-cells" and
> "dynamic-power-coefficient", should either be present for all the CPUs
> of a cluster or none. If these are present only for a subset of CPUs of
> a cluster then things will start falling apart as soon as the CPUs are
> brought online in a different order. For example, this will happen
> because the operating system looks for such properties in the CPU node
> it is trying to bring up, so that it can register a cooling device.
>
> Add such missing properties.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>


Applied to linux-uniphier.

I had already sent a PR for v4.18-rc1 before I received this patch.
Please wait for v4.19-rc1.

Thanks.

> ---
>  arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> index 3a5ed789c056..10ffb5019013 100644
> --- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> +++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
> @@ -58,6 +58,7 @@
>                         clocks = <&sys_clk 32>;
>                         enable-method = "psci";
>                         operating-points-v2 = <&cluster0_opp>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 cpu2: cpu@100 {
> @@ -77,6 +78,7 @@
>                         clocks = <&sys_clk 33>;
>                         enable-method = "psci";
>                         operating-points-v2 = <&cluster1_opp>;
> +                       #cooling-cells = <2>;
>                 };
>         };
>
> --
> 2.15.0.194.g9af6a3dea062
>



-- 
Best Regards
Masahiro Yamada
