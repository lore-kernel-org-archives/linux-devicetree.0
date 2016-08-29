From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/2] arm64: dts: updates serial aliases for ls1043a rdb and qds boards
Date: Mon, 29 Aug 2016 13:01:20 +0200
Message-ID: <8035333.yr2FRs5mHk@wuerfel>
References: <1472244381-1766-1-git-send-email-stuart.yoder@nxp.com> <1472244381-1766-2-git-send-email-stuart.yoder@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472244381-1766-2-git-send-email-stuart.yoder-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday, August 26, 2016 3:46:20 PM CEST Stuart Yoder wrote:
> -               serial0 = &lpuart0;
> -               serial1 = &lpuart1;
> -               serial2 = &lpuart2;
> -               serial3 = &lpuart3;
> -               serial4 = &lpuart4;
> -               serial5 = &lpuart5;
> +               serial0 = &duart0;
> +               serial1 = &duart1;
> +               serial2 = &duart2;
> +               serial3 = &duart3;

It looks like your board has six uarts that are all driven with the
lpuart driver, but after the change, you only list four. Should
the serial4 and serial5 aliases keep pointing at lpuart devices
so you can still drive all physical connectors?

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
