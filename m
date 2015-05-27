From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] arm64: dts: mt8173: Use real clock for UARTs
Date: Wed, 27 May 2015 13:45:54 +0200
Message-ID: <CABuKBe+B-yPbdM98NUye78c_QN_+fEcNov9c_frXP6npH34+aw@mail.gmail.com>
References: <1432128766-4445-1-git-send-email-s.hauer@pengutronix.de>
	<1432128766-4445-3-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432128766-4445-3-git-send-email-s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, =Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2015-05-20 15:32 GMT+02:00 Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>:
> We used to use a fixed rate clock for the UARTs. Now that we have clock
> support we can associate the correct clocks to the UARTs and drop the
> 26MHz fixed rate UART clock.
>
> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>

Applied, thanks.
Matthias
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
