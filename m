Return-Path: <SRS0=63HK=TO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:33418 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfENUVD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 May 2019 16:21:03 -0400
Date: Tue, 14 May 2019 17:20:52 -0300
From: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v6 08/13] media: tvp5150: initialize subdev before
 parsing device tree
Message-ID: <20190514172052.7123204f@coco.lan>
In-Reply-To: <20190415124413.18456-9-m.felsch@pengutronix.de>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
        <20190415124413.18456-9-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: sakari.ailus@linux.intel.com, hans.verkuil@cisco.com, jacopo+renesas@jmondi.org, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
List-ID: <devicetree@vger.kernel.org>

Em Mon, 15 Apr 2019 14:44:08 +0200
Marco Felsch <m.felsch@pengutronix.de> escreveu:

> From: Michael Tretter <m.tretter@pengutronix.de>
> 
> There are several debug prints in the tvp5150_parse_dt() function, which
> do not print the prefix, because the v4l2_subdev is not initialized, yet.
> 
> Initialize the v4l2_subdev before parsing the device tree to fix the
> debug messages.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Looks ok to me.

> ---
>  drivers/media/i2c/tvp5150.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> index 9331609425bf..305a5e256b31 100644
> --- a/drivers/media/i2c/tvp5150.c
> +++ b/drivers/media/i2c/tvp5150.c
> @@ -1973,6 +1973,9 @@ static int tvp5150_probe(struct i2c_client *c,
>  
>  	core->regmap = map;
>  	sd = &core->sd;
> +	v4l2_i2c_subdev_init(sd, c, &tvp5150_ops);
> +	sd->internal_ops = &tvp5150_internal_ops;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>  
>  	if (IS_ENABLED(CONFIG_OF) && np) {
>  		res = tvp5150_parse_dt(core, np);
> @@ -1985,10 +1988,6 @@ static int tvp5150_probe(struct i2c_client *c,
>  		core->mbus_type = V4L2_MBUS_BT656;
>  	}
>  
> -	v4l2_i2c_subdev_init(sd, c, &tvp5150_ops);
> -	sd->internal_ops = &tvp5150_internal_ops;
> -	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> -
>  	res = tvp5150_mc_init(core);
>  	if (res)
>  		goto err_cleanup_dt;



Thanks,
Mauro
