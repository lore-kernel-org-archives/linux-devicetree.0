From: Angus Ainslie <angus@akkea.ca>
Subject: Re: [PATCH] arm64: dts: fsl: imx8mq: enable the svns power key
Date: Tue, 28 May 2019 06:00:19 -0700
Message-ID: <9a2361a08a0b8a1be1e2f5921026661f@www.akkea.ca>
References: <20190528124406.29730-1-angus@akkea.ca>
 <1559047905.4039.15.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559047905.4039.15.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: angus.ainslie@puri.sm, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Carlo Caione <ccaione@baylibre.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Lucas,

On 2019-05-28 05:51, Lucas Stach wrote:
> Hi Angus,
> 
> Am Dienstag, den 28.05.2019, 05:44 -0700 schrieb Angus Ainslie 
> (Purism):
>> Add the snvs power key.
>> 
>> > Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
>> ---
>>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi 
>> b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
>> index 45d10d8efd14..5f93fd9662ae 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
>> @@ -8,6 +8,7 @@
>>  #include <dt-bindings/power/imx8mq-power.h>
>>  #include <dt-bindings/reset/imx8mq-reset.h>
>>  #include <dt-bindings/gpio/gpio.h>
>> +#include "dt-bindings/input/input.h"
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/thermal/thermal.h>
>>  #include "imx8mq-pinfunc.h"
>> @@ -463,6 +464,14 @@
>> >  					interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
>> >  						<GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
>> >  				};
>> +
>> > +				snvs_pwrkey: snvs-powerkey {
>> > +					compatible = "fsl,sec-v4.0-pwrkey";
>> > +					regmap = <&snvs>;
>> > +					interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
>> > +					linux,keycode = <KEY_POWER>;
>> +					wakeup-source;
> 
> Not all i.MX8MQ systems will have this functionality wired up at the
> board level, so this node needs to be disabled by default. The existing
>  i.MX6 and i.MX7 DTs seem to get this wrong.
> 

Ok I'll fix that for the next rev.

Thanks
Angus

> Regards,
> Lucas
> 
>> +				};
>> >  			};
>>  
>> > >  			clk: clock-controller@30380000 {
