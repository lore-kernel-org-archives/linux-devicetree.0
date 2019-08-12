From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-binding: hwrng: add NPCM RNG documentation
Date: Mon, 12 Aug 2019 17:36:23 -0600
Message-ID: <20190812233623.GA24924@bogus>
References: <20190722150241.345609-1-tmaimon77@gmail.com>
 <20190722150241.345609-2-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190722150241.345609-2-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: mpm@selenic.com, herbert@gondor.apana.org.au, arnd@arndb.de, gregkh@linuxfoundation.org, mark.rutland@arm.com, avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com, yuenn@google.com, benjaminfair@google.com, sumit.garg@linaro.org, jens.wiklander@linaro.org, vkoul@kernel.org, tglx@linutronix.de, joel@jms.id.au, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 22, 2019 at 06:02:40PM +0300, Tomer Maimon wrote:
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

This would need a vendor prefix, however, I think it should be implied 
by the compatible string. It is fixed per SoC, right?
