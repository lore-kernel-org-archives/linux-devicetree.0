From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 05/12] arm64: dts: Add I2C nodes for Hi3660
Date: Tue, 23 May 2017 07:44:35 -0500
Message-ID: <CAL_JsqK5m1oAvAntaJt4CWTCR+j09xunf-QacMTQJWfO3_jxvA@mail.gmail.com>
References: <20170517083745.24479-1-guodong.xu@linaro.org> <20170517083745.24479-6-guodong.xu@linaro.org>
 <20170523003908.ztuh4oohdk3g34pm@rob-hp-laptop> <94d06900-d871-7bc6-e1f3-d2b22ba20aaf@linaro.org>
 <c7f16d66-f884-b230-4b44-29d603af12ab@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c7f16d66-f884-b230-4b44-29d603af12ab-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: zhangfei <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Kefeng Wang <wangkefeng.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jiancheng Xue <xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 23, 2017 at 1:36 AM, zhangfei <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
>
> On 2017年05月23日 13:55, zhangfei wrote:
>>
>> Hi, Rob
>>
>>
>> Thanks for the review.
>>
>> On 2017年05月23日 08:39, Rob Herring wrote:
>>>
>>> On Wed, May 17, 2017 at 04:37:38PM +0800, Guodong Xu wrote:
>>>>
>>>> From: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>>
>>>> Add I2C nodes for Hi3660-hikey960.
>>>>
>>>> On HiKey960,
>>>> I2C0, I2C7 is connected to Low Speed Expansion Connector.
>>>> I2C1 is connected to ADV7535.
>>>> I2C3 is connected to USB5734.
>>>>
>>>> Signed-off-by: Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>> Signed-off-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>> ---
>>>>   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts | 18 ++++++++
>>>>   arch/arm64/boot/dts/hisilicon/hi3660.dtsi         | 56
>>>> +++++++++++++++++++++++
>>>>   2 files changed, 74 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
>>>> b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
>>>> index 64875a5..f685b1e 100644
>>>> --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
>>>> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
>>>> @@ -29,6 +29,24 @@
>>>>       };
>>>>   };
>>>>   +&i2c0 {
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&i2c1 {
>>>> +    status = "okay";
>>>> +
>>>> +    adv7533: adv7533@39 {
>>>> +        status = "ok";
>>>> +        compatible = "adi,adv7533";
>>>> +        reg = <0x39>;
>>>> +    };
>>>> +};
>>>> +
>>>> +&i2c7 {
>>>> +    status = "okay";
>>>> +};
>>>
>>> labels for the LS connector?
>
>
> Do you mean arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
>
>                 i2c@78ba000 {
>                 /* On Low speed expansion */
>                         label = "LS-I2C1";
>                         status = "okay";
>                 };
>
>                 spi@78b7000 {
>                 /* On High speed expansion */
>                         label = "HS-SPI1";
>                         status = "okay";
>                 };

Yes. And the names need to align across boards to be useful.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
