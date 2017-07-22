From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 02/10] iio: humidity: hts221: move BDU configuration
 in probe routine
Date: Sat, 22 Jul 2017 18:58:21 +0100
Message-ID: <20170722185821.054fea8a@kernel.org>
References: <20170717173905.8209-1-lorenzo.bianconi@st.com>
        <20170717173905.8209-3-lorenzo.bianconi@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170717173905.8209-3-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 17 Jul 2017 19:38:57 +0200
Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Enable Block Data Update in hts221_probe() in order to avoid to reconfigure
> it every time the sensor is enabled
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Applied.  Thanks,

Jonathan
> ---
>  drivers/iio/humidity/hts221_core.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iio/humidity/hts221_core.c b/drivers/iio/humidity/hts221_core.c
> index d2f59626b040..47a29b2da1ce 100644
> --- a/drivers/iio/humidity/hts221_core.c
> +++ b/drivers/iio/humidity/hts221_core.c
> @@ -203,12 +203,6 @@ static int hts221_update_odr(struct hts221_hw *hw, u8 odr)
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
