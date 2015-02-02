From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] ARM: shmobile: silk: initial device tree
Date: Mon, 02 Feb 2015 23:57:50 +0300
Message-ID: <54CFE4CE.5090406@cogentembedded.com>
References: <201404250239.39150.sergei.shtylyov@cogentembedded.com> <1608366.HtA9yBksdO@wasted.cogentembedded.com> <20150202110557.GC7459@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <20150202110557.GC7459@leverpostej>
Sender: linux-sh-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "horms@verge.net.au" <horms@verge.net.au>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 02/02/2015 02:05 PM, Mark Rutland wrote:

>> Add the initial device tree for the R8A7794 SoC based SILK low cost board.
>> SCIF2 serial port support is included, so that the serial console can work.

>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

>> Index: renesas/arch/arm/boot/dts/r8a7794-silk.dts
>> ===================================================================
>> --- /dev/null
>> +++ renesas/arch/arm/boot/dts/r8a7794-silk.dts
>> @@ -0,0 +1,41 @@
>> +/*
>> + * Device Tree Source for the SILK board
>> + *
>> + * Copyright (C) 2014 Renesas Electronics Corporation
>> + * Copyright (C) 2014-2015 Renesas Solutions Corp.
>> + * Copyright (C) 2014-2015 Cogent Embedded, Inc.
>> + *
>> + * This file is licensed under the terms of the GNU General Public License
>> + * version 2.  This program is licensed "as is" without any warranty of any
>> + * kind, whether express or implied.
>> + */
>> +
>> +/dts-v1/;
>> +#include "r8a7794.dtsi"
>> +
>> +/ {
>> +	model = "SILK";

> Shouldn't that have a "Renesas" prefix or something like that?

    Historically. no SH-Mobile .dts has used the vendor name in the "model" 
prop. I defer the decision to Simon but I think we should be at least consistent.

> It's unlikely that there will be another board called "SILK", but it
> does make it hard for someone to get an idea of what the board is from
> the model string alone.

    Tend to agree here.

> Mark.

WBR, Sergei

