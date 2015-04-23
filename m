From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/3] of: Allow OF to be enabled if COMPILE_TEST to increase coverage
Date: Thu, 23 Apr 2015 15:03:28 +0300
Message-ID: <0C5158C3-2BD3-4EC6-B1AC-B669F30B4C34@konsulko.com>
References: <1428245965-19618-1-git-send-email-geert@linux-m68k.org> <1428245965-19618-2-git-send-email-geert@linux-m68k.org> <CAL_JsqLQrNEpqWnqP4uDV0x87wERLC50FO-06fYBwLbyYsChpQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLQrNEpqWnqP4uDV0x87wERLC50FO-06fYBwLbyYsChpQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> On Apr 6, 2015, at 16:13 , Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>=20
> +Pantelis
>=20
> On Sun, Apr 5, 2015 at 9:59 AM, Geert Uytterhoeven <geert@linux-m68k.=
org> wrote:
>> Currently the OF configuration symbol is explicitly selected on
>> architectures that support device trees and/or Open Firmware.
>> However, there's no technical reason to limit the device tree
>> infrastructure to these architectures. Hence allow OF to be enabled =
when
>> compile testing, to increase compile coverage.
>>=20
>> Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
>> ---
>> drivers/of/Kconfig | 6 +++++-
>> 1 file changed, 5 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
>> index 7bcaeec876c0c3a5..4c98f14694458794 100644
>> --- a/drivers/of/Kconfig
>> +++ b/drivers/of/Kconfig
>> @@ -2,7 +2,11 @@ config DTC
>>        bool
>>=20
>> config OF
>> -       bool
>> +       bool "Device Tree and Open Firmware support" if COMPILE_TEST
>=20
> Actually, I think we want to just make this always visible. There are
> now use cases with overlays where we may want to enable DT even if th=
e
> architecture is not booting with DT. However, there may be more work
> needed to do that.
>=20

We have to decouple the notion of CONFIG_OF of the following two differ=
ent things.

1. I=E2=80=99m booting using a device tree blob.
2. I=E2=80=99m using the in-kernel live device tree to represent my har=
dware device state.

so CONFIG_OF_DTB_BLOB for the first case, and CONFIG_OF for the second.

Up to now we bundle those two together.

> Rob
>=20

Regards

=E2=80=94 Pantelis

>> +       help
>> +         This option enables the device tree infrastructure.
>> +         If is automatically selected by platforms that need it, bu=
t can
>> +         be enabled manually to increase compile-coverage.
>>=20
>> menu "Device Tree and Open Firmware support"
>>        depends on OF
>> --
>> 1.9.1
>>=20
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree=
" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
