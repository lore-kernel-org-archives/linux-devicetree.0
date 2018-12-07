From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH 1/4] dt-bindings: Correct RISC-V's timebase-frequency
Date: Fri, 07 Dec 2018 08:29:23 -0800 (PST)
Message-ID: <mhng-a15b587e-3bfe-4568-8262-dc421585bc36@palmer-si-x1c4>
References: <1543870651-16669-2-git-send-email-atish.patra@wdc.com>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543870651-16669-2-git-send-email-atish.patra@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, aou@eecs.berkeley.edu, atish.patra@wdc.com, daniel.lezcano@linaro.org, devicetree@vger.kernel.org, dmitriy@oss-tech.org, linux-riscv@lists.infradead.org, mark.rutland@arm.com, robh+dt@kernel.org, tglx@linutronix.de, anup@brainfault.org, Damien.LeMoal@wdc.com
List-Id: devicetree@vger.kernel.org

On Mon, 03 Dec 2018 12:57:28 PST (-0800), atish.patra@wdc.com wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
>
> Someone must have read the device tree specification incorrectly,
> because we were putting timebase-frequency in the wrong place.  This
> corrects the issue, moving it from
>
> / {
>         cpus {
>                 timebase-frequency = X;
>         }
> }
>
> to
>
> / {
>         cpus {
>                 cpu@0 {
>                         timebase-frequency = X;
>                 }
>         }
> }
>
> This is great, because the timer's frequency should really be a per-cpu
> quantity on RISC-V systems since there's a timer per CPU.  This should
> lead to some cleanups in our timer driver.

I think I was actually wrong here: the top version is preferred if 
timebase-frequency is the same between all CPUs, while the bottom is if it's 
different.

Updating the documentation is still good, because it matches the hardware, but 
the commit message should be a bit less assertive... :)

> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
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
