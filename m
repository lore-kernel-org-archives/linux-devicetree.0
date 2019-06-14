Return-Path: <SRS0=xUMM=UN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37695 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbfFNJXj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Jun 2019 05:23:39 -0400
Received: by mail-wr1-f66.google.com with SMTP id v14so1740863wrr.4
        for <devicetree@vger.kernel.org>; Fri, 14 Jun 2019 02:23:37 -0700 (PDT)
Subject: Re: [PATCH 1/2] meson_sm: Extend meson_sm driver to be compatible
 with gxl chip
References: <20190606132439.25182-1-krzysztof.michonski@digitalstrom.com>
 <CAFBinCDKPTBwhG-PGFoz25iDq5-DfMT3y3b=k1VJ7MFPnwezFA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <3421cf72-62ce-cf24-4163-8896660b7b5c@baylibre.com>
Date: Fri, 14 Jun 2019 11:23:35 +0200
MIME-Version: 1.0
In-Reply-To: <CAFBinCDKPTBwhG-PGFoz25iDq5-DfMT3y3b=k1VJ7MFPnwezFA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Krzysztof Michonski <michonskikrzysztof@gmail.com>
Cc: khilman@baylibre.com, devicetree@vger.kernel.org, afenkart@gmail.com, linux-amlogic@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

On 07/06/2019 22:27, Martin Blumenstingl wrote:
> Hi Krzysztof,
> 
> On Thu, Jun 6, 2019 at 3:24 PM Krzysztof Michonski
> <michonskikrzysztof@gmail.com> wrote:
> [...]
>> +struct meson_sm_chip gxl_chip = {
>> +       .shmem_size             = SZ_4K,
>> +       .cmd_shmem_in_base      = 0x82000023,
>> +       .cmd_shmem_out_base     = 0x82000024,
> where did you get these values from and/or what issues did you see
> with the values from GXBB?
> 
> I checked Amlogic's buildroot kernel whether they are doing something similar:
> $ grep in_base_func
> buildroot-openlinux-A113-201901/kernel/aml-4.9/arch/arm64/boot/dts/amlogic/mesong*.dtsi
> | cut -d':' -f2 | sort -u
>                 in_base_func = <0x82000020>;
> that includes GXL, GXM, G12A and G12B. however, I admit that I didn't
> have time to test your patch yet (so it may be just fine and the
> vendor kernel is buggy)

Same question from me, we've been using the same shmem address on GXL for years now
without any issues, can you elaborate ?

Neil

> 
> 
> Martin
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
