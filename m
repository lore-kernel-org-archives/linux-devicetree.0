From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: kirkwood: add dts support for Seagate
 BlackArmor NAS220
Date: Tue, 16 Dec 2014 20:20:20 +0100
Message-ID: <20141216192020.GB12820@lunn.ch>
References: <20141215203855.GA28940@anne>
 <20141216085645.GB1450@lunn.ch>
 <20141216163714.GE20170@anne>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141216163714.GE20170@anne>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Evgeni Dobrev <evgeni-c3HRhe8yoGxdzLpqerNdyw@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

> The LED can be either one of the two colors or off. Swapping the
> polarity on the two LED pins changes the color.

O.K, so it is using the diode property of a Light Emitting Diode, to
support two colours.

> I am currently playing with the idea to create a multicolor LED kernel 
> driver which is being controlled via GPIOs, but I still have not found 
> the proper abstraction for it.

Maybe multi-colour is too far. Just support bi-colour via two gpios.
Still, it is not so simple. As you said, the led class does not give
too good an abstraction. I guess the best you can do is that when you
turn one on, it automagically turns the other off.

> The point is, that even though this functionality must currently be
> handled by user space (some combination of sysfs writes and a shell
> script) at the moment, the rest of the system is usable.

Sure, we will take the DT file without support for the bicolour
LED. It can be added later.

      Andrew
 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
