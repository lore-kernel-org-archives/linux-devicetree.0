From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: dts: renesas: Add /soc dma-ranges
Date: Mon, 9 Sep 2019 10:19:21 +0200
Message-ID: <CAMuHMdXkExZXeXnxuKkMC0J4m56cZUmJpcq2JCXuMv3PBzA0Dg@mail.gmail.com>
References: <20190907161634.27378-1-marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190907161634.27378-1-marek.vasut@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa@the-dreams.de>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Marek,

On Sat, Sep 7, 2019 at 6:16 PM <marek.vasut@gmail.com> wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> Add dma-ranges property into /soc node to describe the DMA capabilities
> of the bus. This is currently needed to translate PCI DMA ranges, which
> are limited to 32bit addresses.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Thanks for your patch!

> NOTE: This is needed for the following patches to work correctly:
>       https://patchwork.ozlabs.org/patch/1144870/
>       https://patchwork.ozlabs.org/patch/1144871/

What happens with the above patches applied, and without this one?

As PCI/OF driver patches go in through different trees, is it safe to apply
this patch now?
Should they go in together?

>  arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 1 +
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 1 +
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1 +

Do we need similar patches for the other R-Car Gen3 and RZ/G2 DTS files?
What about R-Car Gen2 and RZ/G1?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
