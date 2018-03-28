Return-Path: <SRS0=PuNI=GS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from smtp.220.in.ua ([89.184.67.205]:60123 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750703AbeC1Gfj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 28 Mar 2018 02:35:39 -0400
Subject: Re: [PATCH 1/2] dt-bindings: Add vendor prefix and docs for CR0014114
References: <20180326121506.9528-1-oleg@kaa.org.ua>
 <20180327164903.6307-1-oleg@kaa.org.ua>
 <66fb58b2-2ae7-8edf-6c48-0f78f82c31a2@gmail.com>
From: Oleh Kravchenko <oleg@kaa.org.ua>
Message-ID: <005611b1-b821-93d2-4bb5-c3f12b4fc937@kaa.org.ua>
Date: Wed, 28 Mar 2018 09:36:56 +0300
MIME-Version: 1.0
In-Reply-To: <66fb58b2-2ae7-8edf-6c48-0f78f82c31a2@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hello Jacek,

On 27.03.18 23:58, Jacek Anaszewski wrote:
>> +Example
>> +-------
>> +
>> +led-controller@0 {
>> +	compatible = "crane,cr0014114";
>> +	reg = <0>;
>> +	spi-max-frequency = <50000>;
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	led@0 {
>> +		reg = <0>;
>> +		label = "cr0:red:coin";
>> +	};
>> +	led@1 {
>> +		reg = <1>;
>> +		label = "cr0:green:coin";
>> +	};
>> +	led@2 {
>> +		reg = <2>;
>> +		label = "cr0:blue:coin";
>> +	};
>> +	led@3 {
>> +		reg = <3>;
>> +		label = "cr1:red:bill";
>> +	};
>> +	led@4 {
>> +		reg = <4>;
>> +		label = "cr1:green:bill";
>> +	};
>> +	led@5 {
>> +		reg = <5>;
>> +		label = "cr1:blue:bill";
>> +	};
> 
> Why cr0 and cr1? It should be cr0014114 to stick to the
> current LED naming pattern <devicename:colour:function>.
> 
> Nonetheless, we lately came to the conclusion that devicename
> segment is redundant in LED class device name, so until we change
> LED naming convention officially, let's remove devicename segment
> at least from DT and prepend the label with "cr0014114" in the driver.
> 
> Please compare how it is approached in [0] (not merged yet).
> 

It's just example.
But anyway our applications works with LEDs by numbers.

Using function names instead numbers will increase code complexity,
so we use numbers :)

>> +};
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> index ae850d6c0ad3..f17949c365f5 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> @@ -75,6 +75,7 @@ cnxt	Conexant Systems, Inc.
>>  compulab	CompuLab Ltd.
>>  cortina	Cortina Systems, Inc.
>>  cosmic	Cosmic Circuits
>> +crane	Crane Connectivity Solutions
>>  creative	Creative Technology Ltd
>>  crystalfontz	Crystalfontz America, Inc.
>>  cubietech	Cubietech, Ltd.
>>
> 
> [0] https://www.spinics.net/lists/devicetree/msg220561.html
> 

-- 
Best regards,
Oleh Kravchenko

