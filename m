From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH V2 2/2] ARM: shmobile: r8a7791: add i2c2 bus to koelsch dt
Date: Sun, 11 May 2014 09:08:35 +0900
Message-ID: <20140511000834.GM31760@verge.net.au>
References: <1392633882-12142-1-git-send-email-wsa@the-dreams.de>
 <1392633882-12142-2-git-send-email-wsa@the-dreams.de>
 <536C1945.1000601@cogentembedded.com>
 <20140509050610.GB2624@katana>
 <536D5DC3.3070409@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <536D5DC3.3070409-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 10, 2014 at 02:59:15AM +0400, Sergei Shtylyov wrote:
> Hello.
> 
> On 05/09/2014 09:06 AM, Wolfram Sang wrote:
> 
> >>>+	eeprom@50 {
> >>>+		compatible = "renesas,24c02";
> 
> >>    This is not quite right: Renesas' part is called differently, and
> >>you're carrying the other vendor's naming onto Renesas parts. I'd
> >>just say "24c02" (which I'll do in the Henninger board patch).
> 
> >What about "generic"?
> 
>    I don't know, really. However, you're right in that there should
> be some vendor prefix -- I've just seen
> Documentation/devicetree/bindings/eeprom.txt.

A quick survey of arch/arm/boot/dts/ yields:

"atmel,24c02" (22 times)
"microchip,24c02" (once)
"mcp,24c02" (once)

So it seems to me that precedence is in favour of using "renesas,24c02".
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
