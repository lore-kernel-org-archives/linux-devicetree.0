From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 1/3] arm64: dts: ti: am654: Add Main System Control Module
 node
Date: Wed, 16 Jan 2019 12:52:20 +0200
Message-ID: <5C3F0CE4.9010504@ti.com>
References: <1547200861-17795-1-git-send-email-rogerq@ti.com>
 <1547200861-17795-2-git-send-email-rogerq@ti.com>
 <20190115143355.immsdfkyulx5j6o7@kahuna>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190115143355.immsdfkyulx5j6o7@kahuna>
Sender: linux-kernel-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Cc: t-kristo@ti.com, nsekhar@ti.com, vigneshr@ti.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jyri Sarha <jsarha@ti.com>
List-Id: devicetree@vger.kernel.org

On 15/01/19 16:33, Nishanth Menon wrote:
> On 12:00-20190111, Roger Quadros wrote:
>> From: Jyri Sarha <jsarha@ti.com>
>>
>> Main System control module support is added to the device tree to allow
>> driver to access to their control module registers.
>>
>> Signed-off-by: Jyri Sarha <jsarha@ti.com>
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> ---
>>  arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
>> index 272cf8f..8b55108 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
>> @@ -191,4 +191,12 @@
>>  		#address-cells = <1>;
>>  		#size-cells = <0>;
>>  	};
>> +
>> +	scm_conf: scm_conf@100000 {
>> +		compatible = "syscon", "simple-mfd";
>> +		reg = <0 0x00100000 0 0x1c000>;
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges = <0x0 0x0 0x00100000 0x1c000>;
> 
> Who handles the MMR region unlock?

u-boot.

> 
>> +	};
>>  };
>> -- 
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>>
> 

cheers,
-roger

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
