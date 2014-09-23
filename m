From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCHv4 3/6] ARM: dts: Add initial LS1021A TWR board dts support
Date: Tue, 23 Sep 2014 16:54:19 +0200
Message-ID: <3321146.kBfn28qbNM@wuerfel>
References: <1411371952-5618-1-git-send-email-jingchang.lu@freescale.com> <1411371952-5618-4-git-send-email-jingchang.lu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411371952-5618-4-git-send-email-jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen Lu <B46807-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Chao Fu <B44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 22 September 2014 15:45:49 Jingchang Lu wrote:
> @@ -0,0 +1,117 @@
> +/*
> + * Copyright 2013-2014 Freescale Semiconductor, Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */

Can you change the license so this file is available under both GPL and
BSD or X11 license?

> +/dts-v1/;
> +#include "ls1021a.dtsi"
> +
> +/ {
> +       model = "LS1021A TWR Board";
> +
> +       aliases {
> +               enet2_rgmii_phy = &rgmii_phy1;
> +               enet0_sgmii_phy = &sgmii_phy2;
> +               enet1_sgmii_phy = &sgmii_phy0;
> +       };
> +};
> 

I've never seen alias nodes for mdio devices. What are these used for?
Shouldn't you use 'phy-handle' properties in the ethernet nodes instead?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
