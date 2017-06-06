From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] usb: dwc2: add support for the DWC2 controller on Meson8 SoCs
Date: Tue, 6 Jun 2017 20:16:01 +0200
Message-ID: <CAFBinCB7+2EiCse0dHDuEqc7-cksGOfZX=_ttZ=bn17Rk9x3qQ@mail.gmail.com>
References: <20170506173745.19593-1-martin.blumenstingl@googlemail.com>
 <CAFBinCBBN9xAoqjqJKeu66wEXOtp-mN2EQK3ibnvNuw1nOMa=g@mail.gmail.com> <2B3535C5ECE8B5419E3ECBE300772909021B5387A9@US01WEMBX2.internal.synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2B3535C5ECE8B5419E3ECBE300772909021B5387A9-Yu2iAY70zvrYN67daEjeMPufCSb+aD3WLzEdoUbNIic@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: "linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi John,

On Tue, Jun 6, 2017 at 3:48 AM, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> wrote:
> On 5/25/2017 10:39 AM, Martin Blumenstingl wrote:
>> Hi John,
>>
>> On Sat, May 6, 2017 at 7:37 PM, Martin Blumenstingl
>> <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>>> USB support in the Meson8 SoCs is provided by a DWC2 controller which
>>> works with the same settings as Meson8b and GXBB. Using the generic
>>> "snps,dwc2" binding results in an endless stream of "Overcurrent change
>>> detected" messages.
>>>
>>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>> do you want me to re-send this with Rob's ACK?
>> also please let me know if something is still missing in this patch
>>
>>> ---
>>>  Documentation/devicetree/bindings/usb/dwc2.txt | 1 +
>>>  drivers/usb/dwc2/params.c                      | 2 ++
>>>  2 files changed, 3 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
>>> index 6c7c2bce6d0c..b55be381ae85 100644
>>> --- a/Documentation/devicetree/bindings/usb/dwc2.txt
>>> +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
>>> @@ -10,6 +10,7 @@ Required properties:
>>>    - "rockchip,rk3288-usb", "rockchip,rk3066-usb", "snps,dwc2": for rk3288 Soc;
>>>    - "lantiq,arx100-usb": The DWC2 USB controller instance in Lantiq ARX SoCs;
>>>    - "lantiq,xrx200-usb": The DWC2 USB controller instance in Lantiq XRX SoCs;
>>> +  - "amlogic,meson8-usb": The DWC2 USB controller instance in Amlogic Meson8 SoCs;
>>>    - "amlogic,meson8b-usb": The DWC2 USB controller instance in Amlogic Meson8b SoCs;
>>>    - "amlogic,meson-gxbb-usb": The DWC2 USB controller instance in Amlogic S905 SoCs;
>>>    - "amcc,dwc-otg": The DWC2 USB controller instance in AMCC Canyonlands 460EX SoCs;
>>> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
>>> index 2990c347289f..0d6290ed66ea 100644
>>> --- a/drivers/usb/dwc2/params.c
>>> +++ b/drivers/usb/dwc2/params.c
>>> @@ -128,6 +128,8 @@ const struct of_device_id dwc2_of_match_table[] = {
>>>         { .compatible = "lantiq,xrx200-usb", .data = dwc2_set_ltq_params },
>>>         { .compatible = "snps,dwc2" },
>>>         { .compatible = "samsung,s3c6400-hsotg" },
>>> +       { .compatible = "amlogic,meson8-usb",
>>> +         .data = dwc2_set_amlogic_params },
>>>         { .compatible = "amlogic,meson8b-usb",
>>>           .data = dwc2_set_amlogic_params },
>>>         { .compatible = "amlogic,meson-gxbb-usb",
>>> --
>>> 2.12.2
>>>
>>
>
> Adding Felipe
>
>
> Acked-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
thank you!

actually Greg seems to have picked it up already as it's part of his
v4.12-rc4 pull request: [0]
(I'm not sure why it went into v4.12-rc4 instead of -next/v4.13 - but
it probably won't hurt anyone)


[0] https://www.spinics.net/lists/linux-usb/msg157693.html
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
