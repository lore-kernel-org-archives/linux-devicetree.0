From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: armada-388-clearfog: remove duplicate mdio entry
Date: Mon, 11 Jul 2016 18:05:44 +0200
Message-ID: <87eg70tb1j.fsf@free-electrons.com>
References: <E1bMGdu-00005c-Dy@rmk-PC.armlinux.org.uk>
	<20160710203220.GA26397@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160710203220.GA26397-g2DYL2Zd6BY@public.gmane.org> (Andrew Lunn's message of "Sun,
	10 Jul 2016 22:32:20 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jon Nettleton <jon-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Russell,
 
 On dim., juil. 10 2016, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:

> On Sun, Jul 10, 2016 at 04:27:38PM +0100, Russell King wrote:
>> The clearfog DTS should not be defining the on-board phy, this device
>> is located on the microsom.  Remove the duplicated definition.
>> 
>> Reported-by: Jon Nettleton <jon-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>
>> Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
>
> Reviewed-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

Applied on mvebu/dt

Thanks,

Gregory

>
>     Andrew

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
