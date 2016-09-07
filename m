From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 0/3] eMMC, SD-card and ethernet support for Vega S95 boards
Date: Wed, 7 Sep 2016 13:50:13 -0700
Message-ID: <CAOi56cUD5xMbEf3+qsWDJUQYhnWUMN4opfG1HQ+UUcrR6pX8eA@mail.gmail.com>
References: <20160815133811.19646-1-martin.blumenstingl@googlemail.com>
 <20160904182903.1841-1-martin.blumenstingl@googlemail.com> <7h37lbtqyk.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7h37lbtqyk.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-amlogic <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 7, 2016 at 1:06 PM, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
> Hi Marrtin,
>
> Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>
>> This adds support for the internal eMMC, the SD-card slot and ethernet on
>> all Tronsmart S95 Vega boards.
>> There are some S95 Vega Meta clones out there where the bootloader does
>> not configure the ethernet registers correctly, leading to non-working
>> ethernet. This will be fixed in a separate series. Boards which are not
>> suffering from broken bootloaders have fully working ethernet.
>>
>> Changes since v1:
>> - rebased after latest updates which added the IR decoder to
>>   meson-gxbb-vega-s95.dtsi
>>
>> Changes since the RFC:
>> - added eMMC support
>> - renamed fixed 3V3 regulator so it can be re-used for eMMC
>>
>>
>> Martin Blumenstingl (3):
>>   ARM64: dts: amlogic: SD card support for all Tronsmart Vega S95
>>     devices
>>   ARM64: dts: amlogic: eMMC support for all Tronsmart Vega S95 devices
>>   ARM64: dts: amlogic: enable ethernet on all Tronsmart Vega S95 devices
>
> I've applied the ethernet one, but I'm going to wait on the SD/eMMC
> patches until the driver is finalized for the other one.

Oops, I replied on the wrong thread, but just to be clear, I applied
v2 of the ethernet patch, though it doesn't make too much difference
in this case.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
