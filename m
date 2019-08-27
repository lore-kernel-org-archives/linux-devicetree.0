From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/3] amlogic: arm: add Amlogic SM1 based Khadas VIM3
 variant bindings
Date: Tue, 27 Aug 2019 23:18:22 +0200
Message-ID: <CAFBinCBLxW2r-N0z10Z7uUpvdoPikkZ0Lca6J-NctGYXtuxb2Q@mail.gmail.com>
References: <20190823081427.17228-1-narmstrong@baylibre.com>
 <20190823081427.17228-3-narmstrong@baylibre.com> <CAFBinCBLVDVWPbDZ+_cPTbJNCavvzJH4A6U8D9XWVSR-j3fzFQ@mail.gmail.com>
 <c853d934-113c-2305-f229-1e2c7138fc3f@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c853d934-113c-2305-f229-1e2c7138fc3f@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 26, 2019 at 9:42 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> >> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> >> index b48ea1e4913a..2751dd778ce0 100644
> >> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> >> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> >> @@ -150,9 +150,10 @@ properties:
> >>            - const: amlogic,s922x
> >>            - const: amlogic,g12b
> >>
> >> -      - description: Boards with the Amlogic Meson SM1 S905X3 SoC
> >> +      - description: Boards with the Amlogic Meson SM1 S905X3/D3/Y3 SoC
> >>          items:
> >>            - enum:
> >>                - seirobotics,sei610
> >> +              - khadas,vim3
>
> Khadas asked me to rename the board to "vim3l", which is the commercial name,
> should I only change the DT name or also the compatible "khadas,vim3l" ?
I vote for being consistent:
- rename the .dts to vim3l
- and change the compatible string

> >>            - const: amlogic,sm1
> > on the GXL we differentiate between S905X and S905D
> > do we need to differentiate S905X3 from S905D3 (for example)?
>
> From a pure SoC die perspective they are the same, exactly like
> the S905X and S905D, only the package changes.
> So only the board DT will determine which eth PHY is used,
> if a DSI panel is connected, a demodulator is connected.. even
> if the underlying package is S905Y3 without any of these pins
> available.
OK, I see - fine for me then
GXL's S905W and/or S805X are the "special cases" then which (AFAIK)
use a different (smaller) package (so it made sense to differentiate
all GXL SoCs)


Martin
