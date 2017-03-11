From: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 05/11] Documentation: DT: bindings: mfd:
 add A33 GPADC binding
Date: Sat, 11 Mar 2017 15:07:55 +0100
Message-ID: <6d997cc1-585e-e25c-a53f-d7b28613dfbb@free-electrons.com>
References: <20170310103921.19469-1-quentin.schulz@free-electrons.com>
 <20170310103921.19469-6-quentin.schulz@free-electrons.com>
 <5798131489173902@web12o.yandex.ru>
Reply-To: quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCLZXSNY5IDBBPEJSDDAKGQEZ3FYXQY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <5798131489173902-abBhLmBzshNxpj1cXAZ9Bg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>, "dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "wens-jdAy2FN1RRM@public.gmane.org" <wens-jdAy2FN1RRM@public.gmane.org>, "lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org" <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "knaack.h-Mmb7MZpHnFY@public.gmane.org" <knaack.h-Mmb7MZpHnFY@public.gmane.org>, "lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org" <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org" <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, "stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Icenowy,

On 10/03/2017 20:25, Icenowy Zheng wrote:
> 
> 
> 10.03.2017, 18:56, "Quentin Schulz" <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>:
>> This patch adds documentation for the A33 GPADC binding.
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> ---
>>
>> added in v2
>>
>>  .../devicetree/bindings/mfd/sun4i-gpadc.txt | 59 ++++++++++++++++++++++
>>  1 file changed, 59 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt b/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
>> new file mode 100644
>> index 0000000..17242c8
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/sun4i-gpadc.txt
>> @@ -0,0 +1,59 @@
>> +Allwinner SoCs' GPADC Device Tree bindings
>> +------------------------------------------
>> +The Allwinner SoCs all have an ADC that can also act as a thermal sensor
>> +and sometimes as a touchscreen controller.
>> +
>> +Required properties:
>> + - compatible: "sun8i-a33-gpadc-iio",
>> + - reg: mmio address range of the chip,
>> + - #thermal-sensor-cells: shall be 0,
>> + - #io-channel-cells: shall be 0,
>> +
>> +Example:
>> + rtp: rtp@01c25000 {
> 
> I think we'd better call it ths.
> 

To match the datasheet, I agree.

> And can you make thermal-sensor-cells become 1?
> 
> Maxime Ripard wants to base H3/H5/A64 thermal driver on this patchset, and
> for H5/A64 there's 2/3 thermal sensors.
> 

Yes, that'll require a specific DT node for those thermal sensors. Then
since we would update the possible compatibles in the documentation
anyway, that would be a good idea to update to say that
thermal-sensor-cells could be different from 0 too.

That was my mindset to set thermal-sensor-cells to 0, since we only
support SoC which has only one thermal sensor at the moment.

> Thus for A33/H3 we will have thermal-sensor-cells to 1, but only have
> <&ths 0>.
> 

That's non-sense. There is one thermal sensor for the A33,
thermal-sensor-cells has to be 0.

I don't mind to remove the requirement for thermal-sensor-cells to be 0
but I won't put a requirement for it to be 1 as it isn't true.

Thanks,
Quentin
>> + compatible = "allwinner,sun8i-a33-gpadc-iio";
>> + reg = <0x01c25000 0x100>;
>> + #thermal-sensor-cells = <0>;
>> + #io-channel-cells = <0>;
>> + };
>> +
>> +sun4i, sun5i and sun6i SoCs are also supported via the older binding:
>> +
>> +sun4i resistive touchscreen controller
>> +--------------------------------------
>> +
>> +Required properties:
>> + - compatible: "allwinner,sun4i-a10-ts", "allwinner,sun5i-a13-ts" or
>> + "allwinner,sun6i-a31-ts"
>> + - reg: mmio address range of the chip
>> + - interrupts: interrupt to which the chip is connected
>> + - #thermal-sensor-cells: shall be 0
>> +
>> +Optional properties:
>> + - allwinner,ts-attached : boolean indicating that an actual touchscreen
>> + is attached to the controller
>> + - allwinner,tp-sensitive-adjust : integer (4 bits)
>> + adjust sensitivity of pen down detection
>> + between 0 (least sensitive) and 15
>> + (defaults to 15)
>> + - allwinner,filter-type : integer (2 bits)
>> + select median and averaging filter
>> + samples used for median / averaging filter
>> + 0: 4/2
>> + 1: 5/3
>> + 2: 8/4
>> + 3: 16/8
>> + (defaults to 1)
>> +
>> +Example:
>> +
>> + rtp: rtp@01c25000 {
>> + compatible = "allwinner,sun4i-a10-ts";
>> + reg = <0x01c25000 0x100>;
>> + interrupts = <29>;
>> + allwinner,ts-attached;
>> + #thermal-sensor-cells = <0>;
>> + /* sensitive/noisy touch panel */
>> + allwinner,tp-sensitive-adjust = <0>;
>> + allwinner,filter-type = <3>;
>> + };
>> --
>> 2.9.3
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

-- 
Quentin Schulz, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
