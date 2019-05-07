From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h6: Enable HDMI output on
 orangepi 3
Date: Tue, 7 May 2019 11:35:35 +0200
Message-ID: <20190507093535.uapqhxduwtbdgbtq@core.my.home>
References: <20190420145240.27400-1-tiny.windzz@gmail.com>
 <20190502073401.3l3fl4alicyzpud7@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190502073401.3l3fl4alicyzpud7@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, wens@csie.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Thu, May 02, 2019 at 09:34:01AM +0200, Maxime Ripard wrote:
> On Sat, Apr 20, 2019 at 10:52:40AM -0400, Yangtao Li wrote:
> > Orangepi 3 has HDMI type A connector.
> >
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> 
> Queued for 5.3, thanks!
> Maxime

This patch is not enough. HDMI support on Orange Pi 3 also needs to
enable DDC IO. While the SoC will feed some default output singal
into the display, without DDC enabled it will not work reliably.

That support is part of my Orange Pi 3 series, and will be reworked
for v5 of that series.

While I can rebase on top of this, it would be easier if you dropped
this patch until the propper support is ready. I don't see any reason
why this should be rushed with half-working solution.

regards,
	o.

> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
