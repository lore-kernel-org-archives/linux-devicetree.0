From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: DTS: da850: add node for spi0
Date: Fri, 15 Apr 2016 16:20:51 -0500
Message-ID: <57115B33.90509@lechnology.com>
References: <1460586628-25152-1-git-send-email-david@lechnology.com>
 <1460586628-25152-2-git-send-email-david@lechnology.com>
 <5710C176.3040304@ti.com> <57111433.6080402@lechnology.com>
 <31522.1460751389@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <31522.1460751389-+bZmOdGhbsPr6rcHtW+onFJE71vCis6O@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Valdis.Kletnieks-PjAqaU27lzQ@public.gmane.org
Cc: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/15/2016 03:16 PM, Valdis.Kletnieks-PjAqaU27lzQ@public.gmane.org wrote:
> On Fri, 15 Apr 2016 11:17:55 -0500, David Lechner said:
>
>> I omitted this on purpose. For my use case, I am using the SPI as
>> write-only,
>
> So your SPI accesses are fire-and-forget, and nothing ever comes back?

Yes.

> Seems a very dangerous way to design the use case, with no feedback if
> something suddenly goes pear-shaped...

You should tell Sitronix. This is how their display controllers work.

>
> Or do you have ways to verify the status via some method other than SPI?
>

Nope.



I'm working with LEGO MINDSTORMS EV3, a mass-produced robotics system. 
It is what it is. And I have a logic analyzer for when things go 
pear-shaped. ;-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
