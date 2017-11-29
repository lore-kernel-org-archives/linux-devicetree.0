From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: at91: disable the nxp,se97b SMBUS
 timeout on the TSE-850
Date: Wed, 29 Nov 2017 21:56:29 +0100
Message-ID: <20171129205629.GO21126@piout.net>
References: <20171127163101.27859-1-peda@axentia.se>
 <20171127163101.27859-3-peda@axentia.se>
 <20171129205311.GA20551@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171129205311.GA20551-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Ludovic Desroches <ludovic.desroches-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 29/11/2017 at 12:53:11 -0800, Guenter Roeck wrote:
> On Mon, Nov 27, 2017 at 05:31:01PM +0100, Peter Rosin wrote:
> > The I2C adapter driver is sometimes slow, causing the SCL line to
> > be stuck low for more than the stipulated SMBUS timeout of 25-35 ms.
> > This causes the client device to give up which in turn causes silent
> > corruption of data. So, disable the SMBUS timeout in the client device.
> > 
> > Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
> 
> Acked-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> 
> I assume this will be sent upstream through an arm tree.
> 

Yes, I'm applying it right now.

> Thanks,
> Guenter
> 
> > ---
> >  arch/arm/boot/dts/at91-tse850-3.dts | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm/boot/dts/at91-tse850-3.dts b/arch/arm/boot/dts/at91-tse850-3.dts
> > index 5f29010cdbd8..9b82cc8843e1 100644
> > --- a/arch/arm/boot/dts/at91-tse850-3.dts
> > +++ b/arch/arm/boot/dts/at91-tse850-3.dts
> > @@ -221,6 +221,7 @@
> >  	jc42@18 {
> >  		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
> >  		reg = <0x18>;
> > +		smbus-timeout-disable;
> >  	};
> >  
> >  	dpot: mcp4651-104@28 {
> > -- 
> > 2.11.0
> > 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
