From: Thor Thayer <thor.thayer@linux.intel.com>
Subject: Re: [PATCHv2 2/5] Documentation: dt: edac: Add Stratix10 Peripheral
 bindings
Date: Tue, 12 Mar 2019 14:30:20 -0500
Message-ID: <8b671f75-8488-1e06-a020-5f7d95166918@linux.intel.com>
References: <1551288445-22335-1-git-send-email-thor.thayer@linux.intel.com>
 <1551288445-22335-3-git-send-email-thor.thayer@linux.intel.com>
 <20190312160445.GA8802@bogus>
Reply-To: thor.thayer@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190312160445.GA8802@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: bp@alien8.de, dinguyen@kernel.org, mark.rutland@arm.com, mchehab@kernel.org, devicetree@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 3/12/19 11:04 AM, Rob Herring wrote:
> On Wed, Feb 27, 2019 at 11:27:22AM -0600, thor.thayer@linux.intel.com wrote:
>> From: Thor Thayer <thor.thayer@linux.intel.com>
>>
>> Add peripheral bindings for Stratix10 EDAC to capture
>> the differences between the ARM64 and ARM32 architecture.
> 
> What's the difference? Sounds like 2 different chips, so Stratix10 or
> s10 is not specific enough perhaps.
> 

Yes, our ARM32 chips are the Cyclone5 and Arria10. The Stratix10 is 
ARM64 and I'm using S10 as shorthand for the Stratix10.

The ECC blocks are very similar between Arria10 and Stratix10 but there 
are differences as a result of the ARM32 vs ARM64 architecture 
differences. The major difference is how Double Bit Errors are handled. 
In the ARM32, the DBE is mapped to an IRQ. On ARM64, the DBE is mapped 
to a SError.

I had started out re-using the Arria10 bindings for Stratix10 since they 
were very similar. Dinh pointed out that having separate bindings for 
ARM64 would allow separation between the architectures and make future 
changes easier.

I'm unclear on the comment about being specific enough. Are you 
suggesting that I use arm64 in the binding name instead of s10? Or is 
there a better naming convention I should follow?

Thanks for your comments and for reviewing!

Thor
>>
>> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
>> ---
>> v2 No change
>> ---
>>   .../devicetree/bindings/edac/socfpga-eccmgr.txt    | 106 +++++++++++++++++++++
>>   1 file changed, 106 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt b/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
>> index a0ac50e15912..a0fa80c53d2a 100644
>> --- a/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
>> +++ b/Documentation/devicetree/bindings/edac/socfpga-eccmgr.txt
>> @@ -258,6 +258,49 @@ Required Properties:
>>   - compatible : Should be "altr,sdram-edac-s10"
>>   - interrupts : Should be single bit error interrupt.
>>   
>> +On-Chip RAM ECC
>> +Required Properties:
>> +- compatible      : Should be "altr,socfpga-s10-ocram-ecc"
>> +- reg             : Address and size for ECC block registers.
>> +- altr,ecc-parent : phandle to parent OCRAM node.
>> +- interrupts      : Should be single bit error interrupt.
>> +
>> +Ethernet FIFO ECC
>> +Required Properties:
>> +- compatible      : Should be "altr,socfpga-s10-eth-mac-ecc"
>> +- reg             : Address and size for ECC block registers.
>> +- altr,ecc-parent : phandle to parent Ethernet node.
>> +- interrupts      : Should be single bit error interrupt.
>> +
>> +NAND FIFO ECC
>> +Required Properties:
>> +- compatible      : Should be "altr,socfpga-s10-nand-ecc"
>> +- reg             : Address and size for ECC block registers.
>> +- altr,ecc-parent : phandle to parent NAND node.
>> +- interrupts      : Should be single bit error interrupt.
>> +
>> +DMA FIFO ECC
>> +Required Properties:
>> +- compatible      : Should be "altr,socfpga-s10-dma-ecc"
>> +- reg             : Address and size for ECC block registers.
>> +- altr,ecc-parent : phandle to parent DMA node.
>> +- interrupts      : Should be single bit error interrupt.
>> +
>> +USB FIFO ECC
>> +Required Properties:
>> +- compatible      : Should be "altr,socfpga-s10-usb-ecc"
>> +- reg             : Address and size for ECC block registers.
>> +- altr,ecc-parent : phandle to parent USB node.
>> +- interrupts      : Should be single bit error interrupt.
>> +
>> +SDMMC FIFO ECC
>> +Required Properties:
>> +- compatible      : Should be "altr,socfpga-s10-sdmmc-ecc"
>> +- reg             : Address and size for ECC block registers.
>> +- altr,ecc-parent : phandle to parent SD/MMC node.
>> +- interrupts      : Should be single bit error interrupt for port A
>> +		    and then single bit error interrupt for port B.
>> +
>>   Example:
>>   
>>   	eccmgr {
>> @@ -274,4 +317,67 @@ Example:
>>   			compatible = "altr,sdram-edac-s10";
>>   			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
>>   		};
>> +
>> +		ocram-ecc@ff8cc000 {
>> +			compatible = "altr,socfpga-s10-ocram-ecc";
>> +			reg = <ff8cc000 0x100>;
>> +			altr,ecc-parent = <&ocram>;
>> +			interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
>> +		};
>> +
>> +		emac0-rx-ecc@ff8c0000 {
>> +			compatible = "altr,socfpga-s10-eth-mac-ecc";
>> +			reg = <0xff8c0000 0x100>;
>> +			altr,ecc-parent = <&gmac0>;
>> +			interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
>> +		};
>> +
>> +		emac0-tx-ecc@ff8c0400 {
>> +			compatible = "altr,socfpga-s10-eth-mac-ecc";
>> +			reg = <0xff8c0400 0x100>;
>> +			altr,ecc-parent = <&gmac0>;
>> +			interrupts = <5 IRQ_TYPE_LEVEL_HIGH>'
>> +		};
>> +
>> +		nand-buf-ecc@ff8c8000 {
>> +			compatible = "altr,socfpga-s10-nand-ecc";
>> +			reg = <0xff8c8000 0x100>;
>> +			altr,ecc-parent = <&nand>;
>> +			interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
>> +		};
>> +
>> +		nand-rd-ecc@ff8c8400 {
>> +			compatible = "altr,socfpga-s10-nand-ecc";
>> +			reg = <0xff8c8400 0x100>;
>> +			altr,ecc-parent = <&nand>;
>> +			interrupts = <13 IRQ_TYPE_LEVEL_HIGH>;
>> +		};
>> +
>> +		nand-wr-ecc@ff8c8800 {
>> +			compatible = "altr,socfpga-s10-nand-ecc";
>> +			reg = <0xff8c8800 0x100>;
>> +			altr,ecc-parent = <&nand>;
>> +			interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
>> +		};
>> +
>> +		dma-ecc@ff8c9000 {
>> +			compatible = "altr,socfpga-s10-dma-ecc";
>> +			reg = <0xff8c9000 0x100>;
>> +			altr,ecc-parent = <&pdma>;
>> +			interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +		usb0-ecc@ff8c4000 {
>> +			compatible = "altr,socfpga-s10-usb-ecc";
>> +			reg = <0xff8c4000 0x100>;
>> +			altr,ecc-parent = <&usb0>;
>> +			interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
>> +		};
>> +
>> +		sdmmc-ecc@ff8c8c00 {
>> +			compatible = "altr,socfpga-s10-sdmmc-ecc";
>> +			reg = <0xff8c8c00 0x100>;
>> +			altr,ecc-parent = <&mmc>;
>> +			interrupts = <14 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <15 IRQ_TYPE_LEVEL_HIGH>;
>> +		};
>>   	};
>> -- 
>> 2.7.4
>>
> 
