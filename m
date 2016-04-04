From: Bert Vermeulen <bert-Nh2F35Ii2RQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: kirkwood: Add DTS for Linksys EA4200v2/EA4500
Date: Mon, 4 Apr 2016 13:51:56 +0200
Message-ID: <5702555C.1020408@biot.com>
References: <1459601753-31193-1-git-send-email-bert@biot.com>
 <20160402161639.GF32554@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160402161639.GF32554-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 04/02/2016 06:16 PM, Andrew Lunn wrote:
> On Sat, Apr 02, 2016 at 02:55:52PM +0200, Bert Vermeulen wrote:
>> + * (c) 2013 Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
>> + * (c) 2013 Deutsche Telekom Innovation Laboratories
>> + * (c) 2014 Luka Perkov <luka-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
>> + * (c) 2014 Randy C. Will <randall.will-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> + *
>> + * This file is licensed under the terms of the GNU General Public
>> + * License version 2.  This program is licensed "as is" without any
>> + * warranty of any kind, whether express or implied.
>> + */
>
> Could you dual license this under X11 as well? You will need agreement
> from the copyright holders above, if they wrote DT fragments.
 >
 > Not many kirkwood boards are, but we encourage most Marvell SoCs DT
 > files to be dual license.

I did not get responses from all authors, so no dice.

>> +	chosen {
>> +		bootargs = "console=ttyS0,115200n8 earlyprintk";
>
> Please change this to stdout-path = "serial0:115200n8";

I've added a serial alias (the actual label is uart0). That alias and one 
for serial1 might perhaps be better in kirkwood.dts, but I'll leave that up 
to you.

> The 6171 is a 7 port device. Is the last port also a 'cpu' port?

I don't think so. I didn't manage to get anything through it, and I can't 
see the CPU traces on the PCB (neither 5 nor 6).


-- 
Bert Vermeulen
bert-Nh2F35Ii2RQ@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
