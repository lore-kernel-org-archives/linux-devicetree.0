From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: initial Eagle board device
 tree
Date: Wed, 4 Oct 2017 14:03:24 +0300
Message-ID: <9ad9bd62-300c-cc78-a8f3-bbdd9eed6bed@cogentembedded.com>
References: <20170915194445.950496886@cogentembedded.com>
 <CAMuHMdUX+RW9H-p5n_JB-SkW8k5g_i0bg-i9LD59b5MLvFm3YQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUX+RW9H-p5n_JB-SkW8k5g_i0bg-i9LD59b5MLvFm3YQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@verge.net.au>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

Hello!

On 9/21/2017 4:18 PM, Geert Uytterhoeven wrote:

>> Add the initial device  tree for  the R8A77970 SoC based Eagle board.
>> The board has 1 debug serial port (SCIF0); include support for it,
>> so that the serial console can work.
>>
>> Based on the original (and large) patch by Vladimir Barinov
>> <vladimir.barinov@cogentembedded.com>.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
>> --- /dev/null
>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
>> @@ -0,0 +1,45 @@
>> +/*
>> + * Device Tree Source for the Eagle board
>> + *
>> + * Copyright (C) 2016-2017 Renesas Electronics Corp.
>> + * Copyright (C) 2017 Cogent Embedded, Inc.
>> + *
>> + * This file is licensed under the terms of the GNU General Public License
>> + * version 2.  This program is licensed "as is" without any warranty of any
>> + * kind, whether express or implied.
>> + */
>> +
>> +/dts-v1/;
>> +#include "r8a77970.dtsi"
>> +
>> +/ {
>> +       model = "Renesas Eagle board based on r8a77970";
>> +       compatible = "renesas,eagle", "renesas,r8a77970";
>> +
>> +       aliases {
>> +               serial0 = &scif0;
>> +       };
>> +
>> +       chosen {
>> +               bootargs = "ignore_loglevel";
>> +               stdout-path = "serial0:115200n8";
>> +       };
>> +
>> +       memory@48000000 {
>> +               device_type = "memory";
>> +               /* first 128MB is reserved for secure area. */
>> +               reg = <0x0 0x48000000 0x0 0x38000000>;
>> +       };
>> +};
>> +
>> +&extal_clk {
>> +       clock-frequency = <16666666>;
> 
> Nitpicking: the schematics say 16.6666 MHz
> At 100 ppm accuracy that's the same, though.

    So, you still want me to change this freq?

> Gr{oetje,eeting}s,
> 
>                          Geert

MBR, Sergei
