From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v11 09/15] usb: phy: Add set_wakeup API
Date: Mon, 24 Feb 2014 21:41:07 +0300
Message-ID: <530B9243.4020909@cogentembedded.com>
References: <1393208467-6355-1-git-send-email-peter.chen@freescale.com> <1393208467-6355-10-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393208467-6355-10-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, frank.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 02/24/2014 05:21 AM, Peter Chen wrote:

> This API is used to set wakeup enable at PHY registers, in that
> case, the PHY can be waken up from suspend due to external events,
> like vbus change, dp/dm change and id change.

> Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>   include/linux/usb/phy.h |   16 ++++++++++++++++
>   1 files changed, 16 insertions(+), 0 deletions(-)

> diff --git a/include/linux/usb/phy.h b/include/linux/usb/phy.h
> index 6c0b1c5..c2c6f49 100644
> --- a/include/linux/usb/phy.h
> +++ b/include/linux/usb/phy.h
> @@ -111,6 +111,13 @@ struct usb_phy {
>   	int	(*set_suspend)(struct usb_phy *x,
>   				int suspend);
>
> +	/*
> +	 * Set wakeup enable for PHY, in that case, the PHY can be
> +	 * waken up from suspend status due to external events,

    s/waken/woken/

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
