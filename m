From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/9] iio: humidity: hts221: move BDU configuration in
 probe routine
Date: Sun, 9 Jul 2017 19:29:43 +0100
Message-ID: <20170709192943.1bbe5e23@kernel.org>
References: <20170709165704.26311-1-lorenzo.bianconi@st.com>
        <20170709165704.26311-3-lorenzo.bianconi@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170709165704.26311-3-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun,  9 Jul 2017 18:56:57 +0200
Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Enable Block Data Update in hts221_probe() in order to avoid to reconfigure
> it every time the sensor is enabled
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Well there goes part of my concern about extra writes.

Patch looks good

Jonathan
> ---
>  drivers/iio/humidity/hts221_core.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iio/humidity/hts221_core.c b/drivers/iio/humidity/hts221_core.c
> index f5181e4e1eff..9546b0ea6283 100644
> --- a/drivers/iio/humidity/hts221_core.c
> +++ b/drivers/iio/humidity/hts221_core.c
> @@ -202,12 +202,6 @@ static int hts221_update_odr(struct hts221_hw *hw, u8 odr)
>  	if (i == ARRAY_SIZE(hts221_odr_table))
>  		return -EINVAL;
>  
> -	/* enable Block Data Update */
> -	err = hts221_write_with_mask(hw, HTS221_REG_CNTRL1_ADDR,
> -				     HTS221_BDU_MASK, 1);
> -	if (err < 0)
> -		return err;
> -
>  	err = hts221_write_with_mask(hw, HTS221_REG_CNTRL1_ADDR,
>  				     HTS221_ODR_MASK, hts221_odr_table[i].val);
>  	if (err < 0)
> @@ -644,6 +638,12 @@ int hts221_probe(struct iio_dev *iio_dev)
>  	iio_dev->name = HTS221_DEV_NAME;
>  	iio_dev->info = &hts221_info;
>  
> +	/* enable Block Data Update */
> +	err = hts221_write_with_mask(hw, HTS221_REG_CNTRL1_ADDR,
> +				     HTS221_BDU_MASK, 1);
> +	if (err < 0)
> +		return err;
> +
>  	/* configure humidity sensor */
>  	err = hts221_parse_rh_caldata(hw);
>  	if (err < 0) {

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
