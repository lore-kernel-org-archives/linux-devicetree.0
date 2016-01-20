From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Subject: Re: [PATCHv3 2/2] gpio: sn65hvs885: Add DT binding documentation
Date: Wed, 20 Jan 2016 13:45:33 +0100
Message-ID: <569F816D.1000309@prevas.dk>
References: <1453198940-31410-1-git-send-email-sean.nyekjaer@prevas.dk>
 <1453198940-31410-2-git-send-email-sean.nyekjaer@prevas.dk>
 <20160119172040.GA8857@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160119172040.GA8857@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi

Yes i need to add the gpio-controller and #gpio-cells. But i'm not 
exactly sure what gpio-cells means and its difficult to find in 
documentation.

I found this in the documentation:
#gpio-cells: The first cell is the GPIO number and the second cell is 
used to specify the GPIO polarity.

This device only supports inputs so the gpio-cells option needs to be 
<1>  or ??
#gpio-cells = <1>;

/Sean

On 2016-01-19 18:20, Rob Herring wrote:
> On Tue, Jan 19, 2016 at 11:22:20AM +0100, Sean Nyekjaer wrote:
>> Signed-off-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
>> ---
>>   Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt b/Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt
>> new file mode 100644
>> index 0000000..56679ac
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-sn65hvs885.txt
>> @@ -0,0 +1,9 @@
>> +* TI SN65HVS885 digital-input serializer
>> +
>> +Example:
>> +	sn65hvs885@3 {
>> +		compatible = "sn65hvs885";
>> +		spi-max-frequency = <10000000>;
>> +		reg = <0>;
> What about all the standard gpio controller properties?
>
>> +	};
>> +
>> -- 
>> 2.7.0
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html

