From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: imu: st_lsm6dsx: support active-low interrupts
Date: Sun, 11 Jun 2017 12:42:17 +0100
Message-ID: <20170611124217.6b4983e5@kernel.org>
References: <20170607181711.16195-1-lorenzo.bianconi@st.com>
        <20170607181711.16195-2-lorenzo.bianconi@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170607181711.16195-2-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed,  7 Jun 2017 20:17:10 +0200
Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Add support for active low interrupts (IRQF_TRIGGER_LOW and
> IRQF_TRIGGER_FALLING). Configure the device as active high or low
> according to the requested irq line.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Applied to the togreg branch of iio.git.

The recent discussions about inverters in the path (used for level
conversion) does make me wonder if we are handling these sort
of cases well, but this certainly doesn't make things worse
so let's go for it for now and keep that discussion separate.

Jonathan
> ---
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
> index b19a62d8c884..2a72acc6e049 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
> @@ -37,6 +37,8 @@
>  #define ST_LSM6DSX_REG_FIFO_THH_ADDR		0x07
>  #define ST_LSM6DSX_FIFO_TH_MASK			GENMASK(11, 0)
>  #define ST_LSM6DSX_REG_FIFO_DEC_GXL_ADDR	0x08
> +#define ST_LSM6DSX_REG_HLACTIVE_ADDR		0x12
> +#define ST_LSM6DSX_REG_HLACTIVE_MASK		BIT(5)
>  #define ST_LSM6DSX_REG_FIFO_MODE_ADDR		0x0a
>  #define ST_LSM6DSX_FIFO_MODE_MASK		GENMASK(2, 0)
>  #define ST_LSM6DSX_FIFO_ODR_MASK		GENMASK(6, 3)
> @@ -417,6 +419,7 @@ int st_lsm6dsx_fifo_setup(struct st_lsm6dsx_hw *hw)
>  {
>  	struct iio_buffer *buffer;
>  	unsigned long irq_type;
> +	bool irq_active_low;
>  	int i, err;
>  
>  	irq_type = irqd_get_trigger_type(irq_get_irq_data(hw->irq));
> @@ -424,12 +427,23 @@ int st_lsm6dsx_fifo_setup(struct st_lsm6dsx_hw *hw)
>  	switch (irq_type) {
>  	case IRQF_TRIGGER_HIGH:
>  	case IRQF_TRIGGER_RISING:
> +		irq_active_low = false;
> +		break;
> +	case IRQF_TRIGGER_LOW:
> +	case IRQF_TRIGGER_FALLING:
> +		irq_active_low = true;
>  		break;
>  	default:
>  		dev_info(hw->dev, "mode %lx unsupported\n", irq_type);
>  		return -EINVAL;
>  	}
>  
> +	err = st_lsm6dsx_write_with_mask(hw, ST_LSM6DSX_REG_HLACTIVE_ADDR,
> +					 ST_LSM6DSX_REG_HLACTIVE_MASK,
> +					 irq_active_low);
> +	if (err < 0)
> +		return err;
> +
>  	err = devm_request_threaded_irq(hw->dev, hw->irq,
>  					st_lsm6dsx_handler_irq,
>  					st_lsm6dsx_handler_thread,
