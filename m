From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 09/13] ARM: dts: armada-375: Fixup soc DT warning
Date: Fri, 18 Nov 2016 10:01:32 +0100
Message-ID: <87d1htb1qr.fsf@free-electrons.com>
References: <20161117230830.31047-1-gregory.clement@free-electrons.com>
        <20161117230830.31047-10-gregory.clement@free-electrons.com>
        <20161118095455.00bfe007@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161118095455.00bfe007-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> (Thomas Petazzoni's
        message of "Fri, 18 Nov 2016 09:54:55 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Thomas,
 
 On ven., nov. 18 2016, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> Hello,
>
> On Fri, 18 Nov 2016 00:08:26 +0100, Gregory CLEMENT wrote:
>
>> -	soc {
>> +	/* The following unit address is composed of the target
>> +	 * value (bit [40-47]), attributes value (bits [32-39],
>> +	 * and the address value in the window memory: [0-31].
>> +	 */
>> +	soc@f00100000000 {
>
> Where is this value coming from? Why does the soc node needs to have a

It cames from the dts files.

> unit address? It doesn't have a 'reg' property if I remember
> correctly.

But it has a range property.

Gregory

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
