From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH] ARM: mvebu: Add Netgear ReadyNAS 104 board
Date: Tue, 22 Oct 2013 18:02:13 +0200
Message-ID: <20131022160213.GB26694@lunn.ch>
References: <87txgapcas.fsf@natisbad.org>
 <20131021215746.GF23593@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131021215746.GF23593-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> > +			pinctrl {
> > +				poweroff: poweroff {
> > +					marvell,pins = "mpp60";
> > +					marvell,function = "gpio";
> > +				};
> > +
> > +				backup_key_pin: backup-key-pin {
> > +					marvell,pins = "mpp52";
> > +					marvell,function = "gpio";
> > +				};
> > +
> > +				power_key_pin: power-key-pin {
> > +					marvell,pins = "mpp62";
> > +					marvell,function = "gpio";
> > +				};
> > +
> > +				backup_led_pin: backup-led-pin {
> > +					marvell,pins = "mpp63";
> > +					marvell,function = "gpo";
> > +				};
> > +
> > +				power_led_pin: power-led-pin {
> > +					marvell,pins = "mpp64";
> > +					marvell,function = "gpio";
> > +				};
> > +
> > +				reset_key_pin: reset-key-pin {
> > +					marvell,pins = "mpp65";
> > +					marvell,function = "gpio";
> > +				};
> > +			};
> 
> You can also skip these. The gpio driver will put the pin into gpio
> mode when the leds/keys driver claims it. It is a case of, i didn't
> know that, put entries like this into a number of files, and people
> have been copying my mistake ever since. Thomas made an effort to
> correct this for some boards.

Thomas just talked to me about this. What i said is right, but wrong.

It is correct they are not required. The gpio driver and pinctrl will
do the right thing without these. However, having these entries is
good because it improves what you see in /debugfs/pinctrl. There is a
name in the output. So please do keep these entries, and sorry for the
noise.

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
