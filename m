Return-Path: <SRS0=B+JU=HH=codeaurora.org=sricharan@kernel.org>
Subject: Re: [PATCH] ARM: dts: ipq4019: Add TZ and SMEM reserved regions
References: <20180418073259.18645-1-sven.eckelmann@openmesh.com>
From: Sricharan R <sricharan@codeaurora.org>
Message-ID: <01032000-538d-d8b2-9a76-c74b0e89b3f1@codeaurora.org>
Date: Wed, 18 Apr 2018 14:08:23 +0530
MIME-Version: 1.0
In-Reply-To: <20180418073259.18645-1-sven.eckelmann@openmesh.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Sven Eckelmann <sven.eckelmann@openmesh.com>, linux-arm-msm@vger.kernel.org
Cc: linux-soc@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Andy Gross <andy.gross@linaro.org>, Sricharan Ramabadhran <srichara@qti.qualcomm.com>, Senthilkumar N L <snlakshm@qti.qualcomm.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

On 4/18/2018 1:02 PM, Sven Eckelmann wrote:
> The QSEE (trustzone) is started on IPQ4019 before Linux is started.
> According to QCA, it is placed in in the the memory region
> 0x87e80000-0x88000000 and must not be accessed directly. There is an
> additional memory region 0x87e00000-0x87E80000 smem which which can be used
> for communication with the TZ. The driver for the latter is not yet ready
> but it is still not allowed to use this memory region like any other
> memory region.
> 
> Not reserving this memory region either leads to kernel crashes, kernel
> hangs (often during the boot) or bus errors for userspace programs. The
> latter happens when a program is using a memory region which is mapped to
> these physical memory regions.
> 
>   [  571.758058] Unhandled fault: imprecise external abort (0xc06) at 0x01715ff8
>   [  571.758099] pgd = cebec000
>   [  571.763826] [01715ff8] *pgd=8e7fa835, *pte=87e7f75f, *ppte=87e7fc7f
>   Bus error
> 
> Signed-off-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
> ---

 Acked-by: Sricharan R <sricharan@codeaurora.org>

Regards,
 Sricharan

> Cc: Sricharan Ramabadhran <srichara@qti.qualcomm.com>
> Cc: Senthilkumar N L <snlakshm@qti.qualcomm.com>
> 
> There are additional memory regions which have to be initialized first by
> Linux. So they are currently not used. We were told by QCA that the
> features QSDK uses them for are:
> 
> * crash dump feature
>   - a couple of regions used when 'qca,scm_restart_reason' dt node has the
>     value 'dload_status' not set to 1
>     + apps_bl <0x87000000 0x400000>
>     + sbl <0x87400000 0x100000>
>     + cnss_debug <0x87400000 0x100000>
>     + cpu_context_dump <0x87b00000 0x080000>
>   - required driver not available in Linux
>   - safe to remove
> * QSEE app execution
>   - region tz_apps <0x87b80000 0x280000>
>   - required driver not available in Linux
>   - safe to remove
> * communication with TZ/QSEE
>   - region smem <0x87b80000 0x280000>
>   - driver changes not yet upstreamed
>   - must not be removed because any access can crash kernel/program
> * trustzone (QSEE) private memory
>   - region tz <0x87e80000 0x180000>
>   - must not be removed because any access can crash kernel/program
> 
> The problem with the missing regions was reported in 2016 [1]. So maybe
> this change qualifies for a stable@vger.kernel.org submission.
> 
> [1] https://www.spinics.net/lists/linux-arm-msm/msg21536.html
> ---
>  arch/arm/boot/dts/qcom-ipq4019.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> index 10d112a4078e..b25daf368012 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> @@ -23,6 +23,22 @@
>  	compatible = "qcom,ipq4019";
>  	interrupt-parent = <&intc>;
>  
> +	reserved-memory {
> +		#address-cells = <0x1>;
> +		#size-cells = <0x1>;
> +		ranges;
> +
> +		smem_region: smem@87e00000 {
> +			reg = <0x87e00000 0x080000>;
> +			no-map;
> +		};
> +
> +		tz@87e80000 {
> +			reg = <0x87e80000 0x180000>;
> +			no-map;
> +		};
> +	};
> +
>  	aliases {
>  		spi0 = &spi_0;
>  		i2c0 = &i2c_0;
> 

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
