From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 4/5] gpio: DT: Rephrase "gpios" of hog node to support
 multiple gpios
Date: Tue, 15 Mar 2016 12:07:25 +0530
Message-ID: <56E7ADA5.7000502@nvidia.com>
References: <1457703804-3016-1-git-send-email-ldewangan@nvidia.com> <1457703804-3016-5-git-send-email-ldewangan@nvidia.com> <56E6E753.1020505@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56E6E753.1020505-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Monday 14 March 2016 10:01 PM, Stephen Warren wrote:
> On 03/11/2016 06:43 AM, Laxman Dewangan wrote:
>> The property "gpios" of GPIO hog node support the multiple GPIO entries.
>> Rephrase the details of this property for this new support.
>>
>> Add details of new property "label" for GPIO label name.
>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt 
>> b/Documentation/devicetree/bindings/gpio/gpio.txt
>
>>   Optional properties:
>>   - line-name:  The GPIO label name. If not present the node name is 
>> used.
>> +- label:      The GPIO lable name. This can have multiple string for 
>> GPIO
>> +          label names to match with the GPIOs in "gpios" properties.
>> +          If line-name is prosent than name is taken from line-name. If
>> +          it is not then the name will be taken from label. If both are
>> +          not available then node name is used for GPIO label name.
>
> Why are there two properties for the same thing? Why not just allow 
> line-name to have multiple entries instead of introducing a new property?
>

We can use the lin-names also but per disucssion on the patch V1 of
     gpio: of: Add support to have multiple gpios in gpio-hog

Markus suggested the discussion about the discussion 
(https://lkml.org/lkml/2016/3/10/194):
     "Device tree binding documentation for gpio-switch"


and on that, label is used.  Also for names, "label" is going to very 
common.

So I added new property "label" to support multiple names.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
