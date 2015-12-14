From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/8] Add support for CL-SOM-iMX7 and SBC-iMX7
Date: Mon, 14 Dec 2015 10:47:15 +0800
Message-ID: <20151214024715.GD25756@tiger>
References: <1449472479-2521-1-git-send-email-ilya@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449472479-2521-1-git-send-email-ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 07, 2015 at 09:14:31AM +0200, Ilya Ledvich wrote:
> Ilya Ledvich (8):
>   ARM: dts: imx7d: cl-som-imx7: add basic module support
>   ARM: dts: imx7d: cl-som-imx7: add usb otg support
>   ARM: dts: imx7d: cl-som-imx7: add eMMC support
>   ARM: dts: imx7d: cl-som-imx7: add fec1 support
>   ARM: dts: imx7d: cl-som-imx7: add eeprom support
>   ARM: dts: imx7d: cl-som-imx7: add gpio extender support
>   ARM: dts: imx7d: cl-som-imx7: add fec2 support

For the initial board support submission, it doesn't really need such
splitting.  Please merge above patches into one.

Shawn

>   ARM: dts: imx7d: sbc-imx7: add basic board support
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
