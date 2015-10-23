From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 9/9] NFC: nfcmrvl: update device tree bindings for
 Marvell NFC
Date: Fri, 23 Oct 2015 08:17:44 -0500
Message-ID: <CAL_JsqJ7a+MNA8BPseGu_L+3yMr=jK-3YiSo+HZkoqJq2XpWgg@mail.gmail.com>
References: <1445602986-3254-1-git-send-email-cuissard@marvell.com> <1445602986-3254-10-git-send-email-cuissard@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445602986-3254-10-git-send-email-cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 23, 2015 at 7:23 AM, Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org> wrote:
> Align NFC bindgins to use marvell instead of mrvl.
>
> Signed-off-by: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt | 12 ++++++------
>  drivers/nfc/nfcmrvl/i2c.c                             |  2 +-
>  drivers/nfc/nfcmrvl/spi.c                             |  2 +-
>  drivers/nfc/nfcmrvl/uart.c                            |  2 +-
>  4 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt b/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
> index 41058fc..0f95924 100644
> --- a/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
> +++ b/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
> @@ -2,9 +2,9 @@
>
>  Required properties:
>  - compatible: Should be:
> -  - "mrvl,nfc-uart" for UART devices
> -  - "mrvl,nfc-i2c" for I2C devices
> -  - "mrvl,nfc-spi" for SPI devices
> +  - "marvell,nfc-uart" for UART devices
> +  - "marvell,nfc-i2c" for I2C devices
> +  - "marvell,nfc-spi" for SPI devices

There is no point in changing these and doing so breaks backwards compatibility.

These bindings have a bigger issue in that it doesn't describe the
hardware, but rather just something to bind the Linux driver. The
compatible strings should be tied to what NFC chip you have (i.e. the
part number).

So either leave it alone or fix the bigger problem.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
