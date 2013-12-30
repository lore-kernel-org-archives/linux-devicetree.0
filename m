From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: commit e38c0a1f breaks powerpc boards with uli1575 chip
Date: Mon, 30 Dec 2013 14:13:20 +1100
Message-ID: <1388373200.4373.25.camel@pasglop>
References: <201312171135.38576@blacky.localdomain>
	 <52B1EC15.5070606@gmail.com> <201312190842.02702@blacky.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201312190842.02702-vlktAfmDCSZSq9BJjBFyUp/QNRX+jHPU@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikita Yushchenko <nyushchenko-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Dmitry Krivoschekov <dkrivoschokov-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org>, Alexey Lugovskoy <lugovskoy-jFhMxQ4mL6a2X5qOxWx28w@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2013-12-19 at 08:42 +0400, Nikita Yushchenko wrote:
> No, this does not help.
> 
> I've dumped the actual content of 'range' and 'addr' at the failure
> point 
> (i.e. ar point that returns error with e38c0a1f but passes without 
> e38c0a1f ):
> 
> OF: default map, cp=0, s=10000, da=70
> range:  01 00 00 00 00 00 00 00 00 00 00 00
>  addr:  00 00 00 00 00 00 00 00 00 00 00 70

Something that has a #address-cells larger than 2, or more generally,
an address field that contains more than a single number, must have
a specific translation backend, like we have for PCI.

This is a bit annoying but originates from the original OFW stuff on
which this stuff is based where the bus node would provide the methods
for translation.

Cheers,
Ben.
 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
