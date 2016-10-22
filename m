From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/5] iio: dac: mcp4725: fix incorrect comment
Date: Sat, 22 Oct 2016 19:02:07 +0100
Message-ID: <c224e323-fff8-cc79-b10d-99c7ddea1b51@kernel.org>
References: <1476812589-18333-1-git-send-email-tomas.novotny@tbs-biometrics.com>
 <1476812589-18333-3-git-send-email-tomas.novotny@tbs-biometrics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476812589-18333-3-git-send-email-tomas.novotny-MzfF5RY65ECbtNqbA8UwFdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomas Novotny <tomas.novotny-MzfF5RY65ECbtNqbA8UwFdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yong Li <sdliyong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 18/10/16 18:43, Tomas Novotny wrote:
> From: Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
> 
> Number 2 is referencing to the settings with the largest available
> resistor.
> 
> No functional change.
> 
> Signed-off-by: Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
Thanks,

Applied to the togreg branch of iio.git and pushed out as testing.

Jonathan
> ---
>  drivers/iio/dac/mcp4725.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/dac/mcp4725.c b/drivers/iio/dac/mcp4725.c
> index 1f55d1b..e481f38 100644
> --- a/drivers/iio/dac/mcp4725.c
> +++ b/drivers/iio/dac/mcp4725.c
> @@ -374,7 +374,7 @@ static int mcp4725_probe(struct i2c_client *client,
>  	}
>  	pd = (inbuf[0] >> 1) & 0x3;
>  	data->powerdown = pd > 0 ? true : false;
> -	data->powerdown_mode = pd ? pd - 1 : 2; /* largest register to gnd */
> +	data->powerdown_mode = pd ? pd - 1 : 2; /* largest resistor to gnd */
>  	data->dac_value = (inbuf[1] << 4) | (inbuf[2] >> 4);
>  
>  	err = iio_device_register(indio_dev);
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
