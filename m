From: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH] arm64: allwinner: dts: h6: fix Pine H64 MMC bus width
Date: Mon, 20 Aug 2018 22:24:20 +0800
Message-ID: <6e2df3d919b85f48c22c653124b7c2b594cb2d28.camel@aosc.io>
References: <20180726044805.55888-1-icenowy@aosc.io>
         <20180730082712.koiaej6dxjnnk6lb@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180730082712.koiaej6dxjnnk6lb@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

在 2018-07-30一的 10:27 +0200，Maxime Ripard写道：
> On Thu, Jul 26, 2018 at 12:48:05PM +0800, Icenowy Zheng wrote:
> > Currently the enabled MMC controllers on Pine H64 do not have bus-
> > width
> > set, which make them fall back to 1-bit mode and become quite slow.
> > 
> > Fix this by add the corresponding bus-width properties.
> > 
> > Fixes: ecbd611882a1 ("arm64: allwinner: h6: enable MMC0/2 on Pine
> > H64")
> > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> 
> Applied, thanks!

BTW why didn't I see it in next-20180820?

It's 3 weeks later, and you didn't say that the patch is queued for
another version.

> Maxime
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
