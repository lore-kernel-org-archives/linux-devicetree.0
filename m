From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/2] reset: meson: add g12a and generic compatible string
Date: Mon, 28 Jan 2019 15:15:19 +0100
Message-ID: <8ad946b3-db95-5cd3-efc7-4971ed13ce89@baylibre.com>
References: <20190128141330.21927-1-jbrunet@baylibre.com>
 <20190128141330.21927-3-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190128141330.21927-3-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 28/01/2019 15:13, Jerome Brunet wrote:
> Add a compatible for the new g12a SoC family.
> 
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
>  };
>  
> 

Tested-by: Neil Armstrong <narmstrong@baylibre.com>
