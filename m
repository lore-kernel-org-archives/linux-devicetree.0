From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 1/3] MTD: m25p80: fix write return value.
Date: Thu, 30 Apr 2015 20:43:11 +0200
Message-ID: <201504302043.11118.marex@denx.de>
References: <cover.1430403750.git.hramrach@gmail.com> <55132b4496e7fe73f949186c0f140f3e4fd4e2c7.1430403750.git.hramrach@gmail.com>
Reply-To: marex-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-sunxi+bncBDIOBYPK6QDRB5VORKVAKGQEH3B3XDA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <55132b4496e7fe73f949186c0f140f3e4fd4e2c7.1430403750.git.hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Huang Shijie <b32955-KZfg59tc24xl57MIdRCFDg@public.gmane.org>,  
 =?utf-8?q?Rafa=C5=82?= =?utf-8?q?_Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Hutchings <ben-/+tVBieCtBitmTQ+vhA3Yw@public.gmane.org>, Alison Chaiken <alison_chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Mika Westerberg <mika.westerberg-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "Bean Huo
 =?utf-8?q?=E9=9C=8D=E6=96=8C=E6=96=8C?= (beanhuo)" <beanhuo-AL4WhLSQfzjQT0dZR+AlfA@public.gmane.org>, "grmoore-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org" <grmoore-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday, April 30, 2015 at 03:33:47 PM, Michal Suchanek wrote:
> The size of written data was added to user supplied value rather than
> written at the provided address.

You might want to work on the commit message a little, something like
the following, but feel free to reword as seen fit.

The 'retlen' points to a variable representing the number of data bytes 
written/read (see include/linux/mtd/mtd.h) by the current invocation of
the function. This variable must be set, not incremented.

Otherwise, the patch is correct I believe:

Acked-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>

> Signed-off-by: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/mtd/devices/m25p80.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 7c8b169..0b2bc21 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -102,7 +102,7 @@ static void m25p80_write(struct spi_nor *nor, loff_t
> to, size_t len,
> 
>  	spi_sync(spi, &m);
> 
> -	*retlen += m.actual_length - cmd_sz;
> +	*retlen = m.actual_length - cmd_sz;
>  }
> 
>  static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)

Best regards,
Marek Vasut
