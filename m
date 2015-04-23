From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 1/3] of: Allow OF to be enabled if COMPILE_TEST to increase coverage
Date: Thu, 23 Apr 2015 21:28:46 +0300
Message-ID: <D499921A-70D8-48AA-9125-1C0D29270736@konsulko.com>
References: <1428245965-19618-1-git-send-email-geert@linux-m68k.org> <1428245965-19618-2-git-send-email-geert@linux-m68k.org> <CAL_JsqLQrNEpqWnqP4uDV0x87wERLC50FO-06fYBwLbyYsChpQ@mail.gmail.com> <0C5158C3-2BD3-4EC6-B1AC-B669F30B4C34@konsulko.com> <CAL_JsqKZQMquF+kBACp90naLDvng3npU0gGgiaxp3VVKDFNcZw@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKZQMquF+kBACp90naLDvng3npU0gGgiaxp3VVKDFNcZw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On Apr 23, 2015, at 21:22 , Rob Herring <robherring2@gmail.com> wrote=
:
>=20
> On Thu, Apr 23, 2015 at 7:03 AM, Pantelis Antoniou
> <pantelis.antoniou@konsulko.com> wrote:
>> Hi Rob,
>>=20
>>> On Apr 6, 2015, at 16:13 , Rob Herring <robherring2@gmail.com> wrot=
e:
>>>=20
>>> +Pantelis
>>>=20
>>> On Sun, Apr 5, 2015 at 9:59 AM, Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>>>> Currently the OF configuration symbol is explicitly selected on
>>>> architectures that support device trees and/or Open Firmware.
>>>> However, there's no technical reason to limit the device tree
>>>> infrastructure to these architectures. Hence allow OF to be enable=
d when
>>>> compile testing, to increase compile coverage.
>>>>=20
>>>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>>> ---
>>>> drivers/of/Kconfig | 6 +++++-
>>>> 1 file changed, 5 insertions(+), 1 deletion(-)
>>>>=20
>>>> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
>>>> index 7bcaeec876c0c3a5..4c98f14694458794 100644
>>>> --- a/drivers/of/Kconfig
>>>> +++ b/drivers/of/Kconfig
>>>> @@ -2,7 +2,11 @@ config DTC
>>>>       bool
>>>>=20
>>>> config OF
>>>> -       bool
>>>> +       bool "Device Tree and Open Firmware support" if COMPILE_TE=
ST
>>>=20
>>> Actually, I think we want to just make this always visible. There a=
re
>>> now use cases with overlays where we may want to enable DT even if =
the
>>> architecture is not booting with DT. However, there may be more wor=
k
>>> needed to do that.
>>>=20
>>=20
>> We have to decouple the notion of CONFIG_OF of the following two dif=
ferent things.
>>=20
>> 1. I=E2=80=99m booting using a device tree blob.
>> 2. I=E2=80=99m using the in-kernel live device tree to represent my =
hardware device state.
>>=20
>> so CONFIG_OF_DTB_BLOB for the first case, and CONFIG_OF for the seco=
nd.
>>=20
>> Up to now we bundle those two together.
>=20
> They are separate already with CONFIG_OF_EARLY_FLATTREE
>=20

A bit cryptically named, no?

> Rob

Regards

=E2=80=94 Pantelis
