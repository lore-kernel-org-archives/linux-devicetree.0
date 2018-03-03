From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v4 4/6] MIPS: mscc: add ocelot PCB123 device tree
Date: Sat, 3 Mar 2018 11:33:55 +0300
Message-ID: <39189775-0c56-93b6-21e5-ac4d814d1879@cogentembedded.com>
References: <20180302224811.26840-1-alexandre.belloni@bootlin.com>
 <20180302224811.26840-5-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180302224811.26840-5-alexandre.belloni@bootlin.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: Allan Nielsen <Allan.Nielsen@microsemi.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello!

On 3/3/2018 1:48 AM, Alexandre Belloni wrote:

> Add a device tree for the Microsemi Ocelot PCB123 evaluation board.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
[...]
> diff --git a/arch/mips/boot/dts/mscc/ocelot_pcb123.dts b/arch/mips/boot/dts/mscc/ocelot_pcb123.dts
> new file mode 100644
> index 000000000000..42bd404471f6
> --- /dev/null
> +++ b/arch/mips/boot/dts/mscc/ocelot_pcb123.dts
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/* Copyright (c) 2017 Microsemi Corporation */
> +
> +/dts-v1/;
> +
> +#include "ocelot.dtsi"
> +
> +/ {
> +	compatible = "mscc,ocelot-pcb123", "mscc,ocelot";
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory {

    Needs to be "memory@0" as you have the "regs" prop.

> +		device_type = "memory";
> +		reg = <0x0 0x0e000000>;
> +	};
> +};
[...]

MBR, Sergei
