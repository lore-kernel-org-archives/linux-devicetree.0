From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: Re: [RESEND PATCH] ARM: dts: sun7i: olimex-lime2:
 Enable ac and power supplies
Date: Tue, 28 May 2019 13:43:42 +0000
Message-ID: <20190528134342.25fep6kpmrr4p7vw@plaes.org>
References: <20190528063544.17408-1-plaes@plaes.org>
 <2b671c1f0734177a6283407f753403473b70f5bc.camel@bootlin.com>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDB4J47M7YERBEHWWTTQKGQEIRIUOGY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <2b671c1f0734177a6283407f753403473b70f5bc.camel-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 28, 2019 at 02:58:57PM +0200, Paul Kocialkowski wrote:
> Hi,
> 
> On Tue, 2019-05-28 at 09:35 +0300, Priit Laes wrote:
> > Lime2 has battery connector so enable these supplies.
> 
> Out of curiosity, what is reported to userspace when no battery is
> attached?

Data from /sys/class/power_supply/axp20x-battery:

[snip]
$ for i in $(ls -1); do echo "cat $i"; cat $i; done

cat capacity
100
cat constant_charge_current
1200000
cat constant_charge_current_max
1200000
cat current_now
0
cat health
Good
cat online
0
cat present
0
cat status
Not charging
cat type
Battery
cat uevent
POWER_SUPPLY_NAME=axp20x-battery
POWER_SUPPLY_PRESENT=0
POWER_SUPPLY_ONLINE=0
POWER_SUPPLY_STATUS=Not charging
POWEROSUPPLY_VOLTAGE_NOW=0
POWER_SUPPLY_CURRENT_NOW=0
POWER_SUPPLY_CON/TANT_CHARGE_CURRENT=1200000
POWER_SUPPLY_CONSTANT_CHARGE_CURRENT_MAX=1200000
POWER_SUPPLY_HEALTH=Good
POWER_SUPPLY_VOLTAGE_MAXODESIGN=4200000
POWEROSUPPLY_VOLTAGE_MIN_DESIGN=2900000
POWER_SUPPLY_CAPACITY=100
cat voltage_max_design
4200000
cat voltage_min_design
2900000
cat voltage_now
0
[/snip]

> Looks good otherwise:
> Reviewed-by: Paul Kocialkowski <paul.kocialkowski-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
> 
> Cheers,
> 
> Paul
> 
> > Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
> > index 9c8eecf4337a..9001b5527615 100644
> > --- a/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
> > +++ b/arch/arm/boot/dts/sun7i-a20-olinuxino-lime2.dts
> > @@ -206,6 +206,14 @@
> >  
> >  #include "axp209.dtsi"
> >  
> > +&ac_power_supply {
> > +	status = "okay";
> > +};
> > +
> > +&battery_power_supply {
> > +	status = "okay";
> > +};
> > +
> >  &reg_dcdc2 {
> >  	regulator-always-on;
> >  	regulator-min-microvolt = <1000000>;
> > -- 
> > 2.11.0
> > 
> -- 
> Paul Kocialkowski, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
> 
