From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: Add mediatek MT8173 SoC and  evaluation board dts and Makefile
Date: Wed, 24 Dec 2014 08:47:36 +0000
Message-ID: <823671a45699c6b7ca6db5243f111d0b@www.loen.fr>
References: <1418825853-10934-1-git-send-email-eddie.huang@mediatek.com>
 <1419321723.14341.38.camel@mtksdaap41>
 <72aa7f4069a000c6e39c53e328015aa3@www.loen.fr> <1947751.D0rZorCFoT@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1947751.D0rZorCFoT@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@linaro.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Robert Richter <rrichter@cavium.com>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Joe.C" <yingjoe.chen@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, Jason Cooper <jason@lakedaemon.net>, linux-arm-kernel@lists.infradead.org, yh.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

On 2014-12-23 21:07, Arnd Bergmann wrote:
> On Tuesday 23 December 2014 08:43:55 Marc Zyngier wrote:
>>
>> > Neverthless, MT8173 SoC already use 0x10224000 and 0x10225000 as 
>> VGIC
>> > base address.
>>
>> Then its fate is sealed virtualization wise.
>
> It should still work with 4kb pages on the host, right? Would that 
> still
> allow you to have 64kb pages on the guest, or does the guest page 
> size
> have to be smaller or equal to the host?

Of course, it will still work with 4kB pages, and the guest can still 
use
whatever page size it wants, including 64kB. Not very good from a 
performance
point of view, but it will work.

My main worry is that we're already starting to see more and more 
platforms
having divergent requirements in their MM setup, and distributions are 
going
to struggle to provide a full-featured single kernel image, specially 
as some
feel the need to push 64kB pages down to everybody's throat.

Thanks,

         M.
-- 
Fast, cheap, reliable. Pick two.
