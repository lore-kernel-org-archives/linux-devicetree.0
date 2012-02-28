From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] ARM: kirkwood: covert orion-spi to fdt.
Date: Tue, 28 Feb 2012 19:22:11 +0000
Message-ID: <201202281922.12084.arnd@arndb.de>
References: <4a9b37f69d6cec5049627b8afa777bb010af05f6.1330381705.git.jason@lakedaemon.net>
 <10078cadd3ab4e8f2a0a642f810be6adbec4d477.1330454040.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <10078cadd3ab4e8f2a0a642f810be6adbec4d477.1330454040.git.jason@lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: grant.likely@secretlab.ca, Andrew Lunn <andrew@lunn.ch>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tuesday 28 February 2012, Jason Cooper wrote:
> On the Globalscale Dreamplug (Marvell Kirkwood Development Platform),
> 2MB of NOR flash are used to hold the bootloader, bootloader
> environment, and devicetree blob.  It is connected via spi.
> 
> diff --git a/arch/arm/mach-kirkwood/common.c b/arch/arm/mach-kirkwood/common.c
> index cc15426..4868dbd 100644
> --- a/arch/arm/mach-kirkwood/common.c
> +++ b/arch/arm/mach-kirkwood/common.c
> @@ -524,6 +526,11 @@ static int __init kirkwood_clock_gate(void)
>  	} else  /* keep this bit set for devices that don't have PCIe1 */
>  		kirkwood_clk_ctrl |= CGC_PEX1;
>  
> +	dp = of_find_node_by_path("/");
> +	if (dp && of_device_is_available(of_find_compatible_node(dp, NULL,
> +							  "marvell,orion-spi")))
> +		kirkwood_clk_ctrl |= CGC_RUNIT;
> +
>  	/* Now gate clock the required units */
>  	writel(kirkwood_clk_ctrl, CLOCK_GATING_CTRL);
>  	printk(KERN_DEBUG " after: 0x%08x\n", readl(CLOCK_GATING_CTRL));

I think this needs to move to the board-dt.c file as Andrew suggested,
or you have to put the #ifdef back, otherwise you get a link error
because of_find_node_by_path does not have a fallback with CONFIG_OF
not set.

Everything else looks good to me now.

	Arnd
