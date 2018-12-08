From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/3] ARM: dts: meson: add the APB/APB2 busses
Date: Sat, 8 Dec 2018 17:49:16 +0100
Message-ID: <CAFBinCDuFCrJHrzY_98REiwnZMcezxUbth8Sd+Bz0jxipPhyWQ@mail.gmail.com>
References: <20181208164555.26527-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181208164555.26527-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Dec 8, 2018 at 5:46 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> This adds the APB bus on Meson8 and Meson8b as well as the APB2 bus on
> Meson6. This is preparation work for adding the Mali GPU which is
> located on theses busses.
>
> Meson6 seems to have it's APB at 0xc8000000 instead of 0xd0000000. The
> region at 0xd0000000 is called APB2 or A9_APB and it has a different
> size (256k) compared to Meson8 and Meson8b (2M).
>
> Addresses and sizes are taken from the Amlogic 3.10 kernel sources:
> - Meson6: [0]
> - Meson8: [1]
> - Meson8b: [2]
>
>
> [0] https://github.com/endlessm/linux-meson/blob/cd4096c3ff4eb5b8a8a5581bb46508601c5470dc/arch/arm/mach-meson6/include/mach/io.h#L61
> [1] https://github.com/endlessm/linux-meson/blob/cd4096c3ff4eb5b8a8a5581bb46508601c5470dc/arch/arm/mach-meson8/include/mach/io.h#L53
> [2] https://github.com/endlessm/linux-meson/blob/cd4096c3ff4eb5b8a8a5581bb46508601c5470dc/arch/arm/mach-meson8b/include/mach/io.h#L53
>
>
> Martin Blumenstingl (3):
>   ARM: dts: meson6: add the APB2 bus
>   ARM: dts: meson8: add the APB bus
>   ARM: dts: meson8b: add the APB bus
I incorrectly sent this series with the patches twice (once with a
typo in APB and once without the typo).
I'll re-send a fixed v2 - sorry for the noise


Regards
Martin
