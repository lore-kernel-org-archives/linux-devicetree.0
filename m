From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/7] ARM: dts: renesas: Add Inter Connect RAM
Date: Mon, 10 Jul 2017 10:45:23 +0200
Message-ID: <CAMuHMdU7KC4X8+kOFUBiBw2ZHs=aukf+_1iR+Gjw2M+RgJ6mBQ@mail.gmail.com>
References: <1499181798-28859-1-git-send-email-geert+renesas@glider.be> <20170710084010.GJ13680@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170710084010.GJ13680@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Simon,

On Mon, Jul 10, 2017 at 10:40 AM, Simon Horman <horms@verge.net.au> wrote:
> On Tue, Jul 04, 2017 at 05:23:11PM +0200, Geert Uytterhoeven wrote:
>> R-Car Gen2 and RZ/G1 SoCs contain two or three blocks of SRAM, which can be
>> used for several purposes.  One such purpose is holding a jump stub for CPU
>> core bringup.
>>
>> This patch series adds the SRAM blocks to the various DTS files, following
>> the generic DT bindings for "mmio-sram" in
>> Documentation/devicetree/bindings/sram/sram.txt.  Reserving SRAM for jump
>> stub for CPU core bringup will be handled in a follow-up series.
>>
>> Thanks!
>
> Geert, these seem nice and clean to me.
> Are they ready to be applied?

I think they are.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
