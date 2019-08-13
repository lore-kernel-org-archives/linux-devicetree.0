From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: mfd: Convert Allwinner GPADC bindings to
 a schema
Date: Tue, 13 Aug 2019 15:28:01 -0600
Message-ID: <CAL_Jsq+QxsxxCsaJ8GjSQhKVHnas3WqjOPnv86=-fWs143CUQg@mail.gmail.com>
References: <20190813124744.32614-1-mripard@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813124744.32614-1-mripard@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 6:47 AM Maxime Ripard <mripard@kernel.org> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> The Allwinner SoCs have an embedded GPADC that is doing thermal reading as
> well, supported in Linux, with a matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../iio/adc/allwinner,sun8i-a33-ths.yaml      | 43 +++++++++++
>  .../bindings/mfd/allwinner,sun4i-a10-ts.yaml  | 76 +++++++++++++++++++
>  .../devicetree/bindings/mfd/sun4i-gpadc.txt   | 59 --------------
>  3 files changed, 119 insertions(+), 59 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun8i-a33-ths.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/allwinner,sun4i-a10-ts.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt

Reviewed-by: Rob Herring <robh@kernel.org>
