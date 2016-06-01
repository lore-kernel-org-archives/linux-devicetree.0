From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 11/13] DT: arm: shmobile: document Blanche board
Date: Wed, 1 Jun 2016 10:19:19 +0200
Message-ID: <CAMuHMdWLRD4=--Gs1Qmn5mfDw_sNrHOefyj2_C2Ds1us9ip7NQ@mail.gmail.com>
References: <13205049.n7pM8utpHF@wasted.cogentembedded.com>
	<52321184.HGKDRaDOBe@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <52321184.HGKDRaDOBe@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 1, 2016 at 12:30 AM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Document the Blanche device tree bindings, listing it as a supported board.
>
> This allows to use checkpatch.pl to validate .dts files referring to the
> Blanche board.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

I can't verify the correctness of the board product ID, though.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
