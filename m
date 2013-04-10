From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCHv7 06/17] clk: mvebu: create parent-child relation for PCIe clocks
 on Armada 370
Date: Wed, 10 Apr 2013 01:09:00 -0700
Message-ID: <20130410080900.14359.97128@quantum>
References: <1364395234-11195-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364395234-11195-7-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1364395234-11195-7-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-pci-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Bjorn Helgaas <bhelgaas@google.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Maen Suleiman <maen@marvell.com>, Thierry Reding <thierry.reding@avionic-design.de>, Gregory Clement <gregory.clement@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Olof Johansson <olof@lixom.net>, Tawfik Bayouk <tawfik@marvell.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Mitch Bradley <wmb@firmworks.com>, Andrew Murray <andrew.murray@arm.com>
List-Id: devicetree@vger.kernel.org

Quoting Thomas Petazzoni (2013-03-27 07:40:23)
> The Armada 370 has two gatable clocks for each PCIe interface, and we
> want both of them to be enabled. We therefore make one of the two
> clocks a child of the other, as we did for the sataX and sataXlnk
> clocks on Armada XP.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Mike Turquette <mturquette@linaro.org>

Acked-by: Mike Turquette <mturquette@linaro.org>

> ---
>  drivers/clk/mvebu/clk-gating-ctrl.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/mvebu/clk-gating-ctrl.c b/drivers/clk/mvebu/clk-gating-ctrl.c
> index ebf141d..b35785a 100644
> --- a/drivers/clk/mvebu/clk-gating-ctrl.c
> +++ b/drivers/clk/mvebu/clk-gating-ctrl.c
> @@ -119,8 +119,8 @@ static const struct mvebu_soc_descr __initconst armada_370_gating_descr[] = {
>         { "pex1_en", NULL,  2 },
>         { "ge1", NULL, 3 },
>         { "ge0", NULL, 4 },
> -       { "pex0", NULL, 5 },
> -       { "pex1", NULL, 9 },
> +       { "pex0", "pex0_en", 5 },
> +       { "pex1", "pex1_en", 9 },
>         { "sata0", NULL, 15 },
>         { "sdio", NULL, 17 },
>         { "tdm", NULL, 25 },
> -- 
> 1.7.9.5
