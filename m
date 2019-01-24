Return-Path: <SRS0=Zo2N=QA=nvidia.com=jonathanh@kernel.org>
Subject: Re: [PATCH V3 4/4] dt-bindings: firmware: Add bindings for Tegra210
 BPMP
References: <1548349435-1086-1-git-send-email-talho@nvidia.com>
 <1548349435-1086-5-git-send-email-talho@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <bd2e5bff-d425-51ef-070e-9a16d2f4efe4@nvidia.com>
Date: Thu, 24 Jan 2019 18:29:39 +0000
MIME-Version: 1.0
In-Reply-To: <1548349435-1086-5-git-send-email-talho@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Timo Alho <talho@nvidia.com>, treding@nvidia.com, sivaramn@nvidia.com, robh@kernel.org
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


On 24/01/2019 17:03, Timo Alho wrote:
> The BPMP is a specific processor in Tegra210 chip, which is designed
> for boot process handling, assisting in entering deep low power states
> (suspend to ram), and offloading DRAM memory clock scaling on some
> platforms.
> 
> Signed-off-by: Timo Alho <talho@nvidia.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/firmware/nvidia,tegra210-bpmp.txt     | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra210-bpmp.txt
> 
> diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra210-bpmp.txt b/Documentation/devicetree/bindings/firmware/nvidia,tegra210-bpmp.txt
> new file mode 100644
> index 0000000..632d492
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra210-bpmp.txt
> @@ -0,0 +1,36 @@
> +NVIDIA Tegra210 Boot and Power Management Processor (BPMP)
> +
> +The Boot and Power Management Processor (BPMP) is a co-processor found
> +in Tegra210 SoC. It is designed to handle the early stages of the boot
> +process as well as to assisting in entering deep low power state
> +(suspend to ram), and also offloading DRAM memory clock scaling on
> +some platforms. The binding document defines the resources that would
> +be used by the BPMP T210 firmware driver, which can create the
> +interprocessor communication (IPC) between the CPU and BPMP.
> +
> +Required properties:
> +- name : Should be bpmp
> +- compatible
> +    Array of strings
> +    One of:
> +    - "nvidia,tegra210-bpmp"
> +- reg: physical base address and length for HW synchornization primitives
> +       1) base address and length to Tegra 'atomics' hardware
> +       2) base address and length to Tegra 'semaphore' hardware
> +- interrupts: specifies the interrupt number for receiving messages ("rx")
> +              and for triggering messages ("tx")
> +
> +Optional properties:
> +- #clock-cells : Should be 1 for platforms where DRAM clock control is
> +                 offloaded to bpmp.
> +
> +Example:
> +
> +bpmp@70016000 {
> +	compatible = "nvidia,tegra210-bpmp";
> +	reg = <0x0 0x70016000 0x0 0x2000
> +	       0x0 0x60001000 0x0 0x1000>;
> +	interrupts = <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>,
> +		     <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
> +	interrupt-names = "tx", "rx";
> +};

Did you see my other comment about the 'name' property?

Cheers
Jon

-- 
nvpublic
