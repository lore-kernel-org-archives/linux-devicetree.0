From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] dt-bindings: Add an enable method to RISC-V
Date: Wed, 20 Dec 2017 10:13:57 -0600
Message-ID: <20171220161357.g4bix2xeovxm7izs@rob-hp-laptop>
References: <20171207230523.29798-1-palmer@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171207230523.29798-1-palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-q3qR2WxjNRFS9aJRtSZj7A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 07, 2017 at 03:05:23PM -0800, Palmer Dabbelt wrote:
> RISC-V doesn't currently specify a mechanism for enabling or disabling
> CPUs.  Instead, we assume that all CPUs are enabled on boot, and if
> someone wants to save power we instead put a CPU to sleep via a WFI
> loop.  Future systems may have an explicit mechanism for putting a CPU
> to sleep, so we're standardizing the device tree entry for when that
> happens.
> 
> We're not defining a spin-table based interface to the firmware, as the
> plan is to handle this entirely within the kernel instead.
> 
> CC: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Signed-off-by: Palmer Dabbelt <palmer-SpMDHPYPyPbQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt b/Documentation/devicetree/bindings/riscv/cpus.txt
> index adf7b7af5dc3..68f88eacc594 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.txt
> +++ b/Documentation/devicetree/bindings/riscv/cpus.txt
> @@ -82,6 +82,15 @@ described below.
>                  Value type: <string>
>                  Definition: Contains the RISC-V ISA string of this hart.  These
>                              ISA strings are defined by the RISC-V ISA manual.
> +        - cpu-enable-method:
> +                Usage: optional
> +                Value type: <stringlist>
> +                Definition: When absent, default is either "always-disabled"
> +                            "always-enabled", depending on the current state
> +                            of the CPU.

How does one determine the state of other cpus?

> +                            Must be one of:
> +                                * "always-disabled": This CPU cannot be enabled.

status = "disabled" already serves this purpose.

> +                                * "always-enabled": This CPU cannot be disabled.

I don't see how this can work unless the kernel is loaded prior to 
bringing all cpus out of reset. You have to halt cpus in some way until 
the kernel is loaded.

>  
>  Example: SiFive Freedom U540G Development Kit
>  ---------------------------------------------
> -- 
> 2.13.6
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
