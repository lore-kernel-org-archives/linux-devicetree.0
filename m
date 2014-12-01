From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ARM: zynq: DT: Add USB to device tree
Date: Mon, 01 Dec 2014 22:26:55 +0100
Message-ID: <7088901.UGmPabvHQ0@wuerfel>
References: <1417459352-23401-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417459352-23401-1-git-send-email-soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 01 December 2014 10:42:32 Soren Brinkmann wrote:
> +       usb_phy0: usb-phy@0 {
> +               compatible = "usb-nop-xceiv";
> +               #phy-cells = <0>;
> +       };
>  };

As discussed in an unrelated thread today, please drop the "@0" in the
node name, since the device has no 'reg' property.

Otherwise looks good.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
