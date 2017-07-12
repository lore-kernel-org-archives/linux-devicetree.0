From: Sylwester Nawrocki <snawrocki-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/7] [media] ov9650: switch i2c device id to lower case
Date: Wed, 12 Jul 2017 21:18:52 +0200
Message-ID: <8b84296e-b3c7-f5d1-5e90-5890b1b0ed48@kernel.org>
References: <1499073368-31905-1-git-send-email-hugues.fruchet@st.com>
 <1499073368-31905-3-git-send-email-hugues.fruchet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1499073368-31905-3-git-send-email-hugues.fruchet-qxv4g6HH51o@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
Cc: "H. Nikolaus Schaller" <hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/03/2017 11:16 AM, Hugues Fruchet wrote:
> Switch i2c device id to lower case as it is

s/i2c/I2C ?

> done for other omnivision cameras.

s/omnivision/Omnivision

This is required for properly matching driver with device on DT platforms,
right? It might be worth to mention that so it is clear why we break any
non-dt platform that could be already using this driver. There seem to be 
none in the mainline kernel tree though.

> Signed-off-by: Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>

Reviewed-by: Sylwester Nawrocki <snawrocki-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> Signed-off-by: Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>
> ---
>   drivers/media/i2c/ov9650.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
> index 2de2fbb..1e4e99e 100644
> --- a/drivers/media/i2c/ov9650.c
> +++ b/drivers/media/i2c/ov9650.c
> @@ -1545,8 +1545,8 @@ static int ov965x_remove(struct i2c_client *client)
>   }
>   
>   static const struct i2c_device_id ov965x_id[] = {
> -	{ "OV9650", 0 },
> -	{ "OV9652", 0 },
> +	{ "ov9650", 0 },
> +	{ "ov9652", 0 },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(i2c, ov965x_id);
 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
