From: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Subject: Re: [PATCH] NFC: trf7970a: Correct register settings for 27MHz clock
Date: Wed, 26 Apr 2017 10:04:43 -0700
Message-ID: <20170426170443.GB11522@animalcreek.com>
References: <1493214513-12245-1-git-send-email-geoff@kuvee.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1493214513-12245-1-git-send-email-geoff-R+k406RtEhcAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geoff Lansberry <geoff-R+k406RtEhcAvxtiuMwx3w@public.gmane.org>, g@animalcreek.com
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org, justin-R+k406RtEhcAvxtiuMwx3w@public.gmane.org, colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Apr 26, 2017 at 09:48:33AM -0400, Geoff Lansberry wrote:
> In prior commits the selected clock frequency does not propagate
> correctly to what is written the the TRF7970A_MODULATOR_SYS_CLK_CTRL
> register.
> Also fixes a bug that causes the device tree property check to always
> pass.
> 
> Signed-off-by: Geoff Lansberry <geoff-R+k406RtEhcAvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/nfc/trf7970a.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
> index 2d1c8ca..c278b0e 100644
> --- a/drivers/nfc/trf7970a.c
> +++ b/drivers/nfc/trf7970a.c
> @@ -2071,7 +2071,7 @@ static int trf7970a_probe(struct spi_device *spi)
>  	}
>  
>  	of_property_read_u32(np, "clock-frequency", &clk_freq);
> -	if ((clk_freq != TRF7970A_27MHZ_CLOCK_FREQUENCY) ||
> +	if ((clk_freq != TRF7970A_27MHZ_CLOCK_FREQUENCY) &&

There is already a patch submitted to fix this issue so no need to fix
it again.  For the record, it should have been in a separate patch
since it fixes a different issue than what is fixed below.

>  		(clk_freq != TRF7970A_13MHZ_CLOCK_FREQUENCY)) {
>  		dev_err(trf->dev,
>  			"clock-frequency (%u Hz) unsupported\n",
> @@ -2079,6 +2079,13 @@ static int trf7970a_probe(struct spi_device *spi)
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
>  	if (of_property_read_bool(np, "en2-rf-quirk"))
>  		trf->quirks |= TRF7970A_QUIRK_EN2_MUST_STAY_LOW;

This part looks okay to me but I like Walter's suggestion too.

Mark
--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
