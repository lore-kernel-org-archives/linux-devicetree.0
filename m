From: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] binding for stm32 cec driver
Date: Tue, 23 May 2017 09:15:04 +0200
Message-ID: <CA+M3ks4erq+_ty4pq1yTTz3JXk+MjLvh=EXGsnYh5G7wVWqVnw@mail.gmail.com>
References: <1494939383-18937-1-git-send-email-benjamin.gaignard@linaro.org>
 <1494939383-18937-2-git-send-email-benjamin.gaignard@linaro.org> <20170523001448.iryswhvw2irtdyuz@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170523001448.iryswhvw2irtdyuz@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2017-05-23 2:14 GMT+02:00 Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> On Tue, May 16, 2017 at 02:56:22PM +0200, Benjamin Gaignard wrote:
>
> Commit message?

is missing, sorry..

>
> Preferred subject prefix is "dt-bindings: media: ..."

ok

>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  .../devicetree/bindings/media/st,stm32-cec.txt        | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/st,stm32-cec.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/st,stm32-cec.txt b/Documentation/devicetree/bindings/media/st,stm32-cec.txt
>> new file mode 100644
>> index 0000000..6be2381
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/st,stm32-cec.txt
>> @@ -0,0 +1,19 @@
>> +STMicroelectronics STM32 CEC driver
>> +
>> +Required properties:
>> + - compatible : value should be "st,stm32-cec"
>
> All stm32 chips have same CEC block?

yes the block is the same for all stm32 f4/f7/h7 chips

>
>> + - reg : Physical base address of the IP registers and length of memory
>> +      mapped region.
>> + - clocks : from common clock binding: handle to CEC clocks
>> + - clock-names : from common clock binding: must be "cec" and "hdmi-cec".
>> + - interrupts : CEC interrupt number to the CPU.
>> +
>> +Example for stm32f746:
>> +
>> +cec: cec@40006c00 {
>> +     compatible = "st,stm32-cec";
>> +     reg = <0x40006C00 0x400>;
>> +     interrupts = <94>;
>> +     clocks = <&rcc 0 STM32F7_APB1_CLOCK(CEC)>, <&rcc 1 CLK_HDMI_CEC>;
>> +     clock-names = "cec", "hdmi-cec";
>> +};
>> --
>> 1.9.1
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
