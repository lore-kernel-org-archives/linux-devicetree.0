From: "Kim, Milo" <milo.kim-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: dt-bindings: Use generic property for
 hardware enable pins
Date: Fri, 3 Mar 2017 15:56:15 +0900
Message-ID: <be14e98c-62c8-10bd-fc36-d7c146f39194@ti.com>
References: <20170228075041.7568-1-milo.kim@ti.com>
 <20170303062119.kdogozkkhsvwewwa@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170303062119.kdogozkkhsvwewwa@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 3/3/2017 3:21 PM, Rob Herring wrote:
> On Tue, Feb 28, 2017 at 04:50:40PM +0900, Milo Kim wrote:
>> With index usages, device specific properties can be replaced with generic
>> one. Vpos is index 0 and Vneg is index 1.
>> DT examples are added as well.
>>
>> Signed-off-by: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>
>> ---
>>  .../bindings/regulator/lm363x-regulator.txt        | 78 +++++++++++++++++++++-
>>  1 file changed, 76 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/lm363x-regulator.txt b/Documentation/devicetree/bindings/regulator/lm363x-regulator.txt
>> index 8f14df9d1205..cc5a6151d85f 100644
>> --- a/Documentation/devicetree/bindings/regulator/lm363x-regulator.txt
>> +++ b/Documentation/devicetree/bindings/regulator/lm363x-regulator.txt
>> @@ -8,8 +8,8 @@ Required property:
>>
>>  Optional properties:
>>    LM3632 has external enable pins for two LDOs.
>> -  - ti,lcm-en1-gpio: A GPIO specifier for Vpos control pin.
>> -  - ti,lcm-en2-gpio: A GPIO specifier for Vneg control pin.
>> +  - enable-gpios: Two GPIO specifiers for Vpos and Vneg control pins.
>> +                  The first entry is Vpos, the second is Vneg enable pin.
>
> You're breaking compatibility with existing DTBs. You need to explain
> that and why it is okay in the commit message. In this case, I don't
> think it is okay as this chip could be used across vendors' platforms.

Thanks for your comment.

The lm363x-regulator has a dependency on ti-lmu MFD driver which is not 
upstreamed. So I don't think this patch will break the compatibility 
because two properties are not used anywhere at this moment.
Please correct me if it's incorrect.

Using general DT property is simple/clear because two enable pins are 
differentiable by selecting the index number. That's the main reason of 
this patch.

Best regards,
Milo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
