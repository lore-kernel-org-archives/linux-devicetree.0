Return-Path: <SRS0=Of4m=MW=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com> <575ebd1f-165a-756f-f76a-14a11bba7f19@cogentembedded.com>
In-Reply-To: <575ebd1f-165a-756f-f76a-14a11bba7f19@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Oct 2018 09:12:54 +0200
Message-ID: <CAMuHMdW4JNYiDqwo9ZQbsrxCpXaoJzs8a1L3eNnfhVqgozRNaw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a77970: add thermal support
Content-Type: text/plain; charset="UTF-8"
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Oct 9, 2018 at 9:50 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Describe THS/CIVM in the R8A77970 device tree.
>
> Based on the original (and large) patches by Vladimir Barinov.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
> This patch is against the 'renesas-devel-20181004-v4.19-rc6' tag of Simon
> Horman's 'renesas.git' repo.
>
> Changed in version 2:
> - fix the "reg" prop in the thermal device node;
> - fixed wrong plural in the patch description.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
