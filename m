From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCHv7 06/17] clk: mvebu: create parent-child relation for
 PCIe clocks on Armada 370
Date: Fri, 5 Apr 2013 15:58:33 +0200
Message-ID: <20130405155833.6e6a4b75@skate>
References: <1364395234-11195-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364395234-11195-7-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1364395234-11195-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Russell King <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Maen Suleiman <maen@marvell.com>, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Thierry Reding <thierry.reding@avionic-design.de>, Grant Likely <grant.likely@secretlab.ca>, Olof Johansson <olof@lixom.net>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Gregory Clement <gregory.clement@free-electrons.com>, Tawfik Bayouk <tawfik@marvell.com>, Mitch Bradley <wmb@firmworks.com>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
List-Id: devicetree@vger.kernel.org

Mike,

Could we have your opinion on this patch, and possibly a Acked-by to
pass it through arm-soc?

Thanks!

Thomas

On Wed, 27 Mar 2013 15:40:23 +0100, Thomas Petazzoni wrote:
> The Armada 370 has two gatable clocks for each PCIe interface, and we
> want both of them to be enabled. We therefore make one of the two
> clocks a child of the other, as we did for the sataX and sataXlnk
> clocks on Armada XP.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Mike Turquette <mturquette@linaro.org>
> ---
>  drivers/clk/mvebu/clk-gating-ctrl.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/mvebu/clk-gating-ctrl.c b/drivers/clk/mvebu/clk-gating-ctrl.c
> index ebf141d..b35785a 100644
> --- a/drivers/clk/mvebu/clk-gating-ctrl.c
> +++ b/drivers/clk/mvebu/clk-gating-ctrl.c
> @@ -119,8 +119,8 @@ static const struct mvebu_soc_descr __initconst armada_370_gating_descr[] = {
>  	{ "pex1_en", NULL,  2 },
>  	{ "ge1", NULL, 3 },
>  	{ "ge0", NULL, 4 },
> -	{ "pex0", NULL, 5 },
> -	{ "pex1", NULL, 9 },
> +	{ "pex0", "pex0_en", 5 },
> +	{ "pex1", "pex1_en", 9 },
>  	{ "sata0", NULL, 15 },
>  	{ "sdio", NULL, 17 },
>  	{ "tdm", NULL, 25 },



-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
