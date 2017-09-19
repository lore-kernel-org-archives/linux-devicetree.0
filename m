From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/2] tee: optee: allow selection of ti-smc as a calling
 method
Date: Tue, 19 Sep 2017 10:54:34 -0500
Message-ID: <830b4d20-26e2-02ce-76db-b63c73967e39@ti.com>
References: <20170918205005.30235-1-afd@ti.com>
 <20170918205005.30235-2-afd@ti.com>
 <CAL_JsqJ00f3i3BQKjuVUXO8Rc_EC8BaycQi1Z_9OyRff7_kDpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJ00f3i3BQKjuVUXO8Rc_EC8BaycQi1Z_9OyRff7_kDpg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/19/2017 08:36 AM, Rob Herring wrote:
> On Mon, Sep 18, 2017 at 3:50 PM, Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org> wrote:
>> On TI platforms OP-TEE must be called using a modified SMC call,
>> allow the selection of this though DT.
>>
>> Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.txt | 2 ++
>>  drivers/tee/optee/core.c                                           | 2 ++
>>  2 files changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.txt b/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.txt
>> index d38834c67dff..a3275ecdf186 100644
>> --- a/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.txt
>> +++ b/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.txt
>> @@ -20,6 +20,8 @@ the reference implementation maintained by Linaro.
>>                     "hvc" : HVC #0, with the register assignments specified
>>                            in drivers/tee/optee/optee_smc.h
>>
>> +                   "ti-smc" : Similar to "smc" with TI specific register
>> +                             adjustments
> 
> Sigh, really? IMO, this should be determined from the compatible
> string. Then the next TI (or any vendor) specific thing can be handled
> without a DT change.
> 

Which compatible string, do you mean the OP-TEE driver check the top
level platform compatible string?

> Maybe some day we'll figure out that not just h/w needs to be
> probe-able, but all the firmware pieces do too.
> 
> Rob
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
