From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 08/12] arm64: dts: hikey960: add WL1837 Bluetooth device node
Date: Tue, 23 May 2017 16:15:20 +0800
Message-ID: <CAFGCpxzthNZ9pvA7UGrGzfjoYtEf+NpZ63RgHSjFh9bNHjkaXQ@mail.gmail.com>
References: <20170517083745.24479-1-guodong.xu@linaro.org> <20170517083745.24479-9-guodong.xu@linaro.org>
 <20170523004530.c3yyjbws55hvnlc4@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170523004530.c3yyjbws55hvnlc4@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "xuwei (O)" <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "Chenfeng (puck)" <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Xuejiancheng <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 23, 2017 at 8:45 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, May 17, 2017 at 04:37:41PM +0800, Guodong Xu wrote:
>> This adds the serial slave device for the WL1837 Bluetooth interface.
>>
>> Signed-off-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
>> index 513c496..69aa207 100644
>> --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
>> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
>> @@ -9,6 +9,7 @@
>>
>>  #include "hi3660.dtsi"
>>  #include "hikey960-pinctrl.dtsi"
>> +#include <dt-bindings/gpio/gpio.h>
>>
>>  / {
>>       model = "HiKey960";
>> @@ -55,6 +56,16 @@
>>       status = "okay";
>>  };
>>
>> +&uart4 {
>> +     status = "okay";
>> +     max-speed = <921600>;
>
> This goes in the bluetooth node.

Yeah, thanks. I will fix.

-Guodong

>
>> +
>> +     bluetooth {
>> +             compatible = "ti,wl1837-st";
>> +             enable-gpios = <&gpio15 6 GPIO_ACTIVE_HIGH>;
>> +     };
>> +};
>> +
>>  &uart6 {
>>       status = "okay";
>>  };
>> --
>> 2.10.2
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
