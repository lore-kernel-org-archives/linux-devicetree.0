Return-Path: <SRS0=d9CS=UG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43274 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729118AbfFGU17 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 7 Jun 2019 16:27:59 -0400
Received: by mail-ot1-f66.google.com with SMTP id i8so3025173oth.10
        for <devicetree@vger.kernel.org>; Fri, 07 Jun 2019 13:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190606132439.25182-1-krzysztof.michonski@digitalstrom.com>
In-Reply-To: <20190606132439.25182-1-krzysztof.michonski@digitalstrom.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 7 Jun 2019 22:27:47 +0200
Message-ID: <CAFBinCDKPTBwhG-PGFoz25iDq5-DfMT3y3b=k1VJ7MFPnwezFA@mail.gmail.com>
Subject: Re: [PATCH 1/2] meson_sm: Extend meson_sm driver to be compatible
 with gxl chip
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Krzysztof Michonski <michonskikrzysztof@gmail.com>
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, afenkart@gmail.com
List-ID: <devicetree@vger.kernel.org>

Hi Krzysztof,

On Thu, Jun 6, 2019 at 3:24 PM Krzysztof Michonski
<michonskikrzysztof@gmail.com> wrote:
[...]
> +struct meson_sm_chip gxl_chip = {
> +       .shmem_size             = SZ_4K,
> +       .cmd_shmem_in_base      = 0x82000023,
> +       .cmd_shmem_out_base     = 0x82000024,
where did you get these values from and/or what issues did you see
with the values from GXBB?

I checked Amlogic's buildroot kernel whether they are doing something similar:
$ grep in_base_func
buildroot-openlinux-A113-201901/kernel/aml-4.9/arch/arm64/boot/dts/amlogic/mesong*.dtsi
| cut -d':' -f2 | sort -u
                in_base_func = <0x82000020>;
that includes GXL, GXM, G12A and G12B. however, I admit that I didn't
have time to test your patch yet (so it may be just fine and the
vendor kernel is buggy)


Martin
