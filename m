From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 06/13] ARM: dts: armada-375: Fixup sa-ram DT warning
Date: Fri, 18 Nov 2016 13:06:17 +0100
Message-ID: <8737ipat6u.fsf@free-electrons.com>
References: <20161117230830.31047-1-gregory.clement@free-electrons.com>
        <20161117230830.31047-7-gregory.clement@free-electrons.com>
        <20161118095925.770496c3@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161118095925.770496c3-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> (Thomas Petazzoni's
        message of "Fri, 18 Nov 2016 09:59:25 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Thomas,
 
 On ven., nov. 18 2016, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Hello,
>
> On Fri, 18 Nov 2016 00:08:23 +0100, Gregory CLEMENT wrote:
>
>> -		crypto_sram0: sa-sram0 {
>> +		/* The following unit addresses (for sa-sram) are composed of
>> +		 * the target value (bit [40-47]), attributes value (bits
>> +		 * [32-39], and the address value in the window memory: [0-31].
>> +		 */
>
> The "address value in the window memory" part doesn't make a lot of
> sense. Maybe:
>
> "The following unit addresses are composed of the window target ID
> (bits 40-47), the window target attributes (bits 32-39) and the offset
> inside the window."

I'm fine with it

>
> Also, the comment formatting is not compliant with the coding style,
> should be:
>
>  /*
>   * ...
>   * ...
>   */
>

Hum yes I need to teach emacs how to properly format the comments.

> But do we really want this comment above each node? Couldn't we instead
> add this explanation in the mvebu-mbus.txt DT binding?

We could but I fear that nobody will read it.

Indeed if you know that in order to understand the unit address, you will
have to have a look an the binding of the mvebu-mbus, then it means that
you already are an expert and actually you barely need to read it!

In order to have less change we could at least put it near the MBUS_ID
macro and if the mvebu-mbus.txt DT binding too.


Gregory
>
> Best regards,
>
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
