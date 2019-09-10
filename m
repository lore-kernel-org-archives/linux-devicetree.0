From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-binding: hwrng: add NPCM RNG documentation
Date: Tue, 10 Sep 2019 11:25:05 +0100
Message-ID: <20190910102505.vgyomi575ldrk2lq@holly.lan>
References: <20190909123840.154745-1-tmaimon77@gmail.com>
 <20190909123840.154745-2-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190909123840.154745-2-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: mpm@selenic.com, herbert@gondor.apana.org.au, arnd@arndb.de, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com, yuenn@google.com, benjaminfair@google.com, sumit.garg@linaro.org, jens.wiklander@linaro.org, vkoul@kernel.org, tglx@linutronix.de, joel@jms.id.au, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 09, 2019 at 03:38:39PM +0300, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton BMC
> NPCM Random Number Generator (RNG).
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/rng/nuvoton,npcm-rng.txt           | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> 
> diff --git a/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> new file mode 100644
> index 000000000000..a697b4425fb3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
> @@ -0,0 +1,17 @@
> +NPCM SoC Random Number Generator
> +
> +Required properties:
> +- compatible  : "nuvoton,npcm750-rng" for the NPCM7XX BMC.
> +- reg         : Specifies physical base address and size of the registers.
> +
> +Optional property:
> +- quality : estimated number of bits of true entropy per 1024 bits
> +			read from the rng.
> +			If this property is not defined, it defaults to 1000.

There are pending unreplied review comments about this property (my own
as it happens):
https://patchwork.kernel.org/patch/11119371/


Daniel.

> +
> +Example:
> +
> +rng: rng@f000b000 {
> +	compatible = "nuvoton,npcm750-rng";
> +	reg = <0xf000b000 0x8>;
> +};
> -- 
> 2.18.0
> 
