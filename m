From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: amlogic: Add Internal Clock Measurer bindings
Date: Sat, 17 Nov 2018 21:32:20 +0100
Message-ID: <CAFBinCAD=muhsHgqGu2pV8T=EyfnEKrocyVWf536nbL0pa5y7A@mail.gmail.com>
References: <20181114131627.17766-1-narmstrong@baylibre.com> <20181114131627.17766-2-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181114131627.17766-2-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Neil,

On Wed, Nov 14, 2018 at 2:16 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The Amlogic Meson GX SoCs embeds a clock measurer IP to measure the internal
> clock paths frequencies.
I would skip the "GX" in that sentence: there's a similar (identical?)
clock measurer in Meson6, Meson8, Meson8b and Meson8m2 as well

>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
with the comment above and below:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  .../bindings/soc/amlogic/clk-measure.txt          | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
>
> diff --git a/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt b/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
> new file mode 100644
> index 000000000000..ba9183a42032
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
> @@ -0,0 +1,15 @@
> +Amlogic Internal Clock Measurer
> +===============================
> +
> +The Amlogic SoCs contains an IP to measure the internal clocks.
> +The precision is multiple of MHz, useful to debug the clock states.
> +
> +Required properties:
> +- compatible: Shall contain "amlogic,meson-gx-clk-measure"
can you please add "amlogic,meson8-clk-measure" and
"amlogic,meson8b-clk-measure" as well?
(I will provide a patch on top of yours to add Meson8 and Meson8b support)


Regards
Martin
