From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v4 4/5] dt-bindings: mtd: Add bindings for TI's AM654
 HyperBus memory controller
Date: Sat, 27 Apr 2019 08:31:42 +0530
Message-ID: <0972151d-5911-5a6e-da36-8fa8e1761e30@ti.com>
References: <20190423104814.5762-1-vigneshr@ti.com>
 <20190423104814.5762-5-vigneshr@ti.com> <20190426202025.GA24486@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190426202025.GA24486@bogus>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, nsekhar@ti.com, linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
List-Id: devicetree@vger.kernel.org



On 27/04/19 1:50 AM, Rob Herring wrote:
> On Tue, Apr 23, 2019 at 04:18:13PM +0530, Vignesh Raghavendra wrote:
>> Add binding documentation for TI's HyperBus memory controller present on
>> AM654 SoC.
>>
>> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
>> ---
>>  .../devicetree/bindings/mtd/ti,am654-hbmc.txt | 32 +++++++++++++++++++
>>  MAINTAINERS                                   |  1 +
>>  2 files changed, 33 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
>> new file mode 100644
>> index 000000000000..fc87c7918389
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
>> @@ -0,0 +1,32 @@
>> +Bindings for HyperBus Memory Controller (HBMC) on TI's K3 family of SoCs
>> +
>> +Required properties:
>> +- compatible : "ti,am654-hbmc" for AM654 SoC
>> +- reg : Two entries:
>> +	First entry pointed to the register space of HBMC controller
>> +	Second entry pointing to the memory map region dedicated for
>> +	MMIO access to attached flash devices
>> +- ranges : Address range allocated for each chipselect in the MMIO space
>> +
>> +Optional properties:
>> +- mux-controls : phandle to the multiplexer that controls selection of
>> +		 HBMC vs OSPI. Mux state of 1 indicates HBMC is selected.
> 
> So 1 is also the default because your example doesn't have the property?
> 

No default is 0. Will fix the example.

>> +
>> +Example:
>> +
>> +	hbmc: hbmc@47034000 {
>> +		compatible = "ti,am654-hbmc";
>> +		reg = <0x0 0x47034000 0x0 0x100>,
>> +			<0x5 0x00000000 0x1 0x0000000>;
>> +		power-domains = <&k3_pds 55>;
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges = <0x0 0x5 0x00000000 0x4000000>, /* CS0 - 64MB */
>> +			 <0x1 0x5 0x04000000 0x4000000>; /* CS1 - 64MB
> 
> This is wrong. You need 2 cells for the child address. The first cell is 
> the CS and the 2nd cell is the offset (typically 0). Otherwise you have 
> overlapping addresses with child addresses 0 and 1.
> 

Oops, didn't think of that. Will fix in the next version.

>> +
>> +		/* Slave flash node */
>> +		flash@0 {
> 
> And then the unit-address here would be '0,0'.
> 
>> +			compatible = "cypress,hyperflash";
> 
> Doesn't match what you defined for this binding.

Will update. Thanks for the review!

> 
>> +			reg = <0x0 0x4000000>;
>> +		};
>> +	};
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index a5f22f85c848..1ade81f9a32a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7258,6 +7258,7 @@ S:	Supported
>>  F:	drivers/mtd/hyperbus/
>>  F:	include/linux/mtd/hyperbus.h
>>  F:	Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt
>> +F:	Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
>>  
>>  HYPERVISOR VIRTUAL CONSOLE DRIVER
>>  L:	linuxppc-dev@lists.ozlabs.org
>> -- 
>> 2.21.0
>>

-- 
Regards
Vignesh
