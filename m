Return-Path: <SRS0=ECyj=W2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from anchovy3.45ru.net.au ([203.30.46.155]:56247 "EHLO
        anchovy3.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727110AbfH3BBa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 29 Aug 2019 21:01:30 -0400
Subject: Re: [PATCH 1/2] dt-binding: iio: Add optional label property
References: <1566876924-63608-1-git-send-email-preid@electromag.com.au>
 <1566876924-63608-2-git-send-email-preid@electromag.com.au>
 <a30b6dca-c598-135a-0559-1018dd5f5fde@xilinx.com>
 <20190829230207.GA22979@bogus>
From: Phil Reid <preid@electromag.com.au>
Message-ID: <b50bce2d-8819-67b1-c55c-8c2b8070a4ac@electromag.com.au>
Date: Fri, 30 Aug 2019 09:01:15 +0800
MIME-Version: 1.0
In-Reply-To: <20190829230207.GA22979@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Michal Simek <michal.simek@xilinx.com>
Cc: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, mark.rutland@arm.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 30/08/2019 07:02, Rob Herring wrote:
> On Wed, Aug 28, 2019 at 08:09:19AM +0200, Michal Simek wrote:
>> On 27. 08. 19 5:35, Phil Reid wrote:
>>> This optional property defines a symbolic name for the device.
>>>
>>> Signed-off-by: Phil Reid <preid@electromag.com.au>
>>> ---
>>>   Documentation/devicetree/bindings/iio/iio-bindings.txt | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/iio/iio-bindings.txt b/Documentation/devicetree/bindings/iio/iio-bindings.txt
>>> index 68d6f8ce063b..ffeae5aad8b5 100644
>>> --- a/Documentation/devicetree/bindings/iio/iio-bindings.txt
>>> +++ b/Documentation/devicetree/bindings/iio/iio-bindings.txt
>>> @@ -18,12 +18,17 @@ Required properties:
>>>   		   with a single IIO output and 1 for nodes with multiple
>>>   		   IIO outputs.
>>>   
>>> +Optional properties:
>>> +label:		   A symbolic name for the device.
>>> +
>>> +
>>>   Example for a simple configuration with no trigger:
>>>   
>>>   	adc: voltage-sensor@35 {
>>>   		compatible = "maxim,max1139";
>>>   		reg = <0x35>;
>>>   		#io-channel-cells = <1>;
>>> +		label = "adc_voltage_sensor";
>>>   	};
>>>   
>>>   Example for a configuration with trigger:
>>>
>>
>> Just for the record. This patch has been created based on initial
>> discussion about label property. And Rob had not problem with using
>> label in connection to ina226. https://lkml.org/lkml/2019/8/27/1213
> 
> I didn't, but based on the name here I'm less convinced. 'label' is
> supposed to be for needing to distinguish between more than 1 of
> something. A name like 'adc_voltage_sensor' doesn't really.
> 
> Rob
> 
> 

That's the problem we're try to solve. Having multiple devices and try to
determine which device is which.
eg: Mutliple adc's.
For example I have the same dac chip on multiple boards that do different
things, it's difficult to id them.

so label examples could be:
label = "current_control_group1";
label = "voltage_control_group1";

Are you totally against this or is it a problem with me not being clear
with the problem and the wording of the commit message or the example?




-- 
Regards
Phil Reid
