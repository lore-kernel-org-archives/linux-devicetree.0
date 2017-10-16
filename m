From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCH 3/4] ARM: dts: imx28-tx28: fix interrupt flags and use
 interrupts-extended property
Date: Mon, 16 Oct 2017 10:56:32 +0200
Message-ID: <20171016105632.709e653c@karo-electronics.de>
References: <1507719939-27250-1-git-send-email-LW@KARO-electronics.de>
        <1507719939-27250-4-git-send-email-LW@KARO-electronics.de>
        <20171016071726.gyzvalxzk4o3jsuz@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171016071726.gyzvalxzk4o3jsuz@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, 16 Oct 2017 09:17:26 +0200 Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Oct 11, 2017 at 01:05:38PM +0200, Lothar Waßmann wrote:
> > diff --git a/arch/arm/boot/dts/imx28-tx28.dts b/arch/arm/boot/dts/imx28-tx28.dts
> > index 211e67d..3c852f7 100644
> > --- a/arch/arm/boot/dts/imx28-tx28.dts
> > +++ b/arch/arm/boot/dts/imx28-tx28.dts
> > @@ -328,8 +328,7 @@
> >  		reg = <0x20>;
> >  		pinctrl-names = "default";
> >  		pinctrl-0 = <&tx28_pca9554_pins>;
> > -		interrupt-parent = <&gpio3>;
> > -		interrupts = <28 0>;
> > +		interrupts-extended = <&gpio3 28 IRQ_TYPE_NONE>;
> >  		gpio-controller;
> >  		#gpio-cells = <2>;
> >  		interrupt-controller;
> 
> While interrupts-extended looks nice,
> Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> has:
> 
> 	"interrupts-extended" should only be used when a device has
> 	multiple interrupt parents.
> 
> If this is still true, this patch is wrong.
>
Thanks for the hint. It really helps to read the documentation
sometimes, rahter than relying on existing code only...

A quick check shows, that more than 100 of the 130 uses of
interrupts-extended are wrong. :(


Lothar Waßmann
