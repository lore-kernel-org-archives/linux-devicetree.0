From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 2/2] reset: meson: add g12a compatible string
Date: Tue, 29 Jan 2019 16:12:10 +0100
Message-ID: <7hwomno5v9.fsf@baylibre.com>
References: <20190128181316.30814-1-jbrunet@baylibre.com> <20190128181316.30814-3-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190128181316.30814-3-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Add a compatible for the new g12a SoC family.
>
> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/reset/reset-meson.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index 5242e0679df7..a8f6549b3af4 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -134,6 +134,7 @@ static const struct of_device_id meson_reset_dt_ids[] = {
>  	 { .compatible = "amlogic,meson8b-reset" },
>  	 { .compatible = "amlogic,meson-gxbb-reset" },
>  	 { .compatible = "amlogic,meson-axg-reset" },
> +	 { .compatible = "amlogic,meson-g12a-reset" },
>  	 { /* sentinel */ },

Looks like this new compatiable isn't used for anything new in the
driver.  Let's not add a new compatible unless it's needed fo rnew
behavior.

Kevin
