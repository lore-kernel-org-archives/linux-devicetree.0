From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/3] amlogic: arm: add Amlogic SM1 based Khadas VIM3
 variant bindings
Date: Sun, 25 Aug 2019 21:51:22 +0200
Message-ID: <CAFBinCBLVDVWPbDZ+_cPTbJNCavvzJH4A6U8D9XWVSR-j3fzFQ@mail.gmail.com>
References: <20190823081427.17228-1-narmstrong@baylibre.com> <20190823081427.17228-3-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190823081427.17228-3-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Neil,

the subject should be: dt-bindings: arm: amlogic: ...

On Fri, Aug 23, 2019 at 10:15 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The Khadas VIM3 is also available with the Pin-to-pin compatible
> Amlogic SM1 SoC in the S905D3 variant package.
>
> Change the description to match the S905X3/D3/Y3 variants like the G12A
> description, and add the vim3 compatible.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> index b48ea1e4913a..2751dd778ce0 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -150,9 +150,10 @@ properties:
>            - const: amlogic,s922x
>            - const: amlogic,g12b
>
> -      - description: Boards with the Amlogic Meson SM1 S905X3 SoC
> +      - description: Boards with the Amlogic Meson SM1 S905X3/D3/Y3 SoC
>          items:
>            - enum:
>                - seirobotics,sei610
> +              - khadas,vim3
>            - const: amlogic,sm1
on the GXL we differentiate between S905X and S905D
do we need to differentiate S905X3 from S905D3 (for example)?


Martin
