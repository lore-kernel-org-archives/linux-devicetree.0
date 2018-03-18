From: Matheus Castello <matheus@castello.eng.br>
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: bcm2835-gpio: Add generic
 pinctrl support
Date: Sun, 18 Mar 2018 11:23:49 -0400
Message-ID: <f500b25c-eea0-9f01-7d7b-5a9dd90c50fa@castello.eng.br>
References: <483687035.384686.1520596004410@email.1und1.de>
 <1520615640-9153-1-git-send-email-matheus@castello.eng.br>
 <1520615640-9153-2-git-send-email-matheus@castello.eng.br>
 <20180318124820.xea5etlb3wu7wnpw@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180318124820.xea5etlb3wu7wnpw@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: stefan.wahren@i2se.com, eric@anholt.net, linus.walleij@linaro.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

sorry I used allwinner,sunxi-pinctrl.txt from Maxime Ripard as a base, I 
used the same words, I thought it would be correct.

I will modify this to:

The BCM2835 pin configuration and multiplexing supports the generic 
bindings. For details on each properties, you can refer to
./pinctrl-bindings.txt.

If it's okay for you let me know, so I can send the v5 patch.

Best Regards
Matheus Castello


On 03/18/2018 08:48 AM, Rob Herring wrote:
> On Fri, Mar 09, 2018 at 01:13:58PM -0400, Matheus Castello wrote:
>> Added generic pin configuration and multiplexing support,
>> and shoud be preferred than brcm legacy one.
>>
>> Signed-off-by: Matheus Castello <matheus@castello.eng.br>
>> ---
>>   .../devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
>> index 2569866..58b4720 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2835-gpio.txt
>> @@ -36,6 +36,25 @@ listed. In other words, a subnode that lists only a mux function implies no
>>   information about any pull configuration. Similarly, a subnode that lists only
>>   a pul parameter implies no information about the mux function.
>>   
>> +This driver supports the generic pin multiplexing and configuration
> 
> Bindings describe h/w, not drivers.
> 
>> +bindings. For details on each properties, you can refer to
>> +./pinctrl-bindings.txt.
>> +
>> +Required sub-node properties:
>> +  - pins
>> +  - function
>> +
>> +Optional sub-node properties:
>> +  - bias-disable
>> +  - bias-pull-up
>> +  - bias-pull-down
>> +  - output-high
>> +  - output-low
>> +
>> +Legacy pin configuration and multiplexing binding:
>> +*** (Its use is deprecated, use generic multiplexing and configuration
>> +bindings instead)
>> +
>>   Required subnode-properties:
>>   - brcm,pins: An array of cells. Each cell contains the ID of a pin. Valid IDs
>>     are the integer GPIO IDs; 0==GPIO0, 1==GPIO1, ... 53==GPIO53.
>> -- 
>> 2.7.4
>>
