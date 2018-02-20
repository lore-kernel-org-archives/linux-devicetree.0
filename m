Return-Path: <SRS0=RDbo=FO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-qt0-f169.google.com ([209.85.216.169]:43728 "EHLO
        mail-qt0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751553AbeBTKul (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 20 Feb 2018 05:50:41 -0500
MIME-Version: 1.0
In-Reply-To: <1519117393-31302-1-git-send-email-geert+renesas@glider.be>
References: <1519117393-31302-1-git-send-email-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2018 11:50:40 +0100
Message-ID: <CAMuHMdWa5RgkGCAucN5ykGRW=FdHUZw=+t5jMAsKhdixMUSQzQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: dw_mmc-k3: Fix out-of-bounds access through DT alias
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, Linux MMC List <linux-mmc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Feb 20, 2018 at 10:03 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The hs_timing_cfg[] array is indexed using a value derived from the
> "mshcN" alias in DT, which may lead to an out-of-bounds access.
>
> Fix this by adding a range check.
>
> Fixes: 7d92895208a008a2 ("mmc: dw_mmc-k3: Fix out-of-bounds access through DT alias")

Oops

Fixes: 361c7fe9b02eee7e ("mmc: dw_mmc-k3: add sd support for hi3660")

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
