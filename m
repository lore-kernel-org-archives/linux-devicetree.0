From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 08/11] of: Factor out #{addr,size}-cells parsing
Date: Fri, 27 Sep 2019 11:27:41 +0200
Message-ID: <CAMuHMdVOJt9b4FQpKOytgA-GV3PUECZ7-GkwR=ma8w8P9RKJww@mail.gmail.com>
References: <20190927002455.13169-1-robh@kernel.org> <20190927002455.13169-9-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927002455.13169-9-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Robin Murphy <robin.murphy@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Frank Rowand <frowand.list@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Marek Vasut <marek.vasut@gmail.com>, Simon Horman <horms+renesas@verge.net.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2019 at 2:25 AM Rob Herring <robh@kernel.org> wrote:
> From: Robin Murphy <robin.murphy@arm.com>
>
> In some cases such as PCI host controllers, we may have a "parent bus"
> which is an OF leaf node, but still need to correctly parse ranges from
> the point of view of that bus. For that, factor out variants of the
> "#addr-cells" and "#size-cells" parsers which do not assume they have a
> device node and thus immediately traverse upwards before reading the
> relevant property.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> [robh: don't make of_bus_n_{addr,size}_cells() public]
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
