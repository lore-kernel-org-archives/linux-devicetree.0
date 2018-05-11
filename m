Return-Path: <SRS0=okLl=H6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:45020 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750805AbeEKAdq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 10 May 2018 20:33:46 -0400
Received: by mail-pg0-f68.google.com with SMTP id x145-v6so1664561pgx.11
        for <devicetree@vger.kernel.org>; Thu, 10 May 2018 17:33:46 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 0/4] Meson8m2 (32-bit ARM) SoC support
References: <20180509235037.5876-1-martin.blumenstingl@googlemail.com>
Date: Thu, 10 May 2018 17:33:43 -0700
In-Reply-To: <20180509235037.5876-1-martin.blumenstingl@googlemail.com>
        (Martin Blumenstingl's message of "Thu, 10 May 2018 01:50:33 +0200")
Message-ID: <7h603v115k.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, carlo@caione.org, devicetree@vger.kernel.org, balbes-150@yandex.ru
List-ID: <devicetree@vger.kernel.org>

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> This series adds support for the Meson8m2 SoC. This SoC is mostly
> compatible with Meson8 while using some peripherals from Meson8b. Patch
> #4 contains a list of (known) differences between the Meson8 and Meson8m2
> SoCs.
>
> The first supported board with Meson8m2 SoC is the "Tronsmart MXIII Plus"
> where Oleg contributed the initial .dts and heavily tested it (many
> thanks!). His testing also confirmed that the Meson8m2 SoC uses the same
> register layout for the Ethernet "glue registers (supported by the
> dwmac-meson8b driver) as Meson8b.
>
> changes since v1 at [0]:
> - do not create a new MACH_MESON8M2 Kconfig entry as suggested by Kevin
>   (MACH_MESON8 is re-used instead). This affects patch #1 (which was
>   patch #3 in v1) and patch #4 (which was patch #6 in v1)
> - dropped patches #1 and #2 from v1 because Kevin already applied these
>   ("dt-bindings: arm: amlogic: add support for the Meson8m2 SoC" and
>   "dt-bindings: arm: amlogic: add support for the Tronsmart MXIII Plus")

Applied to v4.18/dt.

One more request: Could you send one more patch (on top of my v4.18/dt)
that gets rid of the Kconfig for the 8B also?

Thanks,

Kevin
