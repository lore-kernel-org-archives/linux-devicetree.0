From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [linux-nfc] [PATCH v2 9/9] NFC: nfcmrvl: update device tree
 bindings for Marvell NFC
Date: Wed, 21 Oct 2015 07:57:34 +0200
Message-ID: <20151021055734.GD11271@zurbaran.home>
References: <1443443594-14353-1-git-send-email-cuissard@marvell.com>
 <1443443594-14353-10-git-send-email-cuissard@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443443594-14353-10-git-send-email-cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Vincent,

On Mon, Sep 28, 2015 at 02:33:14PM +0200, Vincent Cuissard wrote:
> diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
> index b48c3ee..aa022e3 100644
> --- a/drivers/nfc/nfcmrvl/i2c.c
> +++ b/drivers/nfc/nfcmrvl/i2c.c
> @@ -273,7 +273,7 @@ static int nfcmrvl_i2c_remove(struct i2c_client *client)
>  
>  
>  static const struct of_device_id of_nfcmrvl_i2c_match[] = {
> -	{ .compatible = "mrvl,nfc-i2c", },
> +	{ .compatible = "marvell,nfc-i2c", },
You can't just replace the old one with the new one as we already
released kernels with the old compatible string. This is an ABI and we
have to be backward compatible.
Please keep both strings.

Cheers,
Samuel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
