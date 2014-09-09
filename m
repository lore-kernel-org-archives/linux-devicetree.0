From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCHv3 1/6] ARM: dts: Add SoC level device tree support for LS1021A
Date: Tue, 09 Sep 2014 13:53:03 +0200
Message-ID: <62651744.c71MLsL3Q5@wuerfel>
References: <1410253952-15631-1-git-send-email-jingchang.lu@freescale.com> <1410253952-15631-2-git-send-email-jingchang.lu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410253952-15631-2-git-send-email-jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Jingchang Lu <jingchang.lu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chenhui Zhao <chenhui.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Chao Fu <b44548-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Shaveta Leekha <shaveta-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Suresh Gupta <suresh.gupta-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Bhupesh Sharma <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Ruchika Gupta <ruchika.gupta-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Nikhil Badola <nikhil.badola-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 09 September 2014 17:12:27 Jingchang Lu wrote:
> +       aliases {
> +               serial0 = &lpuart0;
> +               serial1 = &lpuart1;
> +               serial2 = &lpuart2;
> +               serial3 = &lpuart3;
> +               serial4 = &lpuart4;
> +               serial5 = &lpuart5;
> +               ethernet0 = &enet0;
> +               ethernet1 = &enet1;
> +               ethernet2 = &enet2;
> +               sysclk = &sysclk;
> +       };
> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x0 0x80000000 0x0 0x20000000>;
> +       };
> +
> 


One more thing: these should all go into the board specific files.

The installed memory is almost always a property of the board, not the
SoC, and a lot of boards only connect a subset of the serial ports,
or they may have them in a different order.

In particular, you only provide aliases for the six out of the
ten available uarts, which seems arbitrary.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
