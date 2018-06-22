From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v9 3/5] ARM: dts: Renesas R9A06G032 base device tree file
Date: Fri, 22 Jun 2018 13:25:56 +0100
Message-ID: <e90e0670-3cf5-4430-3b4a-8f7ad520938d@arm.com>
References: <1528973829-25493-1-git-send-email-michel.pollet@bp.renesas.com>
 <1528973829-25493-4-git-send-email-michel.pollet@bp.renesas.com>
 <CAMuHMdXamhn2GZs41i=wHXSRn0HgeHg4=7=g7pg7uni3LizK9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXamhn2GZs41i=wHXSRn0HgeHg4=7=g7pg7uni3LizK9w@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Michel Pollet <michel.pollet@bp.renesas.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Phil Edworthy <phil.edworthy@renesas.com>, Michel Pollet <buserror+upstream@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 22/06/18 13:14, Geert Uytterhoeven wrote:
> Hi Michel,
> 
> CC MarcZ
> 
> On Thu, Jun 14, 2018 at 1:02 PM Michel Pollet
> <michel.pollet@bp.renesas.com> wrote:
>> This adds the Renesas R9A06G032 bare bone support.
>>
>> This currently only handles the SYSCTRL block note,
>> generic parts (gic, architected timer) and a UART.
>>
>> Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
> 
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/r9a06g032.dtsi
> 
>> +       timer {
>> +               compatible = "arm,cortex-a7-timer",
> 
> Checkpatch says:
> WARNING: DT compatible string "arm,cortex-a7-timer" appears
> un-documented -- check ./Documentation/devicetree/bindings/
> 
>> +                            "arm,armv7-timer";
> 
> Documentation/devicetree/bindings/arm/arch_timer.txt says:
> 
>     compatible should at least contain "arm,armv7-timer"
> 
> but fails to list other possible values?

The idea is that you could add something useful that matches your CPU.
Adding new CPU types in the binding seems to be a never ending battle...

> 
>> +               interrupt-parent = <&gic>;
>> +               arm,cpu-registers-not-fw-configured;

Really? :-(

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
