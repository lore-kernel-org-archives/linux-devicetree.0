Return-Path: <SRS0=HrxS=KF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr70121.outbound.protection.outlook.com ([40.107.7.121]:54656
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727304AbeGUKMa (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 21 Jul 2018 06:12:30 -0400
Subject: Re: [PATCH 2/2] Documentation: dt-bindings: add adi,adgs140x doc
References: <20180713123035.6191-1-mircea.caprioru@analog.com>
 <20180720152815.GA8645@rob-hp-laptop>
From: Peter Rosin <peda@axentia.se>
Message-ID: <bbf37fb4-3898-7293-eafd-b4969517333a@axentia.se>
Date: Sat, 21 Jul 2018 11:20:14 +0200
MIME-Version: 1.0
In-Reply-To: <20180720152815.GA8645@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Mircea Caprioru <mircea.caprioru@analog.com>
Cc: davem@davemloft.net, mchehab+samsung@kernel.org, akpm@linux-foundation.org, rdunlap@infradead.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 2018-07-20 17:28, Rob Herring wrote:
> On Fri, Jul 13, 2018 at 03:30:35PM +0300, Mircea Caprioru wrote:
>> Adding dt-bindings documentation for adgs1408/1409 multiplexer. The
>> bindings follow the standard SPI and mux bindings and do not require any
>> additional custom properties.
> 
> Drop "Documentation: " from the subject.

Hi Rob,

All the issues reported here (and some more) have been addressed in
subsequent submissions. Please look at v5: 

https://www.spinics.net/lists/devicetree/msg240309.html

Cheers,
Peter

>> Signed-off-by: Mircea Caprioru <mircea.caprioru@analog.com>
>> ---
>>  .../devicetree/bindings/mux/adi,adgs140x.txt  | 39 +++++++++++++++++++
>>  MAINTAINERS                                   |  1 +
>>  2 files changed, 40 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mux/adi,adgs140x.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mux/adi,adgs140x.txt b/Documentation/devicetree/bindings/mux/adi,adgs140x.txt
>> new file mode 100644
>> index 000000000000..5f2c2b9e9781
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mux/adi,adgs140x.txt
>> @@ -0,0 +1,39 @@
>> +Bindings for Analog Devices ADGS1408/1409 8:1/Dual 4:1 Mux
>> +
>> +Required properties:
>> +- compatible : "adi,adgs1408" or "adi,adgs1409"
>> +- #mux-control-cells : <0>
>> +* Standard mux-controller bindings as described in mux-controller.txt
> 
> What would these be because the only one you have in the example is 
> already listed here.
> 
>> +
>> +Optional properties:
>> +- idle-state : if present, array of states that the mux controllers will have
>> +  when idle. The special state MUX_IDLE_AS_IS is the default and
>> +  MUX_IDLE_DISCONNECT is also supported.
>> +
>> +States 0 through 7 correspond to signals S1 through S8 in the datasheet.
>> +
>> +Example:
>> +
>> +	/*
>> +	 * One mux controller.
>> +	 * Mux 1 to 8 set to idle as is (no idle-state declared)
>> +	 */
>> +	&spi0 {
>> +		mux: mux-controller@2 {
> 
> unit address should be 0.
> 
>> +			compatible = "adi,adgs1408";
>> +			reg = <0>;
>> +			spi-max-frequency = <1000000>;
>> +			#mux-control-cells = <0>;
>> +		};
>> +	}
>> +
>> +	adc-mux@3 {
>> +		compatible = "io-channel-mux";
>> +		io-channels = <&adc 1>;
>> +		io-channel-names = "parent";
>> +		mux-controls = <&mux>;
>> +
>> +		channels = "out_a0", "out_a1", "test0", "test1",
>> +			"out_b0", "out_b1", "testb0", "testb1";
>> +
>> +	};
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7aa68f38ea4b..6e69c3e2d27a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -816,6 +816,7 @@ W:	http://wiki.analog.com/
>>  W:	http://ez.analog.com/community/linux-device-drivers
>>  S:	Supported
>>  F:	drivers/mux/adgs140x.c
>> +F:	Documentation/devicetree/bindings/mux/adgs140x.txt
>>  
>>  ANALOG DEVICES INC ADV7180 DRIVER
>>  M:	Lars-Peter Clausen <lars@metafoo.de>
>> -- 
>> 2.17.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html

