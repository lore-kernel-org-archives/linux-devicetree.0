MIME-Version: 1.0
In-Reply-To: <1395138028-19630-5-git-send-email-lorenzo.pieralisi@arm.com>
References: <1395138028-19630-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1395138028-19630-5-git-send-email-lorenzo.pieralisi@arm.com>
Date: Tue, 18 Mar 2014 08:03:12 -0500
Message-ID: <CAL_JsqJy2pOxhSPLZFe2+4vd5TUkZhN=79kox5sa0xR9uhjW6Q@mail.gmail.com>
Subject: Re: [PATCH RFC 4/4] arm64: boot: dts: update rtsm aemv8 dts with PSCI
 and idle states
From: Rob Herring <robherring2@gmail.com>
Content-Type: text/plain; charset=UTF-8
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Charles Garcia Tobin <Charles.Garcia-Tobin@arm.com>, Nicolas Pitre <nico@linaro.org>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>, Antti Miettinen <ananaza@iki.fi>, Stephen Boyd <sboyd@codeaurora.org>, Kevin Hilman <khilman@linaro.org>, Sebastian Capella <sebastian.capella@linaro.org>, Tomasz Figa <t.figa@samsung.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Mar 18, 2014 at 5:20 AM, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com> wrote:
> This patch updates the RTSM dts file with PSCI bindings and nodes
> describing the AEMv8 model idle states parameters.

How does one use this? Changing the enable-method implies some firmware/bootloader change.

This demonstates how the dtb must be tied to the firmware and not the kernel. 

Rob

>
> PSCI function IDs compliancy with PSCI v0.2 is still under development
> so this patch provides PSCI function IDs for demonstration purposes only.
>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> ---
>  arch/arm64/boot/dts/rtsm_ve-aemv8a.dts | 50 ++++++++++++++++++++++++++++------
>  1 file changed, 42 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rtsm_ve-aemv8a.dts b/arch/arm64/boot/dts/rtsm_ve-aemv8a.dts
> index d79de9c..7e2de34 100644
> --- a/arch/arm64/boot/dts/rtsm_ve-aemv8a.dts
> +++ b/arch/arm64/boot/dts/rtsm_ve-aemv8a.dts
> @@ -27,37 +27,71 @@
>                 serial3 = &v2m_serial3;
>         };
>
> +       psci {
> +               compatible = "arm,psci";
> +               method = "smc";
> +               /*
> +                * Function IDs usage and compliancy with PSCI v0.2 still
> +                * under discussion.  Current IDs should be considered
> +                * temporary for demonstration purposes.
> +                */
> +               cpu_suspend = <0x84000001>;
> +               cpu_off = <0x84000002>;
> +               cpu_on = <0x84000003>;
> +       };
> +
>         cpus {
>                 #address-cells = <2>;
>                 #size-cells = <0>;
>
> +               idle-states {
> +                       entry-method = "arm,psci";
> +
> +                       CLUSTER_SLEEP_0: cluster-sleep-0 {
> +                               compatible = "arm,idle-state";
> +                               index = <1>;
> +                               entry-method-param = <0x1010000>;
> +                               entry-latency-us = <500>;
> +                               exit-latency-us = <1000>;
> +                               min-residency-us = <2500>;
> +                               CPU_SLEEP_0: cpu-sleep-0 {
> +                                       compatible = "arm,idle-state";
> +                                       index = <0>;
> +                                       entry-method-param = <0x0010000>;
> +                                       entry-latency-us = <40>;
> +                                       exit-latency-us = <100>;
> +                                       min-residency-us = <150>;
> +                               };
> +                       };
> +               };
> +
>                 cpu@0 {
>                         device_type = "cpu";
>                         compatible = "arm,armv8";
>                         reg = <0x0 0x0>;
> -                       enable-method = "spin-table";
> -                       cpu-release-addr = <0x0 0x8000fff8>;
> +                       enable-method = "psci";
> +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>                 };
>                 cpu@1 {
>                         device_type = "cpu";
>                         compatible = "arm,armv8";
>                         reg = <0x0 0x1>;
> -                       enable-method = "spin-table";
> -                       cpu-release-addr = <0x0 0x8000fff8>;
> +                       enable-method = "psci";
> +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>                 };
>                 cpu@2 {
>                         device_type = "cpu";
>                         compatible = "arm,armv8";
>                         reg = <0x0 0x2>;
> -                       enable-method = "spin-table";
> -                       cpu-release-addr = <0x0 0x8000fff8>;
> +                       enable-method = "psci";
> +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>                 };
>                 cpu@3 {
>                         device_type = "cpu";
>                         compatible = "arm,armv8";
>                         reg = <0x0 0x3>;
> -                       enable-method = "spin-table";
> -                       cpu-release-addr = <0x0 0x8000fff8>;
> +                       enable-method = "psci";
> +                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
>                 };
>         };
>
> --
> 1.8.4
>
>
