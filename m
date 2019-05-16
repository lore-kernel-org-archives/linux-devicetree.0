From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 3/3] fdt: add support for rng-seed
Date: Thu, 16 May 2019 08:39:56 -0700
Message-ID: <932a02f2-a1d3-a8d7-c7a4-2891024d10a2@infradead.org>
References: <20190516102817.188519-1-hsinyi@chromium.org>
 <20190516102817.188519-3-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516102817.188519-3-hsinyi@chromium.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Miles Chen <miles.chen@mediatek.com>, James Morse <james.morse@arm.com>, Andrew Murray <andrew.murray@arm.com>, Mark Rutland <mark.rutland@arm.com>, Chintan Pandya <cpandya@codeaurora.org>, Jun Yao <yaojun8558363@gmail.com>, Yu Zhao <yuzhao@google.com>, Robin Murphy <robin.murphy@arm.com>, Laura Abbott <labbott@redhat.com>, Stephen Boyd <swboyd@chromium.org>, Kees Cook <keescook@chromium.org>
List-Id: devicetree@vger.kernel.org

On 5/16/19 3:28 AM, Hsin-Yi Wang wrote:
> Introducing a chosen node, rng-seed, which is an entropy that can be
> passed to kernel called very early to increase initial device
> randomness. Bootloader should provide this entropy and the value is
> read from /chosen/rng-seed in DT.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> change v2->v3:
> 1. use arch hook for fdt pgprot change
> 2. handle CONFIG_KEXEC
> ---
>  Documentation/devicetree/bindings/chosen.txt | 14 +++++
>  drivers/of/fdt.c                             | 55 ++++++++++++++++++++
>  2 files changed, 69 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/chosen.txt b/Documentation/devicetree/bindings/chosen.txt
> index 45e79172a646..fef5c82672dc 100644
> --- a/Documentation/devicetree/bindings/chosen.txt
> +++ b/Documentation/devicetree/bindings/chosen.txt
> @@ -28,6 +28,20 @@ mode) when EFI_RNG_PROTOCOL is supported, it will be overwritten by
>  the Linux EFI stub (which will populate the property itself, using
>  EFI_RNG_PROTOCOL).
>  
> +rng-seed
> +-----------
> +
> +This property served as an entropy to add device randomness. It is parsed

                 serves


> +as a byte array, e.g.
> +
> +/ {
> +	chosen {
> +		rng-seed = <0x31 0x95 0x1b 0x3c 0xc9 0xfa 0xb3 ...>;
> +	};
> +};
> +
> +This random value should be provided by bootloader.
> +
>  stdout-path
>  -----------
>  



-- 
~Randy
