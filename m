From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] gpio: Describe interrupt-controller binding
Date: Tue, 18 Sep 2012 08:55:40 -0600
Message-ID: <50588B6C.6080402@wwwdotorg.org>
References: <1347958274-19425-1-git-send-email-thierry.reding@avionic-design.de> <505876F0.6010809@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <505876F0.6010809@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Thierry Reding <thierry.reding@avionic-design.de>, devicetree-discuss@lists.ozlabs.org, Linus Walleij <linus.walleij@stericsson.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/18/2012 07:28 AM, Rob Herring wrote:
> On 09/18/2012 03:51 AM, Thierry Reding wrote:
>> In order to use GPIO controllers as interrupt controllers, they need to
>> be marked with the DT interrupt-controller property. This commit adds
>> some documentation about this to the general GPIO binding document.
>>
>> Cc: Linus Walleij <linus.walleij@stericsson.com>
>> Cc: Grant Likely <grant.likely@secretlab.ca>
>> Cc: Rob Herring <rob.herring@calxeda.com>
>> Cc: devicetree-discuss@lists.ozlabs.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Thierry Reding <thierry.reding@avionic-design.de>
> 
> Applied for 3.7.
> 
> Rob
> 
>> ---
>>  Documentation/devicetree/bindings/gpio/gpio.txt | 33 +++++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
>> index 4e16ba4..8d125b0 100644
>> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
>> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
>> @@ -75,4 +75,37 @@ Example of two SOC GPIO banks defined as gpio-controller nodes:
>>  		gpio-controller;
>>  	};
>>  
>> +If the GPIO controller supports the generation of interrupts, it should
>> +also contain an empty "interrupt-controller" property as well as an
>> +"#interrupt-cells" property. This is required in order for other nodes
>> +to use the GPIO controller as their interrupt parent.

Surely this is generic information for any interrupt controller, and
hence doesn't belong in the GPIO binding?

>> +If #interrupt-cells is 1, the single cell is used to specify the number
>> +of the GPIO that is to be used as an interrupt.
>> +
>> +If #interrupt-cells is 2, the first cell is used to specify the number
>> +of the GPIO that is to be used as an interrupt, whereas the second cell
>> +is used to specify any of the following flags:
>> +  - bits[3:0] trigger type and level flags
>> +      1 = low-to-high edge triggered
>> +      2 = high-to-low edge triggered
>> +      4 = active high level-sensitive
>> +      8 = active low level-sensitive

That certainly shouldn't be in the generic GPIO binding; the format of
the interrupt specifier is determined by the binding for the individual
device that is the interrupt controller. Just because a device is also a
GPIO controller doesn't mean that it has to conform to a specific format
for the interrupt specifier.
