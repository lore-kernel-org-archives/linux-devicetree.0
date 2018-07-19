Return-Path: <SRS0=Hazi=KD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr40128.outbound.protection.outlook.com ([40.107.4.128]:14057
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726338AbeGSJvo (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 19 Jul 2018 05:51:44 -0400
Subject: Re: [PATCH V2 2/2] Documentation: dt-bindings: add adi,adgs1408 doc
References: <20180717134416.5865-1-mircea.caprioru@analog.com>
 <e33b328f-8cd7-6bd5-bd01-9033e0b91cd3@axentia.se>
 <afe3957216c82e7d7514d52530e3ae87f987924f.camel@analog.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <95c37d42-6172-1c17-5843-8aaa919941d8@axentia.se>
Date: Thu, 19 Jul 2018 11:09:22 +0200
MIME-Version: 1.0
In-Reply-To: <afe3957216c82e7d7514d52530e3ae87f987924f.camel@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: "Caprioru, Mircea" <Mircea.Caprioru@analog.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>, "rdunlap@infradead.org" <rdunlap@infradead.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 2018-07-19 09:26, Caprioru, Mircea wrote:
> On Wed, 2018-07-18 at 15:09 +0200, Peter Rosin wrote:
>> On 2018-07-17 15:44, Mircea Caprioru wrote:
>>> Adding dt-bindings documentation for adgs1408/1409 multiplexer. The
>>> bindings follow the standard SPI and mux bindings and do not
>>> require any
>>> additional custom properties.
>>
>> However, both chips have general purpose output pins. I think it is
>> customary to document the bindings for such things while at it?
> 
> This functionality is not yet implemented in the driver. It does not
> make sense to document it just yet. Will add it when the driver
> implements it.

I disagree, and I also think 2/2 should come before 1/2, just to show
that things are done in the proper order. That makes it clear that the
driver does not implement random (or not yet existing) device-tree
bindings.

The bindings should not document the driver, they should document
the hardware/interfaces.

>>
>> Another thing that I'm wondering about is if it is at all possible
>> to describe daisy-chained devices on an spi bus in the device tree?
>>
> I'm not sure about this either. I will have to also look into this.

It was more of a general question for devicetree/spi experts, but I do
not expect any generic solutions in this problem space...

Cheers,
Peter

>>>
>>> Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
>>> ---
>>> Changelog V1 -> V2
>>> - removed wildcard adgs140x
>>> - removed removed required cells property
>>>
>>>  .../devicetree/bindings/mux/adi,adgs1408.txt  | 39
>>> +++++++++++++++++++
>>>  MAINTAINERS                                   |  1 +
>>>  2 files changed, 40 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/mux/adi,adgs1408.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/mux/adi,adgs1408.txt
>>> b/Documentation/devicetree/bindings/mux/adi,adgs1408.txt
>>> new file mode 100644
>>> index 000000000000..6b1cbe326786
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mux/adi,adgs1408.txt
>>> @@ -0,0 +1,39 @@
>>> +Bindings for Analog Devices ADGS1408/1409 8:1/Dual 4:1 Mux
>>> +
>>> +Required properties:
>>> +- compatible : "adi,adgs1408" or "adi,adgs1409"
>>
>> I think it is preferred to have one compatible per line.
> 
> Ack.
>>
>>> +* Standard mux-controller bindings as described in mux-
>>> controller.txt
>>> +
>>> +Optional properties:
>>> +- idle-state : if present, array of states that the mux
>>> controllers will have
>>> +  when idle. The special state MUX_IDLE_AS_IS is the default and
>>> +  MUX_IDLE_DISCONNECT is also supported.
>>> +
>>> +States 0 through 7 correspond to signals S1 through S8 in the
>>> datasheet.
>>> +For ADGS1409 only states 0 to 3 are available.
>>> +
>>> +Example:
>>> +
>>> +	/*
>>> +	 * One mux controller.
>>> +	 * Mux 1 to 8 set to idle as is (no idle-state declared)
>>
>> What do you mean "Mux 1 to 8"? There is only one mux...
> 
> I was reffering to the mux inputs, will rephrase this.
>>
>>> +	 */
>>> +	&spi0 {
>>> +		mux: mux-controller@2 {
>>> +			compatible = "adi,adgs1408";
>>> +			reg = <0>;
>>
>> reg = <0> does not match @2 above.
> 
> Ack.
>>
>>> +			spi-max-frequency = <1000000>;
>>> +			#mux-control-cells = <0>;
>>> +		};
>>> +	}
>>> +
>>> +	adc-mux@3 {
>>
>> There is no reg property in this node. I think you should simply
>> drop the @3.
> 
> Ack.
>>
>> Cheers,
>> Peter
> 
> Thanks,
> Mircea
>>
>>> +		compatible = "io-channel-mux";
>>> +		io-channels = <&adc 1>;
>>> +		io-channel-names = "parent";
>>> +		mux-controls = <&mux>;
>>> +
>>> +		channels = "out_a0", "out_a1", "test0", "test1",
>>> +			"out_b0", "out_b1", "testb0", "testb1";
>>> +
>>> +	};
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 458d42d6f4f3..af8ea2638641 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -814,6 +814,7 @@ ANALOG DEVICES INC ADGS1408 DRIVER
>>>  M:	Mircea Caprioru <mircea.caprioru@analog.com>
>>>  S:	Supported
>>>  F:	drivers/mux/adgs1408.c
>>> +F:	Documentation/devicetree/bindings/mux/adi,adgs1408.txt
>>>  
>>>  ANALOG DEVICES INC ADV7180 DRIVER
>>>  M:	Lars-Peter Clausen <lars@metafoo.de>
>>>
>>

