From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 02/11] of: Make of_dma_get_range() private
Date: Fri, 27 Sep 2019 11:18:47 +0200
Message-ID: <CAMuHMdVmG9NJ3eDWTGbMtzH7+Q0HDOjDR_QoGoGFN4OcQUTbNQ@mail.gmail.com>
References: <20190927002455.13169-1-robh@kernel.org> <20190927002455.13169-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927002455.13169-3-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Robin Murphy <robin.murphy@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Frank Rowand <frowand.list@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Marek Vasut <marek.vasut@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Oza Pawandeep <oza.oza@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 27, 2019 at 2:25 AM Rob Herring <robh@kernel.org> wrote:
> of_dma_get_range() is only used within the DT core code, so remove the
> export and move the header declaration to the private header.
>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
