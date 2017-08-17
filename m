From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] iio: st_sensors: decouple irq1 configuration
 parameters from the irq2 ones
Date: Thu, 17 Aug 2017 15:59:32 +0100
Message-ID: <20170817155932.2feab01a@archlinux>
References: <20170816191316.11469-1-lorenzo.bianconi@st.com>
        <20170816191316.11469-2-lorenzo.bianconi@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170816191316.11469-2-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 16 Aug 2017 21:13:12 +0200
Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Separate data-ready configuration parameters for INT1 and INT2 pins in
> st_sensor_data_ready_irq data structure. That change will be use to
> properly support LIS2DW12 accel sensor.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>

One oddity which was there already that you've kept.

I'd clean it up whilst we are here rather than doubling it ;)

Jonathan

> @@ -336,7 +341,12 @@ static const struct st_sensor_settings st_press_sensors_settings[] = {
>  			.mask = 0x04,
>  		},
>  		.drdy_irq = {
> -			.addr = 0,
> +			.int1 = {
> +				.addr = 0x00,
> +			},
> +			.int2 = {
> +				.addr = 0x00,
> +			},
This is presumably for a device which doesn't support data ready.
Why not rely on the default value of 0 and scrap this explicit entry?
>  		},
>  		.multi_read_bit = true,
>  		.bootime = 2,
