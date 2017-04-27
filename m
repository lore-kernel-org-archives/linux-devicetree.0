From: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Subject: Re: [PATCH v3] NFC: trf7970a: Correct register settings for 27MHz
 clock
Date: Thu, 27 Apr 2017 10:19:37 -0700
Message-ID: <20170427171937.GA21522@animalcreek.com>
References: <1493304119-16605-1-git-send-email-geoff@kuvee.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1493304119-16605-1-git-send-email-geoff-R+k406RtEhcAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geoff Lansberry <geoff-R+k406RtEhcAvxtiuMwx3w@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org, justin-R+k406RtEhcAvxtiuMwx3w@public.gmane.org, colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, wharms-fPG8STNUNVg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 27, 2017 at 10:41:59AM -0400, Geoff Lansberry wrote:
> In prior commits the selected clock frequency does not propagate
> correctly to what is written the the TRF7970A_MODULATOR_SYS_CLK_CTRL
                               ^^^^^^^
s/the the/to the/

> register.
> 
> Signed-off-by: Geoff Lansberry <geoff-R+k406RtEhcAvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/nfc/trf7970a.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
> index 6ed5d7e..f7fee7d 100644
> --- a/drivers/nfc/trf7970a.c
> +++ b/drivers/nfc/trf7970a.c
> @@ -2067,6 +2067,13 @@ static int trf7970a_probe(struct spi_device *spi)
>  		return -EINVAL;
>  	}
>  
> +	if (clk_freq == TRF7970A_27MHZ_CLOCK_FREQUENCY) {
> +		trf->modulator_sys_clk_ctrl = TRF7970A_MODULATOR_27MHZ;
> +		dev_dbg(trf->dev, "trf7970a configured for 27MHz crystal\n");
> +	} else {
> +		trf->modulator_sys_clk_ctrl = 0;
> +	}
> +
>  	ret = devm_request_threaded_irq(trf->dev, spi->irq, NULL,
>  					trf7970a_irq,
>  					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> -- 
> 2.7.4

With the suggested fix above:

Acked-by: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
