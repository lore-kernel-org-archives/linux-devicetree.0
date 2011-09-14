From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] isp1760: Fix endianness-sensitivity in of_isp1760_probe()
Date: Wed, 14 Sep 2011 23:12:57 +0400
Message-ID: <4E70FCB9.4050907@ru.mvista.com>
References: <1316008633-31009-1-git-send-email-dave.martin@linaro.org> <1316008633-31009-3-git-send-email-dave.martin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1316008633-31009-3-git-send-email-dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Arvid Brodin <arvid.brodin-AM1FMPraTHU@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 09/14/2011 05:57 PM, Dave Martin wrote:

> Data read direct from device tree properties will be in the device
> tree's native endianness (i.e., big-endian).

> This patch uses of_property_read_u32() to read the bus-width
> property in host byte order instead.

> Signed-off-by: Dave Martin<dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Acked-by: Pawel Moll<pawel.moll-5wv7dgnIgG8@public.gmane.org>
> ---
>   drivers/usb/host/isp1760-if.c |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)

> diff --git a/drivers/usb/host/isp1760-if.c b/drivers/usb/host/isp1760-if.c
> index 69ee32c..fa99c27 100644
> --- a/drivers/usb/host/isp1760-if.c
> +++ b/drivers/usb/host/isp1760-if.c
[...]
> @@ -64,8 +64,8 @@ static int of_isp1760_probe(struct platform_device *dev)
>   		devflags |= ISP1760_FLAG_ISP1761;
>
>   	/* Some systems wire up only 16 of the 32 data lines */
> -	prop = of_get_property(dp, "bus-width", NULL);
> -	if (prop&&  *prop == 16)
> +	of_property_read_u32(dp, "bus-width", bus_width);

    You probably mean '&bus_width'?

> +	if (bus_width == 16)
>   		devflags |= ISP1760_FLAG_BUS_WIDTH_16;
>
>   	if (of_get_property(dp, "port1-otg", NULL) != NULL)

WBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
