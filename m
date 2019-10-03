From: Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [Patch v2 1/3] media: ov5640: add PIXEL_RATE control
Date: Thu, 3 Oct 2019 09:17:14 +0200
Message-ID: <20191003071714.zyldxfoollm26o4u@uno.localdomain>
References: <20191002135134.12273-1-bparrot@ti.com>
 <20191002135134.12273-2-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="s2rbs3roz2jmtvxv"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191002135134.12273-2-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Parrot <bparrot@ti.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--s2rbs3roz2jmtvxv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Benoit,

On Wed, Oct 02, 2019 at 08:51:32AM -0500, Benoit Parrot wrote:
> Add v4l2 controls to report the pixel rates of each mode. This is
> needed by some CSI2 receiver in order to perform proper DPHY
> configuration.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/i2c/ov5640.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 500d9bbff10b..5198dc887400 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -193,6 +193,9 @@ struct ov5640_mode_info {
>
>  struct ov5640_ctrls {
>  	struct v4l2_ctrl_handler handler;
> +	struct {
> +		struct v4l2_ctrl *pixel_rate;
> +	};

Do you need to wrap this v4l2_ctrl in it's own unnamed struct? Other
controls here declared in this way are clustered and, if I'm not
mistaken, using unnamed struct to wrap them is just a typographically
nice way to convey that. I think your new control could be declared
without a wrapping struct { }.

>  	struct {
>  		struct v4l2_ctrl *auto_exp;
>  		struct v4l2_ctrl *exposure;
> @@ -2194,6 +2197,16 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
>  	return 0;
>  }
>
> +static u64 ov5640_calc_pixel_rate(struct ov5640_dev *sensor)
> +{
> +	u64 rate;
> +
> +	rate = sensor->current_mode->vtot * sensor->current_mode->htot;
> +	rate *= ov5640_framerates[sensor->current_fr];
> +
> +	return rate;
> +}
> +

Just to point out this is the -theoretical- pixel rate, and might be
quite different from the one calculated by the clock tree tuning
procedure (which should be updated to match Hugues' latest findings).

>  static int ov5640_set_fmt(struct v4l2_subdev *sd,
>  			  struct v4l2_subdev_pad_config *cfg,
>  			  struct v4l2_subdev_format *format)
> @@ -2233,6 +2246,8 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
>  	if (mbus_fmt->code != sensor->fmt.code)
>  		sensor->pending_fmt_change = true;
>
> +	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> +				 ov5640_calc_pixel_rate(sensor));
>  out:
>  	mutex_unlock(&sensor->lock);
>  	return ret;
> @@ -2657,6 +2672,13 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
>  	/* we can use our own mutex for the ctrl lock */
>  	hdl->lock = &sensor->lock;
>
> +	/* Clock related controls */
> +	ctrls->pixel_rate =
> +		v4l2_ctrl_new_std(hdl, ops,

If you like it better, this could fit in 1 line

	ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE,
					      0, INT_MAX, 1,
					      ov5640_calc_pixel_rate(sensor)

Thanks
   j

> +				  V4L2_CID_PIXEL_RATE, 0, INT_MAX, 1,
> +				  ov5640_calc_pixel_rate(sensor));


> +	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
>  	/* Auto/manual white balance */
>  	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
>  					   V4L2_CID_AUTO_WHITE_BALANCE,
> @@ -2816,6 +2838,9 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
>  		sensor->frame_interval = fi->interval;
>  		sensor->current_mode = mode;
>  		sensor->pending_mode_change = true;
> +
> +		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> +					 ov5640_calc_pixel_rate(sensor));
>  	}
>  out:
>  	mutex_unlock(&sensor->lock);
> --
> 2.17.1
>

--s2rbs3roz2jmtvxv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2VoHoACgkQcjQGjxah
VjyTdRAAvTt33YTnWgAxWHNBQtJFu8kvS++x7KcOpwVIPtyOlQZoGapfE41HI4Gp
mNvbOfqlaxwo1y0KGiEPMtaTyBKf+3nGS8t19k4eSrrVDvQT2s2JZfgdl5YYJYYo
QocfelRqCXE3K7RIrznh79aQWH+GF9S3Bhv1nbL4kKAEqgX99cqv0kp/lIJV6fhk
rDfMAOGhwd4VJJzyvgRn1ndR5EU3XTfsgiCGqgka/0bt2wr6RvHgZayFFfWvZ4N8
Ku6T6bMOOk9B/qb1R55VpcRlAGIJzgIMvwGNO25tUKcGcy3bnTLN4ysCaAGbRc5u
IA5V80D6T4yRF9T5J4vmPu3sE/trPLY+lxNr9Fruzsl7aA4DSG2Rm0QVxEY5BlsV
o8wKTZF7ua62MsvN1XG2KhE42aWcDoMamzC13mU6MHWOWsOYMIlDkGi4uJ8Byzp7
4x4qsqnHme6/MXGFkobNc3gBeIp+BjSt3CVh/Tbik85YyeFb9OuONElIypDE00np
VppLSrNv0Y6RDALW8vUyh5QNS79fVtgHwAsB86sxb63D6KFmKVs0XjvqS9kTwaZt
MW64rk37SyG5j1HCjCTO9Q3PwMxx7UMdHpuMHFFBSsaaDhYedNWqNpATrbGzi2q9
M1FyLvbDWrNSS9Jg4CjEMlufTd4jRMRsoK0h9w1Yxpg6yv/w+H4=
=3Wwj
-----END PGP SIGNATURE-----

--s2rbs3roz2jmtvxv--
