From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 5.2 v2 2/2] dt-binding: edac: add NPCM ECC documentation
Date: Mon, 8 Jul 2019 19:40:58 -0600
Message-ID: <20190709014058.GA30269@bogus>
References: <20190605141253.38554-1-ghung.quanta@gmail.com>
 <20190605141253.38554-2-ghung.quanta@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190605141253.38554-2-ghung.quanta@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: George Hung <ghung.quanta@gmail.com>
Cc: linux-edac <linux-edac@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, benjaminfair@google.com, wak@google.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Mark Rutland <mark.rutland@arm.com>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, James Morse <james.morse@arm.com>, davem@davemloft.net, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, paulmck@linux.ibm.com, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 05, 2019 at 10:12:53PM +0800, George Hung wrote:
> Add device tree documentation for Nuvoton BMC ECC
> 
> Signed-off-by: George Hung <ghung.quanta@gmail.com>
> ---
>  .../bindings/edac/npcm7xx-sdram-edac.txt        | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
> 
> diff --git a/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt b/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
> new file mode 100644
> index 000000000000..dd4dac59a5bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/npcm7xx-sdram-edac.txt
> @@ -0,0 +1,17 @@
> +Nuvoton NPCM7xx SoC EDAC device driver
> +
> +The Nuvoton NPCM7xx SoC supports DDR4 memory with/without ECC and the driver
> +uses the EDAC framework to implement the ECC detection and corrtection.
> +
> +Required properties:
> +- compatible:	should be "nuvoton,npcm7xx-sdram-edac"

Is this for the whole SDRAM controller or just ECC related registers? 
In the former case, the naming should just reflect the block name and 
not a Linux term.

> +- reg:		Memory controller register set should be <0xf0824000 0x1000>
> +- interrupts:	should be MC interrupt #25
> +
> +Example:
> +
> +	mc: memory-controller@f0824000 {
> +		compatible = "nuvoton,npcm7xx-sdram-edac";
> +		reg = <0xf0824000 0x1000>;
> +		interrupts = <0 25 4>;
> +	};
> -- 
> 2.21.0
> 
