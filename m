From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH 1/2] usb: chipidea: add CI_HDRC_TURN_VBUS_EARLY_ON for
 imx23
Date: Sun, 17 Jan 2016 19:56:31 +0100 (CET)
Message-ID: <245634301.105525.a366f7cd-6533-4e6a-9506-5cc94a8288bd.open-xchange@email.1und1.de>
References: <1451407269-14905-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1451407269-14905-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Peter,

> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> hat am 29. Dezember 2015 um 17:41
> geschrieben:
>
>
> Until now the imx23 uses the imx27 platform flag. But the
> imx23 needs the flag CI_HDRC_TURN_VBUS_EARLY_ON, too. So
> fix this by adding a separate platform flag.
>
> Suggested-by: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> ---
> drivers/usb/chipidea/ci_hdrc_imx.c | 6 ++++++
> 1 file changed, 6 insertions(+)
>

is the series okay?

Regards
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
