From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH RESEND 1/3] arm64: add THUNDER2 processor family
Date: Mon, 6 Feb 2017 14:44:13 +0100
Message-ID: <CAK8P3a1_dQZd3RRyavMKqBFcHsXTQ2oAUO5vaLhyTiH99XhqrQ@mail.gmail.com>
References: <1486233461-2679-1-git-send-email-jnair@caviumnetworks.com>
 <1486233461-2679-2-git-send-email-jnair@caviumnetworks.com> <20170206100608.GA8540@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170206100608.GA8540-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 6, 2017 at 11:06 AM, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org> wrote:
> On Sat, Feb 04, 2017 at 06:37:39PM +0000, Jayachandran C wrote:
>> Add support for ThunderX2 CN99XX arm64 server processors.
>>
>> Introduce a new arm64 platform config option ARCH_THUNDER2 for these
>> processors. Add device tree files boot/dts/cavium/thunder-99xx.dtsi for
>> on-chip devices and boot/dts/cavium/thunder-99xx.dts for the evaluation
>> board.
>>
>> Signed-off-by: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
>> ---
>>  arch/arm64/Kconfig.platforms                 |   7 ++
>>  arch/arm64/boot/dts/cavium/Makefile          |   1 +
>>  arch/arm64/boot/dts/cavium/thunder-99xx.dts  |  34 +++++++
>>  arch/arm64/boot/dts/cavium/thunder-99xx.dtsi | 147 +++++++++++++++++++++++++++
>
> This is basically identical to vulcan.dtsi. Do we really need both in the
> tree?

Hmm, an alternative would be to add the new .dtsi file and start out with an
#include of the existing file, with overrides for anything that needs changing.
Similarly, the Kconfig symbol could just 'select ARCH_VULCAN' for now.

     Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
