From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: watchdog: Convert Allwinner watchdog
 to a schema
Date: Mon, 19 Aug 2019 14:06:03 -0500
Message-ID: <CAL_JsqKKFfSifovSSfdtMh_buxnZ3ZPS5NGfi1eU8P0FE6S+zA@mail.gmail.com>
References: <20190819182039.24892-1-mripard@kernel.org> <20190819182039.24892-2-mripard@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190819182039.24892-2-mripard@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 19, 2019 at 1:20 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> The Allwinner SoCs have a watchdog supported in Linux, with a matching
> Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v1:
>   - Use generic watchdog schema
>   - Use unevaluatedProperties instead of additionalProperties
> ---
>  .../watchdog/allwinner,sun4i-a10-wdt.yaml     | 48 +++++++++++++++++++
>  .../bindings/watchdog/sunxi-wdt.txt           | 22 ---------
>  2 files changed, 48 insertions(+), 22 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt

Reviewed-by: Rob Herring <robh@kernel.org>
