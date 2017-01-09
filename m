From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 0/5] meson-gx: reset RGMII PHYs and configure TX delay
Date: Mon, 09 Jan 2017 14:52:50 -0800
Message-ID: <m2wpe37sn1.fsf@baylibre.com>
References: <20161202234739.22929-1-martin.blumenstingl@googlemail.com>
        <CAFBinCDpBew7wreNPn6=J3jKsw_Ok=Ed9_+Gxsefb661RvUdrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCDpBew7wreNPn6=J3jKsw_Ok=Ed9_+Gxsefb661RvUdrA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
        (Martin Blumenstingl's message of "Sat, 17 Dec 2016 21:36:55 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> writes:

> On Sat, Dec 3, 2016 at 12:47 AM, Martin Blumenstingl
> <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>> This partially fixes the 1000Mbit/s ethernet TX throughput issues (on
>> networks which are not affected by the EEE problem, as reported here:
>> [1]).
>> The actual problem for the TX throughput issues was that the TX delay
>> was applied twice:
>> - once "accidentally" by the PHY (this was fixed with [2])
>> - once by the MAC because there was a hardcoded TX delay (of 2ns),
>>   this will be configurable with the changes from [0]
>>
>> These are the dts changes which belong to my other series (in v2
>> these patches were part of the other series, upon request of the
>> net maintainers I have split the .dts changes into their own series so
>> we are able to take both through different trees):
>> "[PATCH net-next v3 0/2] stmmac: dwmac-meson8b: configurable
>> RGMII TX delay": [0].
>> Thus this series depends on the ACK for the binding changes in the
>> other series!
>>
>> I based these changes on my other series "[PATCH v2 0/2] GXL and GXM
>> SCPI improvements": [3]
> the DT binding changes for the meson8b-dwmac driver were ACK'ed by Rob
> Herring, so you can proceed with this series once you applied the SCPI
> patches.

Series queued for v4.11,

Thanks,

Kevin
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
