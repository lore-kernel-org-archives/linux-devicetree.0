From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: ls1021a: fix incorrect clock references
Date: Wed, 27 Dec 2017 12:14:07 +0800
Message-ID: <20171227041405.GA5286@X250>
References: <20171221214432.3658852-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171221214432.3658852-1-arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Jingchang Lu <b35083-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 21, 2017 at 10:44:20PM +0100, Arnd Bergmann wrote:
> dtc warns about two 'clocks' properties that have an extraneous '1'
> at the end:
> 
> arch/arm/boot/dts/ls1021a-qds.dtb: Warning (clocks_property): arch/arm/boot/dts/ls1021a-twr.dtb: Warning (clocks_property): Property 'clocks', cell 1 is not a phandle reference in /soc/i2c@2180000/mux@77/i2c@4/sgtl5000@2a
> arch/arm/boot/dts/ls1021a-qds.dtb: Warning (clocks_property): Missing property '#clock-cells' in node /soc/interrupt-controller@1400000 or bad phandle (referred from /soc/i2c@2180000/mux@77/i2c@4/sgtl5000@2a:clocks[1])
> Property 'clocks', cell 1 is not a phandle reference in /soc/i2c@2190000/sgtl5000@a
> arch/arm/boot/dts/ls1021a-twr.dtb: Warning (clocks_property): Missing property '#clock-cells' in node /soc/interrupt-controller@1400000 or bad phandle (referred from /soc/i2c@2190000/sgtl5000@a:clocks[1])
> 
> The clocks that get referenced here are fixed-rate, so they do not
> take any argument, and dtc interprets the next cell as a phandle, which
> is invalid.
> 
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

Hi Arnd,

Thanks for the patch.  But I have queued up a couple of patches from
Fabio [1] for that.

Shawn

[1] https://www.spinics.net/lists/arm-kernel/msg624303.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
