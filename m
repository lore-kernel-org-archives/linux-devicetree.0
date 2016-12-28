From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH v3 1/3] Documentation: dt: net: add mt76 wireless device binding
Date: Wed, 28 Dec 2016 11:43:21 +0100
Message-ID: <CAFBinCBzz0Jvk_jcWAJ1jEz17r-NYEE87xLUACTybRSHGE7uGA@mail.gmail.com>
References: <20160905095128.80560-1-nbd@nbd.name> <201609301636.43363.arnd@arndb.de>
 <557be2b8-5ff1-83ea-f6d1-6421c2465969@nbd.name> <201609301658.35039.arnd@arndb.de>
 <87vax9r26s.fsf@kamboji.qca.qualcomm.com> <CACna6ryikdd0Yt2FWB_JT27N5uuh9XU+JUWNRjs4H5YcD5PVpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACna6ryikdd0Yt2FWB_JT27N5uuh9XU+JUWNRjs4H5YcD5PVpw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 28, 2016 at 11:08 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
> On 3 October 2016 at 15:29, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:
>>
>>> On Friday 30 September 2016, Felix Fietkau wrote:
>>>> >> >> >> +                 device_type =3D "pci";
>>>> >> >> >> +                 mediatek,mtd-eeprom =3D <&factory 0x8000>;
>>>> >> >> >> +                 mediatek,2ghz =3D <0>;
>>>> >> >
>>>> >> > It's not clear what the possible values for the 2ghz property are=
,
>>>> >> > can you be more verbose in the description? How is <0> different
>>>> >> > from no property?
>>>> >> 0 means disabled, no property means unchanged (compared to EEPROM).
>>>> >
>>>> > Maybe have a boolean property instead then to say "mediatek,2ghz-dis=
abled" ?
>>>> >
>>>> > If zero is the only possible value, there is no need to put a number=
 in there.
>>>> 1 is also possible, which will force-enable the capability.
>>>
>>> Ok, then both those values should be documented in the binding.
>>
>> Related to this, Martin sent patches which add generic bindings for
>> enabling 2 Ghz and 5 Ghz bands.
>>
>> [RFC,1/3] Documentation: dt-bindings: add IEEE 802.11 binding documentat=
ion
>> https://patchwork.kernel.org/patch/9359833/
>>
>> [RFC,2/3] of: add IEEE 802.11 device configuration support code
>> https://patchwork.kernel.org/patch/9359837/
>
> I would prefer something more generic. Many tri-band routers split 5
> GHz band into 2 sets of channels and they have separated radios for
> them.
>
> E.g. Netgear R8000 has phy0 which should be used for higher part of 5
> GHz band (channels 149+) and phy2 which should be used for lower part
> of 5 GHz band (channels from 36 to 48 or 64).
>
> What do you think about some more flexible properties like:
> ieee80211-min-center-freq
> ieee80211-max-center-freq
what would happen if only one of these properties was given or would
we forbid that (because the .dts should always describe the hardware,
and if we describe a lower bound then we should also describe the
upper bound)?
the benefits of your solution are:
- this would allow *enabling* bands as well (my proposal allows this
as well, but the .dts is indeed a bit hard to read - unlike your
solution which looks nice to me)
- we could handle this within generic cfg80211/mac80211 code instead
of "duplicating" it per driver

should we describe the center freq in Hz or MHz (cfg80211's
ieee80211_channel uses the latter)?

@Arnd: what do you think from devicetree perspective?


Regards,
Martin

[0] http://lxr.free-electrons.com/source/include/net/cfg80211.h#L130
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
