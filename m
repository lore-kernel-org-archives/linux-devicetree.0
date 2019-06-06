From: James Morse <james.morse@arm.com>
Subject: Re: [PATCH 5.2 v2 2/2] dt-binding: edac: add NPCM ECC documentation
Date: Thu, 6 Jun 2019 16:46:33 +0100
Message-ID: <066d3d9b-f65e-7689-a3a7-d995e26fcbf3@arm.com>
References: <20190605141253.38554-1-ghung.quanta@gmail.com>
 <20190605141253.38554-2-ghung.quanta@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190605141253.38554-2-ghung.quanta@gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: George Hung <ghung.quanta@gmail.com>
Cc: linux-edac <linux-edac@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, benjaminfair@google.com, wak@google.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, davem@davemloft.net, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, paulmck@linux.ibm.com, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
List-Id: devicetree@vger.kernel.org

Hi George,

On 05/06/2019 15:12, George Hung wrote:
> Add device tree documentation for Nuvoton BMC ECC

(Nit: The DT folk prefer patches adding bindings to come first in the series, before the
driver that uses them).


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

The commit message in the driver says this is a Cadence memory controller, can we describe
what it is here, and give it an additional compatible?


Thanks,

James

> +Required properties:
> +- compatible:	should be "nuvoton,npcm7xx-sdram-edac"
> +- reg:		Memory controller register set should be <0xf0824000 0x1000>
> +- interrupts:	should be MC interrupt #25
> +Example:
> +
> +	mc: memory-controller@f0824000 {
> +		compatible = "nuvoton,npcm7xx-sdram-edac";
> +		reg = <0xf0824000 0x1000>;
> +		interrupts = <0 25 4>;
> +	};
> 
