From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH 5/5] dt-bindings: add Atmel SHA204A I2C crypto processor
Date: Thu, 16 May 2019 18:06:05 +0200
Message-ID: <CAKv+Gu96ZVOXSp+3nHrPOoQUJRNgW5MG8wOv_Refyo8yL54RjA@mail.gmail.com>
References: <20190430162910.16771-1-ard.biesheuvel@linaro.org>
 <20190430162910.16771-6-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190430162910.16771-6-ard.biesheuvel@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, Devicetree List <devicetree@vger.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Joakim Bech <joakim.bech@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

(+ devicetree list)

On Tue, 30 Apr 2019 at 18:29, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> Add a compatible string for the Atmel SHA204A I2C crypto processor.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> ---
>  Documentation/devicetree/bindings/crypto/atmel-crypto.txt | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/crypto/atmel-crypto.txt b/Documentation/devicetree/bindings/crypto/atmel-crypto.txt
> index 6b458bb2440d..a93d4b024d0e 100644
> --- a/Documentation/devicetree/bindings/crypto/atmel-crypto.txt
> +++ b/Documentation/devicetree/bindings/crypto/atmel-crypto.txt
> @@ -79,3 +79,16 @@ atecc508a@c0 {
>         compatible = "atmel,atecc508a";
>         reg = <0xC0>;
>  };
> +
> +* Symmetric Cryptography (I2C)
> +
> +Required properties:
> +- compatible : must be "atmel,atsha204a".
> +- reg: I2C bus address of the device.
> +- clock-frequency: must be present in the i2c controller node.
> +
> +Example:
> +atsha204a@c0 {
> +       compatible = "atmel,atsha204a";
> +       reg = <0xC0>;
> +};
> --
> 2.20.1
>

If there are no objections to this patch, may I please have an ack?
