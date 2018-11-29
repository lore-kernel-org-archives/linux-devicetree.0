From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: clk: meson: add main controller clock input
Date: Thu, 29 Nov 2018 15:43:26 -0800
Message-ID: <154353500665.88331.5525788751558555940@swboyd.mtv.corp.google.com>
References: <20181129164524.18670-1-jbrunet@baylibre.com>
 <20181129164524.18670-3-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181129164524.18670-3-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Jerome Brunet (2018-11-29 08:45:23)
> Add the clock input of the main clock controller
> =

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt | 3 +++
>  1 file changed, 3 insertions(+)
> =

> diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.tx=
t b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
> index e950599566a9..79454869f96d 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
> +++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
> @@ -9,6 +9,8 @@ Required Properties:
>                 "amlogic,gxbb-clkc" for GXBB SoC,
>                 "amlogic,gxl-clkc" for GXL and GXM SoC,
>                 "amlogic,axg-clkc" for AXG SoC.
> +- clocks: phandle to the input clock of the controller, presumably the
> +         platform xtal.

Any reason to not have clock-names? I'd prefer to have them because then
we can easily hook up providers with their parents based on strings. I
suppose we'll have to support both modes of strings and numbers for
connections, but that may be more for legacy reasons that could be
avoided here if a clock-names property existed.

>  =

>  - #clock-cells: should be 1.
> =20
