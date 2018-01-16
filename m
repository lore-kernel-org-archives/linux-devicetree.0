From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: at91: nattis: use up-to-date mtd partitions
Date: Tue, 16 Jan 2018 23:17:59 +0100
Message-ID: <6c12eff3-b85d-136d-bd93-266a2ccfd926@axentia.se>
References: <20180116160835.27943-1-peda@axentia.se>
 <20180116160835.27943-2-peda@axentia.se> <20180116163015.GG2678@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180116163015.GG2678-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2018-01-16 17:30, Alexandre Belloni wrote:
> Hi,
> 
> On 16/01/2018 at 17:08:33 +0100, Peter Rosin wrote:
>> The nattis currently relies on the cmdline to correctly configure the
>> MTD partition table, and the one given in the device tree is simply
>> ignored. Which is fortunate, since the device tree partition table is
>> bonkers and does not match reality.
>>
> 
> Shouldn't it be simply removed then?

Hmm, that's a thought! Less is more, and all that. However, I think I
rather have it in the device tree anyway. Then I have the option to
drop a lot of tedious cmdline args in the future.

Cheers,
Peter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
