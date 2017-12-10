From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: Add binding for Sitronix ST7735R
 display panels
Date: Sun, 10 Dec 2017 13:33:50 -0600
Message-ID: <a4b67cf6-a132-170c-5a71-edfd84aa2da1@lechnology.com>
References: <1511924469-11448-1-git-send-email-david@lechnology.com>
 <1511924469-11448-2-git-send-email-david@lechnology.com>
 <0cade030-030c-f6da-6f79-6fbd520ad753@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0cade030-030c-f6da-6f79-6fbd520ad753-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: limor-6aDhHjTmHzzR7s880joybQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/08/2017 03:41 PM, Noralf Trønnes wrote:
> 
> Den 29.11.2017 04.01, skrev David Lechner:
>> This adds a new device tree binding for Sitronix ST7735R display panels,
>> such as the Adafruit 1.8" TFT.
>>
>> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>> ---
>>   .../bindings/display/sitronix,st7735r.txt          | 35 
>> ++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>   create mode 100644 
>> Documentation/devicetree/bindings/display/sitronix,st7735r.txt
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/display/sitronix,st7735r.txt 
>> b/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
>> new file mode 100644
>> index 0000000..bbb8ba6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
>> @@ -0,0 +1,35 @@
>> +Sitronix ST7735R display panels
>> +
>> +This binding is for display panels using a Sitronix ST7735R 
>> controller in SPI
>> +mode.
>> +
>> +Required properties:
>> +- compatible:    "sitronix,st7735r-jd-t18003-t01"
>> +- dc-gpios:    Display data/command selection (D/CX)
>> +- reset-gpios:    Reset signal (RSTX)
> 
> I'm wondering if this should be optional.
> 
> Even though the display needs the reset line to be driven, it doesn't
> have to be so by a gpio, I believe you can even get away with just
> using a resistor as a reset circuit.
> 
> Not terribly important, it's up to you.
> 

It can be made optional later if needed, so I'm going to leave it as-is.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
