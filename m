From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
Subject: Re: [PATCH] ARM: dts: sun8i-h3: Fix wifi in Beelink X2 DT
Date: Sat, 18 May 2019 17:07:11 +0200
Message-ID: <36237813.UWQAqNRFN9@jernej-laptop>
References: <20190516161039.18534-1-jernej.skrabec@siol.net> <20190517073048.y6mzgbhhryfmuckl@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190517073048.y6mzgbhhryfmuckl@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: wens@csie.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Dne petek, 17. maj 2019 ob 09:30:48 CEST je Maxime Ripard napisal(a):
> Hi,
> 
> On Thu, May 16, 2019 at 06:10:39PM +0200, Jernej Skrabec wrote:
> > mmc1 node where wifi module is connected doesn't have properly defined
> > power supplies so wifi module is never powered up. Fix that by
> > specifying additional power supplies.
> > 
> > Additionally, this STB may have either Realtek or Broadcom based wifi
> > module. One based on Broadcom module also needs external clock to work
> > properly. Fix that by adding clock property to wifi_pwrseq node.
> > 
> > Fixes: e582b47a9252 ("ARM: dts: sun8i-h3: Add dts for the Beelink X2 STB")
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > ---
> > 
> >  arch/arm/boot/dts/sun8i-h3-beelink-x2.dts | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> > b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts index
> > 6277f13f3eb3..6a0ac85b4616 100644
> > --- a/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> > +++ b/arch/arm/boot/dts/sun8i-h3-beelink-x2.dts
> > @@ -89,7 +89,10 @@
> > 
> >  	wifi_pwrseq: wifi_pwrseq {
> >  	
> >  		compatible = "mmc-pwrseq-simple";
> > 
> > +		pinctrl-names = "default";
> 
> pinctrl-names only make sense with another pinctrl-[0-255]
> property. Did you forgot something here?

No, I just took BananaPi M2+ as a example, which has pinctrl-names property 
too and no "pinctrl-*". But digging through history of this DT, it seems that 
this is just leftover which somebody forgot to remove.

I'll send v2.

Best regards,
Jernej
