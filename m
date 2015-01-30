From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: mvebu: add ethernet to the cm-a510 board
Date: Fri, 30 Jan 2015 14:07:55 +0100
Message-ID: <54CB822B.8080809@gmail.com>
References: <E1YH5bU-0005mG-3L@bombadil.infradead.org> <20150130124144.501cf81d@armhf> <54CB732F.7010409@gmail.com> <1507191.iMZ4oC8rrr@stargate>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507191.iMZ4oC8rrr@stargate>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Goodenough <david.goodenough-6b45v/Ft3lbby3iVrkZq2A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gabriel Dobato <dobatog-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[Re-adding the most obvious People to Cc]

On 30.01.2015 13:44, David Goodenough wrote:
> On Friday 30 January 2015 13:03:59 Sebastian Hesselbarth wrote:
>> On 30.01.2015 12:41, Jean-Francois Moine wrote:
>>> On Fri, 30 Jan 2015 12:00:16 +0100
>>> Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> That what dtsi's are made for with one exception: the dtsi cannot "run"
>> on its own but needs at least one baseboard.dts that includes it. We
>> could create a "bare"-baseboard that represents what is (easily)
>> accessible on the SoM itself. Given the fact that even UART0 needs a
>> baseboard that grabs it from the SoM connector, I see no value in that.
>>
>>> In any case, any real cm-a510 board should work with the
>>> generic/full .dts even if some hardware modules are lacking. No?
>>
>> Nope. The cm-a510 is just an add-on for a baseboard, it does not make
>> a working board. Just think of it as a feature-improved SoC.

> This sounds like capes on the BeagleBoard.  Are these extension boards
> self-identifying?  If so then the approach used with the capes might work
> here too.

David,

IMHO capes are a different thing. The BB can run just fine without any
cape installed, the cm-a510 cannot run without a baseboard. Also, once
you have your SoM installed it cannot change over runtime, there is no
need for any dynamic overlays and such.

You can build some 5 or 10 different configurations given the SoM and
a specific baseboard but not hundreds of possible combinations.
Besides, Gabriel is the first in almost 2 years that actually has an
cm-a510 - so, I doubt we'll have to mainline dozens of baseboards
using the cm-a510 in the near future.

Regarding the self-identification, it would be great if the actual SoM
configuration would be stored in the (always available) SPI flash, but
from my experience with the boards I have seen so far, I have a bad
feeling about it ;) A quick look at the sb-a510 (the compulab baseboard
for cm-a510) suggests that there is more configuration available but
by jumpers that (hopefully) can be read out by GPIOs at least.

The best similar board available in mainline I can remember is the
SolidRun Hummingboard, i.e. one baseboard that can be equipped with
3-4 different SoMs.

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
