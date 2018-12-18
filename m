From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: ap806: add the cluster clock node in the syscon file
Date: Tue, 18 Dec 2018 16:46:25 +0100
Message-ID: <87efaehm7i.fsf@bootlin.com>
References: <20181216094147.6468-1-gregory.clement@bootlin.com>
        <20181216094147.6468-2-gregory.clement@bootlin.com>
        <20181217225044.GA25148@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217225044.GA25148@bogus> (Rob Herring's message of "Mon, 17
        Dec 2018 16:50:44 -0600")
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,
 
 On lun., déc. 17 2018, Rob Herring <robh@kernel.org> wrote:

> On Sun, Dec 16, 2018 at 10:41:42AM +0100, Gregory CLEMENT wrote:
>> Document the device tree binding for the cluster clock controllers found
>> in the Armada 7K/8K SoCs.
>> 
>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> ---
>>  .../arm/marvell/ap806-system-controller.txt   | 22 +++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
>> index 3fd21bb7cb37..8f281816a6b8 100644
>> --- a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
>> +++ b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
>> @@ -136,3 +136,25 @@ ap_syscon1: system-controller@6f8000 {
>>  		#thermal-sensor-cells = <1>;
>>  	};
>>  };
>> +
>> +Cluster clocks:
>> +---------------
>> +
>> +Device Tree Clock bindings for cluster clock of AP806 Marvell. Each
>> +cluster contain up to 2 CPUs running at the same frequency.
>> +
>> +Required properties:
>> +- compatible: must be  "marvell,ap806-cpu-clock";
>> +- #clock-cells : should be set to 1.
>> +- clocks : shall be the input parents clock phandle for the clock.
>> +
>> +ap_syscon1: system-controller@6f8000 {
>> +	compatible = "syscon", "simple-mfd";
>> +	reg = <0x6f8000 0x1000>;
>> +
>> +	cpu_clk: clock-cpu {
>
> There's not a register address range you can use even if Linux happens 
> to not need it (currently)?

We can add an optional reg property if you want, but the whole point of
this, is to be able to ensure the compatibility. Indeed, we have now
enough experience to know that the information we have from the
datasheet is incomplete. And when we start to deal with an IP calling
"system controller", then we can expect a mix between all the registers.

>
> There's already a clock node under this syscon? Are they really separate 
> sub-blocks?

Actually the other clock node (marvell,ap806-clock) is under the other
syscon: system controller 0 with gpio and pinctrl, whereas this one
(marvell,ap806-cpu-clock), is under system controller 1 with thermal.

Gregory

>
>> +		compatible = "marvell,ap806-cpu-clock";
>> +		clocks = <&ap_clk 0>, <&ap_clk 1>;
>> +		#clock-cells = <1>;
>> +	};
>> +};
>> -- 
>> 2.19.2
>> 

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
