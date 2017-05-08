From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] phy: meson8b-usb2: add support for the USB PHY on Meson8 SoCs
Date: Mon, 8 May 2017 22:02:11 +0200
Message-ID: <CAFBinCDed096pnD-mm+Y1iRXfZgBkZPgVjH537cUsZ+qd6g-2g@mail.gmail.com>
References: <20170506173625.19501-1-martin.blumenstingl@googlemail.com> <950abc53-df2d-93dd-68d1-e9868445bb93@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <950abc53-df2d-93dd-68d1-e9868445bb93-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, May 8, 2017 at 2:10 PM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
> Hi,
>
> On Saturday 06 May 2017 11:06 PM, Martin Blumenstingl wrote:
>> Meson8 uses the same USB PHY as found on the Meson8b and GXBB SoCs. Add
>> a new of_device_id to indicate this. Also update the documentation
>> (devicetree binding, Kconfig and MODULE_DESCRIPTION) accordingly.
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/phy/meson8b-usb2-phy.txt | 3 ++-
>>  drivers/phy/Kconfig                                        | 4 ++--
>>  drivers/phy/phy-meson8b-usb2.c                             | 5 +++--
>>  3 files changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/meson8b-usb2-phy.txt b/Documentation/devicetree/bindings/phy/meson8b-usb2-phy.txt
>> index 5fa73b9d20f5..d81d73aea608 100644
>> --- a/Documentation/devicetree/bindings/phy/meson8b-usb2-phy.txt
>> +++ b/Documentation/devicetree/bindings/phy/meson8b-usb2-phy.txt
>> @@ -1,7 +1,8 @@
>> -* Amlogic Meson8b and GXBB USB2 PHY
>> +* Amlogic Meson8, Meson8b and GXBB USB2 PHY
>>
>>  Required properties:
>>  - compatible:        Depending on the platform this should be one of:
>> +     "amlogic,meson8-usb2-phy"
>>       "amlogic,meson8b-usb2-phy"
>>       "amlogic,meson-gxbb-usb2-phy"
>
> Please split the dt binding documentation into a separate patch.
OK, however I guess I'll wait for a few days until that restructuring
patch is merged

thanks for reviewing this so quick!


Regards,
Martin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
