From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 2/2] ARM: shmobile: r8a7794: add GPIO DT support
Date: Mon, 10 Aug 2015 15:23:54 +0200
Message-ID: <CAMuHMdVj4_h8LX=XuWSyhGpSZ2BPxuWe_oJQYTRPFfYbuidm4g@mail.gmail.com>
References: <2265315.MpjeDzrVz2@wasted.cogentembedded.com>
	<10288801.ZnYt2TD47O@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <10288801.ZnYt2TD47O@wasted.cogentembedded.com>
Sender: linux-sh-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Linux-sh list <linux-sh@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Sun, Aug 9, 2015 at 12:09 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Describe GPIO[0-6] controllers in the R8A7794 device tree.
>
> Based on original patch by Hisashi Nakamura <hisashi.nakamura.ak@renesas.com>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> ---
> Changes in version 3:
> - added "power-domains" property to the GPIO device nodes.

Thanks, unwithdrawing my ack ;-)

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
