From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 0/3] ARM: l2c: add l2c support for RZ/A1
Date: Thu, 16 Feb 2017 17:57:53 +0100
Message-ID: <CAK8P3a1ri2o4An0svxSG4iSvwTkdpM5jiC=SzBq7mE6TpbdhKQ@mail.gmail.com>
References: <20170216161742.29320-1-chris.brandt@renesas.com> <20170216164424.GR27312@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170216164424.GR27312@n2100.armlinux.org.uk>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Chris Brandt <chris.brandt@renesas.com>, Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brad Mouring <brad.mouring@ni.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Richard Cochran <rcochran@linutronix.de>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 16, 2017 at 5:44 PM, Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:
> On Thu, Feb 16, 2017 at 11:17:39AM -0500, Chris Brandt wrote:
>> The PL310 in the Renesas RZ/A1 SoC (R7S72100) does not have the sideband
>> signals connected between the CPU and L2C. According the PL310 TRM,
>> sideband signals are optional.
>>
>> If a PL310 is added to a system, but the sideband signals are not
>> connected, some Cortex A9 optimizations cannot be used. In particular,
>> enabling Full Line Zeros in the CA9 without sidebands connected will
>> crash the system since the CA9 will expect the L2C to perform operations,
>> yet the L2C never gets the commands.
>>
>> This series adds the option to not enable anything in the PL310 that
>> uses sidebands, and then adds L2C support to the RZ/A1 DT.
>>
>> v4:
>> * changed l2x0_bresp_dis to l2x0_bresp_disable
>> * changed l2x0_flz_dis to l2x0_flz_disable
>
> Looks good, thanks.
>
> I'll want to merge patch 1, but I suspect the other two patches need
> to go through arm-soc, which will cause a problem due to being merged
> independently...  Arnd?

I just checked what we have queued up in next/dt for this platform,
and I'm fairly sure that there are no conflicts, so you can pick up all three
and add

Acked-by: Arnd Bergmann <arnd@arndb.de>

     Arnd
