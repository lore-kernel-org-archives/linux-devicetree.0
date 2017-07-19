From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] dma: Convert to using %pOF instead of full_name
Date: Wed, 19 Jul 2017 11:20:08 +0200
Message-ID: <CAMuHMdX3jMgEqvysexU3p-ZNufvhzNXgyJ2rZD9HTrGQhCS75w@mail.gmail.com>
References: <20170718214339.7774-18-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170718214339.7774-18-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vinod.koul@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 18, 2017 at 11:42 PM, Rob Herring <robh@kernel.org> wrote:
> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
