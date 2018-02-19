From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: renesas: initial Condor board device
 tree
Date: Mon, 19 Feb 2018 22:18:44 +0300
Message-ID: <52bd5a2c-900e-7603-4cce-efa0fb315494@cogentembedded.com>
References: <ae31804b-969b-9b20-16d0-50f5dea42f08@cogentembedded.com>
 <5cf82cb1-0278-010c-165d-07dbcbe0878d@cogentembedded.com>
 <CAMuHMdWwjXw0SwVK704_AtkDg3C-or5bUbXPwMEvTwU5eLGrpQ@mail.gmail.com>
 <da5c612d-d23d-be36-7dfe-e3e78cc2b086@cogentembedded.com>
 <20180219091223.rvumtwr6t47szrwo@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180219091223.rvumtwr6t47szrwo@verge.net.au>
Content-Language: en-MW
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 02/19/2018 12:12 PM, Simon Horman wrote:

>>>> Add the initial device  tree for  the R8A77980 SoC based Condor board.
>>>> The board has 1 debug serial port (SCIF0); include support for it, so
>>>> that the serial console can work.
>>>>
>>>> Based on the original (and large) patch by Vladimir Barinov.
>>>>
>>>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>
>>>> ---
>>>> Changes in version 2:
>>>> - removed the useless "status" property from the SCIF_CLK node;
>>>> - fixed the memory size;
>>>> - added Geert's tag.
>>>
>>>> --- /dev/null
>>>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
>>>> @@ -0,0 +1,45 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Device Tree Source for the Condor board
>>>> + *
>>>> + * Copyright (C) 2018 Renesas Electronics Corp.
>>>> + * Copyright (C) 2018 Cogent Embedded, Inc.
>>>> + */
>>>> +
>>>> +/dts-v1/;
>>>> +#include "r8a77980.dtsi"
>>>> +
>>>> +/ {
>>>> +       model = "Renesas Condor board based on r8a77980";
>>>> +       compatible = "renesas,condor", "renesas,r8a77980";
>>>> +
>>>> +       aliases {
>>>> +               serial0 = &scif0;
>>>> +       };
>>>> +
>>>> +       chosen {
>>>> +               stdout-path = "serial0:115200n8";
>>>> +       };
>>>> +
>>>> +       memory@48000000 {
>>>> +               device_type = "memory";
>>>> +               /* first 128MB is reserved for secure area. */
>>>> +               reg = <0 0x48000000 0 0xb8000000>;
>>>
>>> Shouldn't the size be 0x78000000, or is there really 3 GiB of RAM?
>>
>>    Ugh, so I finally mixed up limit and size... :-/
> 
> Thanks, I will apply the following, with the memory corrected to 2 GiB.

   Thank you! Just made sure that whatever is in this node in .dts, the RAM size
ends up being 0x78000000. Probably U-Boot is too smart. :-)

MBR, Sergei
