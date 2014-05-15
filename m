From: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: kirkwood: add kirkwood-km_fixedeth DTS
 file
Date: Thu, 15 May 2014 17:07:48 +0200
Message-ID: <5374D844.7070300@keymile.com>
References: <1400147335-20947-1-git-send-email-valentin.longchamp@keymile.com> <1400147335-20947-4-git-send-email-valentin.longchamp@keymile.com> <20140515130831.GC32684@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140515130831.GC32684-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Linux device trees <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/15/2014 03:08 PM, Andrew Lunn wrote:
>> +	i2c@0 {
>> +		compatible = "i2c-gpio";
>> +		gpios = < &gpio0 8 GPIO_ACTIVE_HIGH		/* sda */
>> +			  &gpio0 9 GPIO_ACTIVE_HIGH>;		/* scl */
>> +		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
>> +	};
> 
> Hi Valentin
> 
> Anything interesting on the i2c bus?

Well yes, but this is then board specific (for all the Keymile variants of the
reference design). Since all these variants are not mainlined, I have added
nothing yet, but this may come later since we are currently reworking our I2C
bus support/topology.

> 
> Does this SoC not have the hardware i2c? I don't see a node for it
> here.
> 

The SoC does have the hardware I2C, but we don't use it and use the above
bitbang one instead. I was not in the company when this was chosen/designed. The
main reason is that the Kirkwood's one is not fast enough (clk < 96 kHz) for our
usage (we have A LOT of different things on this BUS, some must be quick - the
bus speed gets changed from (uuuurrghhh) userpace - and this is a NIGHTMARE,
believe me).

Valentin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
