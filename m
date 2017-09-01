From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/3] of/pci: Add dma-ranges parsing support
Date: Fri, 1 Sep 2017 13:27:13 -0500
Message-ID: <CAL_JsqJjNMKLk56CB2i57URYB_9wjuO4opod9xXztmr+MaJnvQ@mail.gmail.com>
References: <f10055cc-4430-ff30-f892-3d3d6f24354c@sigmadesigns.com> <0d4313c7-6595-a7fb-680a-e231dc9c0902@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <0d4313c7-6595-a7fb-680a-e231dc9c0902@sigmadesigns.com>
Sender: linux-pci-owner@vger.kernel.org
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, DT <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Mason <slash.tmp@free.fr>, Marc Zyngier <marc.zyngier@arm.com>, linux-pci <linux-pci@vger.kernel.org>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>, Andrew Murray <amurray@embedded-bits.co.uk>, Liviu Dudau <liviu.dudau@arm.com>, Bjorn Helgaas <helgaas@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 29, 2017 at 9:25 AM, Marc Gonzalez
<marc_gonzalez@sigmadesigns.com> wrote:
> Several host bridge drivers duplicate of_pci_range_parser_init()
> in order to parse their dma-ranges property.
>
> Provide of_pci_dma_range_parser_init() for that use-case.
>
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> ---
>  drivers/of/address.c       | 19 ++++++++++++++++---
>  include/linux/of_address.h | 10 +++++++++-
>  2 files changed, 25 insertions(+), 4 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

I'm assuming this will go thru the PCI tree.

Rob
