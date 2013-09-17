From: Mike Dunn <mikedunn-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3] PWM: PXA: add device tree support to PWM driver
Date: Tue, 17 Sep 2013 07:07:25 -0700
Message-ID: <5238621D.3050504@newsguy.com>
References: <1379091281-23662-1-git-send-email-mikedunn@newsguy.com> <52375FB1.5050700@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52375FB1.5050700-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-pwm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chao Xie <chao.xie-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/16/2013 12:44 PM, Stephen Warren wrote:
> On 09/13/2013 10:54 AM, Mike Dunn wrote:
>> This patch adds device tree support to the PXA's PWM driver.  Only an OF match
>> table is added; nothing needs to be extracted from the device tree node.  The
>> existing ID table is reused for the match table data.
>>
>> Tested on a Palm Treo 680 (both platform data and DT cases).
> 
>> diff --git a/Documentation/devicetree/bindings/pwm/pxa-pwm.txt b/Documentation/devicetree/bindings/pwm/pxa-pwm.txt
> 
>> +- compatible: should be one of:
>> +  - "marvell,pxa250-pwm"
>> +  - "marvell,pxa270-pwm"
>> +  - "marvell,pxa168-pwm"
>> +  - "marvell,pxa910-pwm"
> 
> Not just one of, but possible more than one...


So the phrasing should be "compatible: should be among:" ?


> 
>> diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
> 
>> +		pwm0: pwm@40b00000 {
>> +			compatible = "marvell,pxa270-pwm";
> 
> I thought the assertion was that pax270 and pxa250 were both compatible?
> If so, that should be:
> 
> 		compatible = "marvell,pxa270-pwm", "marvell,pxa250-pwm";


Indeed.  Currently, they are all the same.  By that logic, shouldn't it be

compatible = "marvell,pxa250-pwm", "marvell,pxa270-pwm", "marvell,pxa168-pwm",
"marvell,pxa910-pwm";

I am admittedly fuzzy on device tree, but this is starting to seem strange.

Anyway, I'll defer to your judgement and resubmit if you can give me precise
guidance on the above.  Thanks again for the review.

Thanks,
Mike

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
