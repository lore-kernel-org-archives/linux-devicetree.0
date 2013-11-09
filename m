From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH] ARM: mvebu: Add Netgear ReadyNAS 2120 board
Date: Sat, 9 Nov 2013 22:08:36 +0100
Message-ID: <20131109210836.GK14890@lunn.ch>
References: <87bo1tmibv.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <87bo1tmibv.fsf-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 09, 2013 at 09:27:32PM +0100, Arnaud Ebalard wrote:
> 
> All hardware parts of the (mv78230 Armada XP based) NETGEAR ReadyNAS
> 2120 are supported by mainline kernel (USB 3.0 and eSATA rear ports,
> USB 2.0 front port, Gigabit controller and PHYs for the two rear ports,
> serial port, LEDs, Buttons, 88SE9170 SATA controllers, three G762 fan
> controllers, G751 temperature sensor) except for:

> +			i2c@11000 {
> +				compatible = "marvell,mv64xxx-i2c";
> +				clock-frequency = <400000>;
> +				status = "okay";
> +
> +				/* Rear fan #1 of 3 (Protechnic MGT4012XB-O20,
> +				 * 8000RPM) near eSATA port */
> +				g762_fan1: g762@3e {
> +					compatible = "gmt,g762";
> +					reg = <0x3e>;
> +					clocks = <&g762_clk>; /* input clock */
> +					fan_gear_mode = <0>;
> +					fan_startv = <1>;
> +					pwm_polarity = <0>;
> +				};
> +
> +				/* Rear fan #2 of 3 at the center */
> +				g762_fan2: g762@48 {
> +					compatible = "gmt,g762";
> +					reg = <0x48>;
> +					clocks = <&g762_clk>; /* input clock */
> +					fan_gear_mode = <0>;
> +					fan_startv = <1>;
> +					pwm_polarity = <0>;
> +				};
> +
> +				/* Rear fan #3 of 3 */
> +				g762_fan3: g762@49 {
> +					compatible = "gmt,g762";
> +					reg = <0x49>;
> +					clocks = <&g762_clk>; /* input clock */
> +					fan_gear_mode = <0>;
> +					fan_startv = <1>;
> +					pwm_polarity = <0>;
> +				};
> +
> +				g751: g751@4c {
> +					compatible = "gmt,g751";
> +					reg = <0x4c>;
> +				};

Hi Arnaud

Looks good to me. However, if for some reason you need to respin, it
would be nice to add a comment about what the g751 is. All the other
i2c devices you say what they are. No need to respin just because of
this.

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
