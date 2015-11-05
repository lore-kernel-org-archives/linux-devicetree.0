From: Zhong Kaihua <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/3] dt-bindings: gpio: Documentation for Hi6220 gpio
 driver
Date: Thu, 5 Nov 2015 11:01:49 +0800
Message-ID: <563AC69D.3070606@huawei.com>
References: <1446258260-72902-1-git-send-email-zhongkaihua@huawei.com> <1446258260-72902-2-git-send-email-zhongkaihua@huawei.com> <CAL_JsqK1HJ1aDRWMj+7SVXz_zBbD_qbBZ79cbWCnLeKT2++bbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqK1HJ1aDRWMj+7SVXz_zBbD_qbBZ79cbWCnLeKT2++bbw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Yiping Xu <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2015/11/2 23:09, Rob Herring wrote:
> On Fri, Oct 30, 2015 at 9:24 PM, Zhong Kaihua <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
>> dt-bindings: gpio: Documentation for Hi6220 gpio driver
>>
>> Signed-off-by: Zhong Kaihua <zhongkaihua-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> ---
>>  .../devicetree/bindings/gpio/gpio-hi6220.txt       | 23 ++++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-hi6220.txt
>>
>> diff --git a/Documentation/devicetree/bindings/gpio/gpio-hi6220.txt b/Documentation/devicetree/bindings/gpio/gpio-hi6220.txt
>> new file mode 100644
>> index 0000000..76a8932
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/gpio-hi6220.txt
>> @@ -0,0 +1,23 @@
>> +Hisilicon Hi6220 GPIO controller bindings
>> +
>> +Required properties:
>> +  - compatible:        "arm,pl061", "arm,primecell"
>> +  - gpio-controller: Marks the device node as a        GPIO controller.
>> +  - #gpio-cells: Should        be 2. See gpio.txt in this directory for a
> 
> Some strange spacing in here. Otherwise,
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Style problems have been fixed in V2 patch.

Rearrange the document patch to the first of patch set.

> 
>> +                description of the cells format.
>> +  - interrupt-controller: Mark the device node as an interrupt controller
>> +
>> +Example:
>> +
>> +       gpio0: gpio@f8011000 {
>> +               compatible = "arm,pl061", "arm,primecell";
>> +               reg = <0x0 0xf8011000 0x0 0x1000>;
>> +               interrupts = <0 52 0x4>;
>> +               gpio-controller;
>> +               #gpio-cells = <2>;
>> +               interrupt-controller;
>> +               #interrupt-cells = <2>;
>> +               clocks = <&ao_ctrl 2>;
>> +               clock-names = "apb_pclk";
>> +               status = "ok";
>> +       };
>> --
>> 1.9.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> .
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
