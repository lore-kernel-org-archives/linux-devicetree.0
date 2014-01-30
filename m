From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: Re: [PATCH] ARM: keystone: dts: disable "msmcsram" clock
Date: Thu, 30 Jan 2014 15:58:39 +0200
Message-ID: <52EA5A8F.7070107@ti.com>
References: <1391082343-13371-1-git-send-email-ivan.khoronzhuk@ti.com> <448912EABC71F84BBCADFD3C67C4BE52A0B4B6@DBDE04.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <448912EABC71F84BBCADFD3C67C4BE52A0B4B6@DBDE04.ent.ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "galak@codeaurora.org" <galak@codeaurora.org>
Cc: "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Ok. I will delete node for this clock from DT and send v1

On 01/30/2014 03:25 PM, Shilimkar, Santosh wrote:
> Disable is not good idea since it conveys wrong info....
>
> Hyperlink case was different.
>
> Sent from my Android phone using TouchDown (www.nitrodesk.com)
>
> -----Original Message-----
> *From:* Khoronzhuk, Ivan [ivan.khoronzhuk@ti.com]
> *Received:* Thursday, 30 Jan 2014, 6:45am
> *To:* robh+dt@kernel.org [robh+dt@kernel.org]; galak@codeaurora.org
> [galak@codeaurora.org]
> *CC:* pawel.moll@arm.com [pawel.moll@arm.com]; mark.rutland@arm.com
> [mark.rutland@arm.com]; ijc+devicetree@hellion.org.uk
> [ijc+devicetree@hellion.org.uk]; linux@arm.linux.org.uk
> [linux@arm.linux.org.uk]; devicetree@vger.kernel.org
> [devicetree@vger.kernel.org]; linux-arm-kernel@lists.infradead.org
> [linux-arm-kernel@lists.infradead.org]; linux-kernel@vger.kernel.org
> [linux-kernel@vger.kernel.org]; Shilimkar, Santosh [santosh.shilimkar@ti.com];
> Khoronzhuk, Ivan [ivan.khoronzhuk@ti.com]
> *Subject:* [PATCH] ARM: keystone: dts: disable "msmcsram" clock
>
> At late init all unused clocks are disabled. So clocks that were not
> get before will be gated. In Keysone 2 SoC we have at least one
> necessary clock that is not used by any driver - "msmcsram". This
> clock is necessary, because it supplies the Multicore Shared Memory
> Controller (MSMC). The MSMC provides memory protection for accesses to
> the MSMC SRAM and DDR3 memory from system masters. It also manages
> traffic among mastering peripherals and the EMIF.
>
> This means that MSMC clock is always needed by SoC and cannot be gated.
> It is only one from necessary clocks that was not used by any driver.
> So to avoid its gating at late init we have to disable it in DT.
>
> Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
> ---
>    arch/arm/boot/dts/keystone-clocks.dtsi | 1 +
>    1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/keystone-clocks.dtsi
> b/arch/arm/boot/dts/keystone-clocks.dtsi
> index 2363593..e7aea2e 100644
> --- a/arch/arm/boot/dts/keystone-clocks.dtsi
> +++ b/arch/arm/boot/dts/keystone-clocks.dtsi
> @@ -332,6 +332,7 @@ clocks {
>                    compatible = "ti,keystone,psc-clock";
>                    clocks = <&chipclk1>;
>                    clock-output-names = "msmcsram";
> +               status = "disabled";
>                    reg = <0x02350038 0xb00>, <0x0235001c 0x400>;
>                    reg-names = "control", "domain";
>                    domain-id = <7>;
> -- 
> 1.8.3.2
>
