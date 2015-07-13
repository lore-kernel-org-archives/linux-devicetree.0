From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [PATCH 2/5] [media] tc358743: enable v4l2 subdevice devnode
Date: Mon, 13 Jul 2015 12:59:26 +0200
Message-ID: <55A39A0E.50809@xs4all.nl>
References: <1436533897-3060-1-git-send-email-p.zabel@pengutronix.de> <1436533897-3060-2-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436533897-3060-2-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mats Randgaard <matrandg-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/10/2015 03:11 PM, Philipp Zabel wrote:
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  drivers/media/i2c/tc358743.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> index 48d1575..0be6d9f 100644
> --- a/drivers/media/i2c/tc358743.c
> +++ b/drivers/media/i2c/tc358743.c
> @@ -1668,7 +1668,7 @@ static int tc358743_probe(struct i2c_client *client,
>  	state->i2c_client = client;
>  	sd = &state->sd;
>  	v4l2_i2c_subdev_init(sd, client, &tc358743_ops);
> -	sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;

Note: HAS_EVENTS won't do much since there are no .subscribe_event or
.unsubscribe_event ops. You should add those.

Regards,

	Hans

>  
>  	/* i2c access */
>  	if ((i2c_rd16(sd, CHIPID) & MASK_CHIPID) != 0) {
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
