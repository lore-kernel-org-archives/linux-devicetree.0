From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: meson: organize devices in their corresponding busses
Date: Fri, 26 May 2017 11:20:55 -0700
Message-ID: <m2vaon1nug.fsf@baylibre.com>
References: <20170417213938.22626-1-martin.blumenstingl@googlemail.com>
        <20170417213938.22626-2-martin.blumenstingl@googlemail.com>
        <m2inkw4g47.fsf@baylibre.com>
        <CAFBinCBcWgS_qSMNEUH+QrPXxLyQo87paH3+wBkHf5LWarnmEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCBcWgS_qSMNEUH+QrPXxLyQo87paH3+wBkHf5LWarnmEQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
        (Martin Blumenstingl's message of "Sat, 20 May 2017 10:45:02 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:

> On Sat, May 20, 2017 at 12:49 AM, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
>> Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:
>>
>>> The Amlogic Meson SoCs have most of the internal peripherals organized
>>> in busses. Use them to make the dts easier to read and to avoid
>>> duplicated register (bus) offset definitions.
>>>
>>> The bus information is taken from the vendor kernel:
>>>       #define IO_CBUS_PHY_BASE        0xc1100000  ///2M
>>>       #define IO_AOBUS_PHY_BASE       0xc8100000  ///1M
>>>
>>> There are more internal busses (such as the abp bus which seems to
>>> contain audio, HDMI and Mali registers), but since we don't have
>>> drivers for them yet these are not added (yet).
>>>
>>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>>
>> I tested this series on my meson8b-odroidc1 and it boots fine.
>>
>> Series looks fine to me, except...
>>
>> [...]
>>
>>>
>>>               ethmac: ethernet@c9410000 {
>>>                       compatible = "amlogic,meson6-dwmac", "snps,dwmac";
>>>                       reg = <0xc9410000 0x10000
>>> -                            0xc1108108 0x4>;
>>> +                     0xc1108108 0x4>;
>>
>> stray tab removal?
> oh, excellent catch - thank you!
>
>> I fixed that up locally and applied to v4.13/dt64 branch.
> nice, thank you!
>
> do the ARM maintainers still want separate pull-requests for 32-bit
> and 64-bit .dts/defconfig/etc. changes?
> you might want to move the three latest commits from v4.13/dt64 to
> v4.13/dt32 in that case, but this should be trivial (since these
> patches don't depend on anything else)

yes, you're right.  I'll move them.

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
