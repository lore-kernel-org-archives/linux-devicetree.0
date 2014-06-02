From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] rtc: hym8563: add optional clock-output-names property
Date: Mon, 02 Jun 2014 14:33:58 -0700
Message-ID: <20140602213358.10062.55182@quantum>
References: <5506235.fsodQ5dNGb@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5506235.fsodQ5dNGb@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Alessandro Zummo <a.zummo@towertech.it>, Andrew Morton <akpm@linux-foundation.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Heiko St=C3=BCbner (2014-05-18 15:40:07)
> This enables the setting of a custom clock name for the clock provide=
d by
> the hym8563 rtc.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Annoying nitpick: would be nice to see the example updated to use
clock-output-names. But it's not a deal breaker.

Reviewed-by: Mike Turquette <mturquette@linaro.org>

Regards,
Mike

> ---
>  Documentation/devicetree/bindings/rtc/haoyu,hym8563.txt | 3 +++
>  drivers/rtc/rtc-hym8563.c                               | 3 +++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/haoyu,hym8563.txt =
b/Documentation/devicetree/bindings/rtc/haoyu,hym8563.txt
> index 31406fd..5c199ee 100644
> --- a/Documentation/devicetree/bindings/rtc/haoyu,hym8563.txt
> +++ b/Documentation/devicetree/bindings/rtc/haoyu,hym8563.txt
> @@ -9,6 +9,9 @@ Required properties:
>  - interrupts: rtc alarm/event interrupt
>  - #clock-cells: the value should be 0
> =20
> +Optional properties:
> +- clock-output-names: From common clock binding
> +
>  Example:
> =20
>  hym8563: hym8563@51 {
> diff --git a/drivers/rtc/rtc-hym8563.c b/drivers/rtc/rtc-hym8563.c
> index e5f13c4..6442b5b 100644
> --- a/drivers/rtc/rtc-hym8563.c
> +++ b/drivers/rtc/rtc-hym8563.c
> @@ -418,6 +418,9 @@ static struct clk *hym8563_clkout_register_clk(st=
ruct hym8563 *hym8563)
>         init.num_parents =3D 0;
>         hym8563->clkout_hw.init =3D &init;
> =20
> +       /* optional override of the clockname */
> +       of_property_read_string(node, "clock-output-names", &init.nam=
e);
> +
>         /* register the clock */
>         clk =3D clk_register(&client->dev, &hym8563->clkout_hw);
> =20
> --=20
> 1.9.0
>=20
>=20
