From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 1/2] dt: bindings: add binding for Allwinner A64 R_PIO
 pinctrl
Date: Tue, 16 Aug 2016 17:13:34 +0800
Message-ID: <CAGb2v65ca+HFq9Mr21E7QSN845O2H7BYKg5uAmRhECJe5dK6ag@mail.gmail.com>
References: <20160816050709.7412-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160816050709.7412-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andre Przywara <andre.przywara@arm.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Jens Kuske <jenskuske@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Krzysztof Adamski <k@japko.eu>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 16, 2016 at 1:07 PM, Icenowy Zheng <icenowy@aosc.xyz> wrote:
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Commit message please. :)

Something similar to the one in the pinctrl driver patch would do.

ChenYu

> ---
>  Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
> index 6961722..ee73f9f 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt
> @@ -23,6 +23,7 @@ Required properties:
>    "allwinner,sun8i-h3-pinctrl"
>    "allwinner,sun8i-h3-r-pinctrl"
>    "allwinner,sun50i-a64-pinctrl"
> +  "allwinner,sun50i-a64-r-pinctrl"
>
>  - reg: Should contain the register physical address and length for the
>    pin controller.
> --
> 2.9.2
>
