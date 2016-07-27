From: stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: Re: [PATCH v4] ARM: dts: sun8i: Add dts file for Olimex A33-OLinuXino
Date: Wed, 27 Jul 2016 08:12:29 +0300
Message-ID: <30014119.IrjfP0xFry@linux-cigu>
References: <1469450243-19138-1-git-send-email-stefan.mavrodiev@gmail.com> <20160726153352.GH7190@lukather>
Reply-To: Stefan.Mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCSP3JM3Y4JBBS4F4G6AKGQEOYUQMIY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160726153352.GH7190@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Stefan Mavrodiev <stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday, July 26, 2016 5:33:52 PM EEST Maxime Ripard wrote:
> Hi Stefan,
> 
> On Mon, Jul 25, 2016 at 03:37:23PM +0300, Stefan Mavrodiev wrote:
> > A33-OLinuXino is A33 development board designed by Olimex LTD.
> > 
> > It has AXP233 PMU, 1GB DRAM, a micro SD card, one USB-OTG connector,
> > headphone and mic jacks, connector for LiPo battery and optional
> > 4GB NAND Flash.
> > 
> > It has two 40-pin headers. One for LCD panel, and one for
> > additional modules. Also there is CSI/DSI connector.
> > 
> > Signed-off-by: Stefan Mavrodiev <stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> It looks mostly good, a few comments though.
> 
> > +&pio {
> > +	led_pin_olinuxino: led_pins@0 {
> > +		allwinner,pins = "PB7";
> > +        allwinner,function = "gpio_out";
> 
> This line is not properly indented.
> 
> > +		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> > +		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> > +    };
> 
> And this one too.
> 
> > +&reg_dc1sw {
> > +	regulator-name = "vcc-lcd";
> > +};
> 
> No constraints on this one?
> 
> > +&reg_dcdc1 {
> > +	regulator-always-on;
> > +	regulator-min-microvolt = <3300000>;
> > +	regulator-max-microvolt = <3300000>;
> > +	regulator-name = "vcc-dsi";
> > +};
> 
> What is it used for? Is it really necessary to keep it on at all time?

I think so.
This is the supply for the MMC.
> 
> Thanks,
> Maxime

Best regards,
Stefan Mavrodiev
