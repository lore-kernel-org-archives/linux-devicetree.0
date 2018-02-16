From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix RK3328 UART DMAs
Date: Fri, 16 Feb 2018 10:20:27 +0100
Message-ID: <2444566.WmOARJqmXO@diego>
References: <564d3e93476ae7480f927b1137ec4d0301938f16.1518702332.git.robin.murphy@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <564d3e93476ae7480f927b1137ec4d0301938f16.1518702332.git.robin.murphy-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 15. Februar 2018, 14:46:50 CET schrieb Robin Murphy:
> Using a serial console on RK3328 provokes an error from
> of_dma_request_slave_channel() since the UART nodes have a "dmas"
> property but are missing the mandatory "dma-names" to go with it.
> 
> Replace the bogus "#dma-cells" - these UARTs are DMA channel consumers,
> not providers - with the appropriate names instead. DMA still doesn't
> actually work, since the PL330 driver doesn't quite implement everything
> the 8250 driver demands, but at least it makes the DT correct.
> 
> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>

applied for 4.17

Thanks for the catch
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
