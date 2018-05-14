Return-Path: <SRS0=ePA5=IB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ot0-f194.google.com ([74.125.82.194]:42864 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751978AbeENU4B (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 14 May 2018 16:56:01 -0400
Received: by mail-ot0-f194.google.com with SMTP id l13-v6so15937887otk.9
        for <devicetree@vger.kernel.org>; Mon, 14 May 2018 13:56:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <7h603v115k.fsf@baylibre.com>
References: <20180509235037.5876-1-martin.blumenstingl@googlemail.com> <7h603v115k.fsf@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 14 May 2018 22:55:40 +0200
Message-ID: <CAFBinCDcDJXJb8=Ap6gUSOfkFewUf4s7FMFuS37fv5J3Vy_7YA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Meson8m2 (32-bit ARM) SoC support
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, carlo@caione.org, devicetree@vger.kernel.org, balbes-150@yandex.ru
List-ID: <devicetree@vger.kernel.org>

On Fri, May 11, 2018 at 2:33 AM, Kevin Hilman <khilman@baylibre.com> wrote:
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>
>> This series adds support for the Meson8m2 SoC. This SoC is mostly
>> compatible with Meson8 while using some peripherals from Meson8b. Patch
>> #4 contains a list of (known) differences between the Meson8 and Meson8m2
>> SoCs.
>>
>> The first supported board with Meson8m2 SoC is the "Tronsmart MXIII Plus"
>> where Oleg contributed the initial .dts and heavily tested it (many
>> thanks!). His testing also confirmed that the Meson8m2 SoC uses the same
>> register layout for the Ethernet "glue registers (supported by the
>> dwmac-meson8b driver) as Meson8b.
>>
>> changes since v1 at [0]:
>> - do not create a new MACH_MESON8M2 Kconfig entry as suggested by Kevin
>>   (MACH_MESON8 is re-used instead). This affects patch #1 (which was
>>   patch #3 in v1) and patch #4 (which was patch #6 in v1)
>> - dropped patches #1 and #2 from v1 because Kevin already applied these
>>   ("dt-bindings: arm: amlogic: add support for the Meson8m2 SoC" and
>>   "dt-bindings: arm: amlogic: add support for the Tronsmart MXIII Plus")
>
> Applied to v4.18/dt.
thank you!

> One more request: Could you send one more patch (on top of my v4.18/dt)
> that gets rid of the Kconfig for the 8B also?
I put that on my TODO-list, I'll send a patch before my next batch of
32-bit dt updates


Regards
Martin
