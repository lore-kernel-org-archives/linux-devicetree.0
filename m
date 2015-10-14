From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 3/3] arm64: dts: mt8173: Add nor flash node
Date: Wed, 14 Oct 2015 09:07:49 +0800
Message-ID: <CAGS+omDm=74d6cw7kXwkZ_Jy-faBz7z4-vJQX9ZFVNskQqSS-w@mail.gmail.com>
References: <1444729160-26433-1-git-send-email-bayi.cheng@mediatek.com>
 <1444729160-26433-4-git-send-email-bayi.cheng@mediatek.com> <561D1642.3070105@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <561D1642.3070105-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Sergei,

On Tue, Oct 13, 2015 at 10:33 PM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> Hello.
>
> On 10/13/2015 12:39 PM, Bayi Cheng wrote:
>
>> Add Mediatek nor flash node
>>
>> Signed-off-by: Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> index d18ee42..385c2e4 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>> @@ -365,6 +365,21 @@
>>                         status = "disabled";
>>                 };
>>
>> +               nor_flash: spi@1100d000 {
>
>
>    I don't think this is a good label name for a SPI controller.

You think "spi" is not a good name for SPI controller?
Or you mean the label "nor_flash"?

Would you prefer:

  spi_nor_flash: spi@1100d000


>
>> +                       compatible = "mediatek,mt8173-nor";
>> +                       reg = <0 0x1100d000 0 0xe0>;
>> +                       clocks = <&pericfg CLK_PERI_SPI>,
>> +                                <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
>> +                       clock-names = "spi", "sf";
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       flash@0 {
>> +                               compatible = "jedec,spi-nor";
>> +                               reg = <0>;
>> +                       };
>> +               };
>> +
>>                 i2c3: i2c3@11010000 {
>
>
>    Grr, the name should be "i2c@11010000".

Don't worry.  This is already fixed in Matthias' tree:
  https://github.com/mbgg/linux-mediatek/commit/1ee35c05d9c67771d649f687e6f76e61e76eb779

-Dan

>
> [...]
>
> MBR, Sergei
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
