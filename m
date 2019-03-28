From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: ap806: add the cluster clock node in the syscon file
Date: Thu, 28 Mar 2019 18:25:14 +0100
Message-ID: <87k1gioqrp.fsf@FE-laptop>
References: <20190325124803.28904-1-gregory.clement@bootlin.com> <20190325124803.28904-2-gregory.clement@bootlin.com> <20190328171350.GA26680@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328171350.GA26680@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,
 
 On jeu., mars 28 2019, Rob Herring <robh@kernel.org> wrote:

> On Mon, Mar 25, 2019 at 01:47:58PM +0100, Gregory CLEMENT wrote:
>> Document the device tree binding for the cluster clock controllers found
>> in the Armada 7K/8K SoCs.
>> 
>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> ---
>>  .../arm/marvell/ap806-system-controller.txt   | 25 +++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
>> index 7b8b8eb0191f..ceeba18b4ac3 100644
>> --- a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
>> +++ b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
>> @@ -143,3 +143,28 @@ ap_syscon1: system-controller@6f8000 {
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
>> +Optional property:
>> + - reg: register range associated the cluser clocks
>
> reg can be optional to use, but should either be there or not.

OK so let's remove it!

Thanks,

Grégory

>
> And there's a typo.
>
>> +
>> +ap_syscon1: system-controller@6f8000 {
>> +	compatible = "syscon", "simple-mfd";
>> +	reg = <0x6f8000 0x1000>;
>> +
>> +	cpu_clk: clock-cpu {
>> +		compatible = "marvell,ap806-cpu-clock";
>> +		clocks = <&ap_clk 0>, <&ap_clk 1>;
>> +		#clock-cells = <1>;
>> +	};
>> +};
>> -- 
>> 2.20.1
>> 

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
