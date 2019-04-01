From: =?UTF-8?Q?=27Ond=C5=99ej_Jirman=27_via_linux=2Dsunxi?= <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: [PATCH 2/7] ARM: dts: sun8i: tbs-a711: Add node for
 BMA250 accelerometer
Date: Mon, 1 Apr 2019 13:34:33 +0200
Message-ID: <20190401113433.z2dps2s5vszt37n7@core.my.home>
References: <20190327001843.2420-1-megous@megous.com>
 <20190327001843.2420-3-megous@megous.com>
 <20190401063049.h2as3qllpelkxkbb@flea>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBS7OQ7SQKGQESQ3EUSY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20190401063049.h2as3qllpelkxkbb@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: wens-jdAy2FN1RRM@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Maxime,

On Mon, Apr 01, 2019 at 08:30:49AM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Mar 27, 2019 at 01:18:38AM +0100, megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org wrote:
> > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> >
> > A711 tablet has BMA250 accelerometer connected to I2C1 bus. Enable
> > both the I2C1 bus and add the accelerometer device to it.
> >
> > Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
> > index 6aae70c89a1e..347fc0c31fa4 100644
> > --- a/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
> > +++ b/arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts
> > @@ -156,6 +156,21 @@
> >  	status = "okay";
> >  };
> >
> > +&i2c1 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&i2c1_pins>;
> 
> It's there already

I see, I'll drop it. Thanks.

> > +	clock-frequency = <400000>;
> > +	status = "okay";
> > +
> > +	/* Accelerometer */
> > +	bma250@18 {
> 
> The node name should be the class of the device, not its model, so
> something like accelerometer.

I'll rename this.

thank you,
  Ondrej

> Maxime
> 
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
