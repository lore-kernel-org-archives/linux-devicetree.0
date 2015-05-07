From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: Gateworks GW5510 support (i.MX6)
Date: Thu, 7 May 2015 15:18:27 -0300
Message-ID: <CAOMZO5B6qFzp7sAtycF_BuzPfsp=PxF0+OG3ZjbHepp0AFnrpw@mail.gmail.com>
References: <1431013080-13536-1-git-send-email-tharvey@gateworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431013080-13536-1-git-send-email-tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 7, 2015 at 12:38 PM, Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org> wrote:
> Add support for the Gateworks GW5510 board featuring:
>  * i.MX6 SoC
>  * up to 512MB DDR3
>  * up to 2GB NAND flash
>  * 1x miniPCIe socket (with USB)
>  * HDMI out (micro-HDMI)
>  * HDMI in (micro-HDMI) (currently supported by only vendor kernel)
>  * TTL level I/O (supported by GW16111 breakout board):
>   * I2C
>   * 2x UART
>   * CAN
>   * 2x DIO (GPIO/PWM)
>   * USB OTG
>
> For more details see:
>  http://www.gateworks.com/product/item/ventana-gw5510-single-board-computer
>
> Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>

Looks good:

Reviewed-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
