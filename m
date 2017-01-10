From: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpio: pca953x: Add optional reset gpio control
Date: Tue, 10 Jan 2017 11:21:00 -0800
Message-ID: <6ab3577a-8e6a-1f67-ac25-b4054767b3f2@gmail.com>
References: <1483391271-17304-1-git-send-email-steve_longerbeam@mentor.com>
 <1483391271-17304-2-git-send-email-steve_longerbeam@mentor.com>
 <20170104132231.jlhqwngaeza7duoo@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170104132231.jlhqwngaeza7duoo@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 01/04/2017 05:22 AM, Rob Herring wrote:
> On Mon, Jan 02, 2017 at 01:07:51PM -0800, Steve Longerbeam wrote:
>> Add optional reset-gpios pin control. If present, de-assert the
>> specified reset gpio pin to bring the chip out of reset.
>>
>> Signed-off-by: Steve Longerbeam <steve_longerbeam-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
>> Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> ---
>>   Documentation/devicetree/bindings/gpio/gpio-pca953x.txt |  4 ++++
>>   drivers/gpio/gpio-pca953x.c                             | 11 +++++++++++
>>   2 files changed, 15 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>> index 08dd15f..da54f4c 100644
>> --- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
>> @@ -29,6 +29,10 @@ Required properties:
>>   	onsemi,pca9654
>>   	exar,xra1202
>>   
>> +Optional properties:
>> + - reset-gpios: GPIO specification for the RESET input
> Need to specify active high or low.

done (it's an active low signal).

Steve

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
