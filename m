From: Avi Fishman <avifishman70@gmail.com>
Subject: Re: [PATCH 5.2 v2 2/2] dt-binding: edac: add NPCM ECC documentation
Date: Thu, 6 Jun 2019 10:41:46 +0300
Message-ID: <CAKKbWA71P+afSiWPoth90-Ydq4DBmxSK_yTRWSN+FPw10CqFAQ@mail.gmail.com>
References: <20190605141253.38554-1-ghung.quanta@gmail.com> <20190605141253.38554-2-ghung.quanta@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190605141253.38554-2-ghung.quanta@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: George Hung <ghung.quanta@gmail.com>
Cc: linux-edac <linux-edac@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Benjamin Fair <benjaminfair@google.com>, paulmck@linux.ibm.com, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, James Morse <james.morse@arm.com>, "William A. Kennington III" <wak@google.com>, davem@davemloft.net, Tomer Maimon <tom>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 5, 2019 at 5:19 PM George Hung <ghung.quanta@gmail.com> wrote:
>
> Add device tree documentation for Nuvoton BMC ECC
>
> Signed-off-by: George Hung <ghung.quanta@gmail.com>

Reviewed-by: Avi Fishman <avifishman70@gmail.com>

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
> +- compatible:  should be "nuvoton,npcm7xx-sdram-edac"
> +- reg:         Memory controller register set should be <0xf0824000 0x1000>
> +- interrupts:  should be MC interrupt #25
> +
> +Example:
> +
> +       mc: memory-controller@f0824000 {
> +               compatible = "nuvoton,npcm7xx-sdram-edac";
> +               reg = <0xf0824000 0x1000>;
> +               interrupts = <0 25 4>;
> +       };
> --
> 2.21.0
>


-- 
Regards,
Avi
