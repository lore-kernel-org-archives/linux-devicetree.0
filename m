MIME-Version: 1.0
Date: Fri, 9 Aug 2019 11:07:29 -0600
References: <20190809121918.25047-1-sr@denx.de>
	<20190809121918.25047-2-sr@denx.de>
In-Reply-To: <20190809121918.25047-2-sr@denx.de>
Message-ID: <CAL_JsqJmcHWq8LA6CrTJEV2Pi58+6yO_ND61MNA_=LrOa33Psg@mail.gmail.com>
Subject: Re: [PATCH 2/3 v3] dt-bindings: mips: Add gardena vendor prefix and
 board description
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Stefan Roese <sr@denx.de>
Cc: linux-mips@vger.kernel.org, Paul Burton <paul.burton@mips.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Aug 9, 2019 at 6:19 AM Stefan Roese <sr@denx.de> wrote:
>
> This patch adds the vendor prefix for gardena and a short description
> including the compatible string for the "GARDENA smart Gateway" based
> on the MT7688 SoC.
>
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
> v3:
> - New patch
>
>  .../devicetree/bindings/mips/ralink/gardena.txt          | 9 +++++++++
>  Documentation/devicetree/bindings/vendor-prefixes.yaml   | 2 ++
>  2 files changed, 11 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/ralink/gardena.txt

Please add to ralink.txt rather than a new file. Ideally, that would
be converted to DT schema first, but given this is v3 already I won't
require that. A binding file per board vendor doesn't scale well and
will be a lot of duplication for schemas.

> diff --git a/Documentation/devicetree/bindings/mips/ralink/gardena.txt b/Documentation/devicetree/bindings/mips/ralink/gardena.txt
> new file mode 100644
> index 000000000000..4022fe61a8ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/ralink/gardena.txt
> @@ -0,0 +1,9 @@
> +GARDENA smart Gateway (MT7688)
> +
> +This board is based on the MediaTek MT7688 and equipped with 128 MiB
> +of DDR and 8 MiB of flash (SPI NOR) and additional 128MiB SPI NAND
> +storage.
> +
> +------------------------------
> +Required root node properties:
> +- compatible = "gardena,smartGatewayMT7688";

You need an SoC compatible for MT7688 which isn't documented either.

Rob
