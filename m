From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Documentation: dt: chosen property for kaslr-seed
Date: Mon, 17 Jul 2017 14:32:58 -0500
Message-ID: <20170717193258.zim7rjh2cfgb6t5e@rob-hp-laptop>
References: <20170715003836.GA113132@beast>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170715003836.GA113132@beast>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Matt Redfearn <matt.redfearn-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 14, 2017 at 05:38:36PM -0700, Kees Cook wrote:
> Document then /chosen/kaslr-seed property (and its interaction with the

s/then/the/

> EFI_RNG_PROTOCOL API).

"dt-bindings: chosen: ..." for the subject.

> 
> Signed-off-by: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/chosen.txt | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
> index dee3f5d9df26..0cdb43b268e5 100644
> --- a/Documentation/devicetree/bindings/chosen.txt
> +++ b/Documentation/devicetree/bindings/chosen.txt
> @@ -5,9 +5,27 @@ The chosen node does not represent a real device, but serves as a place
>  for passing data between firmware and the operating system, like boot
>  arguments. Data in the chosen node does not represent the hardware.
>  
> +The following properties are recognized:
>  
> -stdout-path property
> ---------------------
> +
> +kaslr-seed
> +-----------

Is there some reason we would not feed this to other things needing 
entropy and therefore should have a more generic name?

> +
> +This property is used when booting with CONFIG_RANDOMIZE_BASE to seed
> +the entropy used to randomize the kernel image base address location. It
> +is parsed as a u64 value, e.g.

Why limit the size to 64-bit and why does it matter how the data is 
interpretted? 

> +
> +/ {
> +	chosen {
> +		kaslr-seed = <0xfeedbeef 0xc0def00d>;
> +	};
> +};
> +
> +Note that when booting through EFI when EFI_RNG_PROTOCOL is supported,
> +this value will be overwritten by the EFI stub.

Isn't this always true? The bootloader will overwrite. Just in the EFI 
case, the EFI stub is part of the bootloader from a functional (and not 
packaging) standpoint.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
