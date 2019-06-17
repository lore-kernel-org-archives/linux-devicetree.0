Return-Path: <SRS0=7yb5=UQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-io1-f68.google.com ([209.85.166.68]:40792 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727039AbfFQI3F (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 17 Jun 2019 04:29:05 -0400
Received: by mail-io1-f68.google.com with SMTP id n5so19293295ioc.7
        for <devicetree@vger.kernel.org>; Mon, 17 Jun 2019 01:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190606132439.25182-1-krzysztof.michonski@digitalstrom.com>
 <CAFBinCDKPTBwhG-PGFoz25iDq5-DfMT3y3b=k1VJ7MFPnwezFA@mail.gmail.com> <3421cf72-62ce-cf24-4163-8896660b7b5c@baylibre.com>
In-Reply-To: <3421cf72-62ce-cf24-4163-8896660b7b5c@baylibre.com>
From: =?UTF-8?Q?Krzysztof_Micho=C5=84ski?= <michonskikrzysztof@gmail.com>
Date: Mon, 17 Jun 2019 10:28:53 +0200
Message-ID: <CAOiNxGBs03Z9O0FV7RZ1KumZx48djNb21=Zhk-e9N4GHJ4z0uw@mail.gmail.com>
Subject: Re: [PATCH 1/2] meson_sm: Extend meson_sm driver to be compatible
 with gxl chip
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com, devicetree@vger.kernel.org, afenkart@gmail.com, linux-amlogic@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

Hi,
a word of explanation from me. The reason why I thought the addresses
differ is I've had wrong understanding of the shared storage and
shared memory. Due to a problem we've faced we were made to read from
the secure storage and as you can see the secure monitor driver after
altering the shmem_in/out addresses can be used map shared storage.
This patches then are incorrect.

Krzysztof Micho=C5=84ski
