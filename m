From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] clk: meson: axg-audio: fix input clock name
Date: Tue, 11 Dec 2018 16:06:00 +0100
Message-ID: <79f49d43-7eb0-d056-158c-c6c78db9cdef@baylibre.com>
References: <20181211124751.30108-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211124751.30108-1-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/12/2018 13:47, Jerome Brunet wrote:
> The name of input clock is not aligned with the rest of the tree
> Because of this, the audio peripheral clocks are orphaned.
> 
> Fixes: 1222ab89328f ("clk: meson: axg-audio: use the clk input helper function")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  Neil,
> 
>  Feel free to squash this with commit 1222ab89328f if you prefer

Well, I'm lazy so I squashed it :-)

> 
>  Cheers
>  Jerome
> 
>  drivers/clk/meson/axg-audio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> index 72b717e61a68..8ac3a2295473 100644
> --- a/drivers/clk/meson/axg-audio.c
> +++ b/drivers/clk/meson/axg-audio.c
> @@ -752,7 +752,7 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>  	}
>  
>  	/* Register the peripheral input clock */
> -	hw = meson_clk_hw_register_input(dev, "pclk", "audio_pclk", 0);
> +	hw = meson_clk_hw_register_input(dev, "pclk", "axg_audio_pclk", 0);
>  	if (IS_ERR(hw))
>  		return PTR_ERR(hw);
>  
> 
