From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] riscv: Add cpu topology DT entry.
Date: Tue, 25 Jun 2019 02:39:29 -0700 (PDT)
Message-ID: <mhng-cbc0fa82-4c3e-4d7a-af9a-c730f7e3a3f1@palmer-si-x1e>
References: <20190624223819.14320-1-atish.patra@wdc.com>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624223819.14320-1-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, anup@brainfault.org, Atish Patra <Atish.Patra@wdc.com>, yash.shah@sifive.com, robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, 24 Jun 2019 15:38:19 PDT (-0700), Atish Patra wrote:
> Currently, there is no CPU topology defined for RISC-V.
> The following series adds topology support in RISC-V.
>
> http://lists.infradead.org/pipermail/linux-riscv/2019-June/005072.html
>
> Add a DT node for unleashed that describes the CPU topology
> present in HiFive Unleashed.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> index 83f40b00ab63..907564f4f07a 100644
> --- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> @@ -22,6 +22,24 @@
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  		timebase-frequency = <1000000>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu1>;
> +				};
> +				core1 {
> +					cpu = <&cpu2>;
> +				};
> +				core2 {
> +					cpu = <&cpu3>;
> +				};
> +				core3 {
> +					cpu = <&cpu4>;
> +				};
> +			};
> +		};
> +
>  		cpu0: cpu@0 {
>  			compatible = "sifive,e51", "sifive,rocket0", "riscv";
>  			device_type = "cpu";

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
