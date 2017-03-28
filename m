From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] of: add stubs for of_n_{addr, size}_cells
Date: Tue, 28 Mar 2017 14:38:19 +0200
Message-ID: <CAK8P3a1qpabP12wzeHmWWJeD=1Z=-NeHEX2-MZvVsoOz-6d+HQ@mail.gmail.com>
References: <20170328093742.21528-1-tobias.regnery@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170328093742.21528-1-tobias.regnery@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tobias Regnery <tobias.regnery@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Simon Horman <horms@verge.net.au>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 28, 2017 at 11:37 AM, Tobias Regnery
<tobias.regnery@gmail.com> wrote:
> With CONFIG_OF=n and CONFIG_COMPILE_TEST=y the rcar pci-e driver fails to
> build on arm:
>
> drivers/pci/host/pcie-rcar.c: In function 'pci_dma_range_parser_init':
> drivers/pci/host/pcie-rcar.c:1035:16: error: implicit declaration of function 'of_n_addr_cells' [-Werror=implicit-function-declaration]
>   parser->pna = of_n_addr_cells(node);
>                 ^~~~~~~~~~~~~~~
>
> Fix this by adding an inline stub for of_n_addr_cells
>
> While at it also provide a stub for of_n_size_cells for consistency reasons.
>
> Signed-off-by: Tobias Regnery <tobias.regnery@gmail.com>
> ---
> Changes in v2:
>         - add a stub for of_n_size_cells as suggested by Arnd

Acked-by: Arnd Bergmann <arnd@arndb.de>
