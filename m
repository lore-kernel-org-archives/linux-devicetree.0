From: Abhishek Sahu <absahu@codeaurora.org>
Subject: Re: [PATCH v2 12/25] dt-bindings: qcom_nandc: QPIC NAND documentation
Date: Thu, 20 Jul 2017 11:03:39 +0530
Message-ID: <6c962cb0c1a34d7c220b55f42cda2c78@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-13-git-send-email-absahu@codeaurora.org>
 <20170719213904.60d9b681@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170719213904.60d9b681@bbrezillon>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, architt@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, andy.gross@linaro.org, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 2017-07-20 01:09, Boris Brezillon wrote:
> On Wed, 19 Jul 2017 17:18:00 +0530
> Abhishek Sahu <absahu@codeaurora.org> wrote:
> 
>> 1. QPIC NAND will use compatible string "qcom,qpic-nandc-v1.4.0"
>> 2. QPIC NAND will 3 BAM channels: command, data tx and data rx
>>    while EBI2 NAND uses only single ADM channel.
>> 3. CRCI is only required for ADM DMA and its not required for
>>    QPIC NAND.
>> 
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>> ---
>>  .../devicetree/bindings/mtd/qcom_nandc.txt         | 54 
>> ++++++++++++++++++++--
>>  1 file changed, 51 insertions(+), 3 deletions(-)
>> 
>> diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt 
>> b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
>> index b24adfe..8efaeb0 100644
>> --- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
>> +++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
>> @@ -1,13 +1,15 @@
>>  * Qualcomm NAND controller
>> 
>>  Required properties:
>> -- compatible:		should be "qcom,ebi2-nandc" - EBI2 NAND which uses ADM
>> -			DMA like IPQ8064.
>> -
>> +- compatible:		must be one of the following:
>> +	* "qcom,ebi2-nandc" - EBI2 NAND which uses ADM DMA like IPQ8064.
>> +	* "qcom,qpic-nandc-v1.4.0" - QPIC NAND v1.4.0 which uses BAM DMA 
>> like IPQ4019.
>>  - reg:			MMIO address range
>>  - clocks:		must contain core clock and always on clock
>>  - clock-names:		must contain "core" for the core clock and "aon" for 
>> the
>>  			always on clock
>> +
>> +EBI2 specific properties:
>>  - dmas:			DMA specifier, consisting of a phandle to the ADM DMA
>>  			controller node and the channel number to be used for
>>  			NAND. Refer to dma.txt and qcom_adm.txt for more details
>> @@ -18,6 +20,12 @@ Required properties:
>>  - qcom,data-crci:	must contain the ADM data type CRCI block instance
>>  			number specified for the NAND controller on the given
>>  			platform
>> +
>> +QPIC specific properties:
>> +- dmas:			DMA specifier, consisting of a phandle to the BAM DMA
>> +			and the channel number to be used for NAND. Refer to
>> +			dma.txt, qcom_bam_dma.txt for more details
>> +- dma-names:		must contain all 3 channel names : "tx", "rx", "cmd"
>>  - #address-cells:	<1> - subnodes give the chip-select number
>>  - #size-cells:		<0>
>> 
>> @@ -84,3 +92,43 @@ nand@1ac00000 {
>>  		};
>>  	};
>>  };
>> +
>> +nand@79b0000 {
> 
> I think I already mentioned I'd prefer to have
> 
> nand-controller@xxxx {
> 

  Sorry. I Missed that part. I will change it in v3.

>> +	compatible = "qcom,qpic-nandc-v1.4.0";
>> +	reg = <0x79b0000 0x1000>;
>> +
>> +	clocks = <&gcc GCC_QPIC_CLK>,
>> +		<&gcc GCC_QPIC_AHB_CLK>;
>> +	clock-names = "core", "aon";
>> +
>> +	dmas = <&qpicbam 0>,
>> +		<&qpicbam 1>,
>> +		<&qpicbam 2>;
>> +	dma-names = "tx", "rx", "cmd";
>> +
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	nandcs@0 {
> 
> and
> 	nand@x {
> 
> here.
> 

  Will change this also.

>> +		reg = <0>;
>> +		nand-ecc-strength = <4>;
>> +		nand-ecc-step-size = <512>;
>> +		nand-bus-width = <8>;
>> +
>> +		partitions {
>> +			compatible = "fixed-partitions";
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +
>> +			partition@0 {
>> +				label = "boot-nand";
>> +				reg = <0 0x58a0000>;
>> +			};
>> +
>> +			partition@58a0000 {
>> +				label = "fs-nand";
>> +				reg = <0x58a0000 0x4000000>;
>> +			};
>> +		};
>> +	};
>> +};

-- 
Abhishek Sahu
