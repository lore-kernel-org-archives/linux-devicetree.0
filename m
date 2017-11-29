From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6qdl-udoo: disable AC'97 input pins pad
 drivers
Date: Wed, 29 Nov 2017 11:11:08 +0800
Message-ID: <20171129031107.GC9376@dragon>
References: <94862a4d-bec5-cf19-95e6-512d88dd07dc@maciej.szmigiero.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <94862a4d-bec5-cf19-95e6-512d88dd07dc-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Maciej S. Szmigiero" <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 20, 2017 at 08:08:30PM +0100, Maciej S. Szmigiero wrote:
> AC'97 interface RXD and TXC pins are only used as SoC inputs, let's disable
> pad drivers for them so we will be protected if, for example, TCLKDIR is
> set by mistake in AUDMUX and causes TXC pin to be configured as an output.
> 
> This also changes pull direction on these pins from pull-up to pull-down
> to match what the board AC'97 CODEC chip (VT1613) has on these pins.
> 
> Signed-off-by: Maciej S. Szmigiero <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
