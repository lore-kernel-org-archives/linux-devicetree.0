From: Keerthy <j-keerthy@ti.com>
Subject: Re: [RESEND PATCH 01/10] dt-bindings: crypto: k3: Add sa2ul bindings
 documentation
Date: Tue, 23 Jul 2019 09:41:11 +0530
Message-ID: <b8712fe4-4590-fdda-8a24-bf0f135ad567@ti.com>
References: <20190628042745.28455-1-j-keerthy@ti.com>
 <20190628042745.28455-2-j-keerthy@ti.com> <20190722182945.GA24685@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722182945.GA24685@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, t-kristo@ti.com, linux-crypto@vger.kernel.org, nm@ti.com
List-Id: devicetree@vger.kernel.org



On 22/07/19 11:59 PM, Rob Herring wrote:
> On Fri, Jun 28, 2019 at 09:57:36AM +0530, Keerthy wrote:
>> The series adds Crypto hardware accelerator support for SA2UL.
>> SA2UL stands for security accelerator ultra lite.
>>
>> The Security Accelerator (SA2_UL) subsystem provides hardware
>> cryptographic acceleration for the following use cases:
>> • Encryption and authentication for secure boot
>> • Encryption and authentication of content in applications
>>    requiring DRM (digital rights management) and
>>    content/asset protection
>> The device includes one instantiation of SA2_UL named SA2_UL0
>>
>> SA2UL needs on tx channel and a pair of rx dma channels.
>>
>> Signed-off-by: Keerthy <j-keerthy@ti.com>
>> ---
>>   .../devicetree/bindings/crypto/sa2ul.txt      | 47 +++++++++++++++++++
>>   1 file changed, 47 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/crypto/sa2ul.txt
>>
>> diff --git a/Documentation/devicetree/bindings/crypto/sa2ul.txt b/Documentation/devicetree/bindings/crypto/sa2ul.txt
>> new file mode 100644
>> index 000000000000..81cc039673b4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/crypto/sa2ul.txt
>> @@ -0,0 +1,47 @@
>> +K3 SoC SA2UL crypto module
>> +
>> +Required properties:
>> +
>> +- compatible : Should be:
>> +  - "ti,sa2ul-crypto"
> 
> Needs to be SoC specific.

okay

> 
>> +- reg : Offset and length of the register set for the module
>> +
>> +- dmas: DMA specifiers for tx and rx dma. sa2ul needs one tx channel
>> +	and 2 rx channels. First rx channel for < 256 bytes and
>> +	the other one for >=256 bytes. See the DMA client binding,
>> +        Documentation/devicetree/bindings/dma/dma.txt
>> +- dma-names: DMA request names has to have one tx and 2 rx names
>> +	corresponding to dmas abive.
>> +- ti,psil-config* - UDMA PSIL native Peripheral using packet mode.
>> +	SA2UL must have EPIB(Extended protocal information block)
>> +	and PSDATA(protocol specific data) properties.
> 
> If ti,needs-epib is required, then why do you need to specify it in DT?
> In any case, this all seems like channel config info that should be part
> of the #dma-cells.

ti,needs-epib is the udma client(Here sa2ul) conveying the udma layer.
Not every udma client needs epib.

Peter,

Any thoughts on the above?

- Keerthy

> 
> Also, don't use vendor prefixes on node names.

Okay

> 
>> +
>> +Example AM654 SA2UL:
>> +crypto: crypto@4E00000 {
>> +	compatible = "ti,sa2ul-crypto";
>> +	reg = <0x0 0x4E00000 0x0 0x1200>;
>> +	ti,psil-base = <0x4000>;
>> +
>> +	dmas = <&main_udmap &crypto 0 UDMA_DIR_TX>,
>> +		<&main_udmap &crypto 0 UDMA_DIR_RX>,
>> +		<&main_udmap &crypto 1 UDMA_DIR_RX>;
>> +	dma-names = "tx", "rx1", "rx2";
>> +
>> +	ti,psil-config0 {
>> +		linux,udma-mode = <UDMA_PKT_MODE>;
>> +		ti,needs-epib;
>> +		ti,psd-size = <64>;
>> +	};
>> +
>> +	ti,psil-config1 {
>> +		linux,udma-mode = <UDMA_PKT_MODE>;
>> +		ti,needs-epib;
>> +		ti,psd-size = <64>;
>> +	};
>> +
>> +	ti,psil-config2 {
>> +		linux,udma-mode = <UDMA_PKT_MODE>;
>> +		ti,needs-epib;
>> +		ti,psd-size = <64>;
>> +	};
>> +};
>> -- 
>> 2.17.1
>>
