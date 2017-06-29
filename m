From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: dts: sama5d27_som1_ek: Add sama5d27 SoM1 EK
 support
Date: Thu, 29 Jun 2017 14:16:55 +0200
Message-ID: <20170629121655.37pq7cnabvv4wh7z@piout.net>
References: <1498736674-9233-1-git-send-email-claudiu.beznea@microchip.com>
 <1498736674-9233-6-git-send-email-claudiu.beznea@microchip.com>
 <20170629115931.yki2xbehyicbtx3w@tarshish>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170629115931.yki2xbehyicbtx3w@tarshish>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
Cc: Claudiu Beznea <claudiu.beznea-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, sza-4N5lU0Zj96A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cristian.birsan-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 29/06/2017 at 14:59:31 +0300, Baruch Siach wrote:
> Hi Claudiu,
> 
> On Thu, Jun 29, 2017 at 02:44:34PM +0300, Claudiu Beznea wrote:
> > Add specifig DTS files and bindings for sama5d27 SoM1 EK board.
> 
> Is there any publicly available information on this SoM?
> 
> One more comment below.
> 
> > Signed-off-by: Claudiu Beznea <claudiu.beznea-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> > Signed-off-by: Cristian Birsan <cristian.birsan-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
> > ---
> 
> [snip]
> 
> > +	memory {
> > +		reg = <0x20000000 0x20000>;
> 
> Are you sure this SoM has 132KB RAM?
> 
> Since you seem to rely on the bootloader to fill in the right size value, you 
> can just drop this node and rely on sama5d2.dtsi that provides a stub node.
> 

Yeah, that is what I would do too.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
