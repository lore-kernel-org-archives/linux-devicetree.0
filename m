From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: Correct RISC-V's timebase-frequency
Date: Fri, 14 Dec 2018 10:17:24 +0100
Message-ID: <5d652370-4782-23b2-9896-b9666b3cc1e7@linaro.org>
References: <1544742869-19980-1-git-send-email-atish.patra@wdc.com>
 <1544742869-19980-2-git-send-email-atish.patra@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544742869-19980-2-git-send-email-atish.patra@wdc.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org
Cc: Palmer Dabbelt <palmer@sifive.com>, Christoph Hellwig <hch@lst.de>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, Dmitriy Cherkasov <dmitriy@oss-tech.org>, linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, Damien Le Moal <Damien.LeMoal@wdc.com>, Christoph Hellwig <hch@infradead.org>
List-Id: devicetree@vger.kernel.org

On 14/12/2018 00:14, Atish Patra wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
> 
> In RISC-V systems, timebase-frequency is per cpu instead of one
> instance for entire SOC as there is a individual timer per each CPU.
> Fix the DT binding accordingly.

Why not use a fixed-clock instead of this timebase property which forces
to declare a global variable to be exported from arch/riscv to
drivers/clocksource ?

In addition, please add the 'Fixes' tag

> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> [Atish: Update the commit text]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt b/Documentation/devicetree/bindings/riscv/cpus.txt
> index adf7b7af..b0b038d6 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.txt
> +++ b/Documentation/devicetree/bindings/riscv/cpus.txt
> @@ -93,9 +93,9 @@ Linux is allowed to run on.
>          cpus {
>                  #address-cells = <1>;
>                  #size-cells = <0>;
> -                timebase-frequency = <1000000>;
>                  cpu@0 {
>                          clock-frequency = <1600000000>;
> +                        timebase-frequency = <1000000>;
>                          compatible = "sifive,rocket0", "riscv";
>                          device_type = "cpu";
>                          i-cache-block-size = <64>;
> @@ -113,6 +113,7 @@ Linux is allowed to run on.
>                  };
>                  cpu@1 {
>                          clock-frequency = <1600000000>;
> +                        timebase-frequency = <1000000>;
>                          compatible = "sifive,rocket0", "riscv";
>                          d-cache-block-size = <64>;
>                          d-cache-sets = <64>;
> @@ -145,6 +146,7 @@ Example: Spike ISA Simulator with 1 Hart
>  This device tree matches the Spike ISA golden model as run with `spike -p1`.
>  
>          cpus {
> +                timebase-frequency = <1000000>;
>                  cpu@0 {
>                          device_type = "cpu";
>                          reg = <0x00000000>;





-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
