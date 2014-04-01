From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: Re: [PATCH 2/2] arm: socfpga: Add support for Altera SoC SDRAM
 controller
Date: Tue, 1 Apr 2014 07:33:43 +0200
Message-ID: <20140401053343.GO5052@pengutronix.de>
References: <1396303627-29198-1-git-send-email-tthayer@altera.com>
 <1396303627-29198-3-git-send-email-tthayer@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1396303627-29198-3-git-send-email-tthayer@altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: tthayer@altera.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, linux-doc@vger.kernel.org, devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org, rob@landley.net, galak@codeaurora.org, dinguyen@altera.com
List-Id: devicetree@vger.kernel.org

On Mon, Mar 31, 2014 at 05:07:07PM -0500, tthayer@altera.com wrote:
> From: Thor Thayer <tthayer@altera.com>
> 
> Addition of the Altera SDRAM controller registers to the
> Altera SoC project. These registers are shared by future
> drivers such as ECC and the FPGA bridge.
> 
> Signed-off-by: Thor Thayer <tthayer@altera.com>
> To: Rob Herring <rob.herring@calxeda.com>
> To: Pawel Moll <pawel.moll@arm.com>
> To: Mark Rutland <mark.rutland@arm.com>
> To: Ian Campbell <ijc+devicetree@hellion.org.uk>
> To: Kumar Gala <galak@codeaurora.org>
> To: Rob Landley <rob@landley.net>
> To: Russell King <linux@arm.linux.org.uk>
> To: Dinh Nguyen <dinguyen@altera.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm/mach-socfpga/socfpga.c |   10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/mach-socfpga/socfpga.c b/arch/arm/mach-socfpga/socfpga.c
> index 21d6026..d514e8a 100644
> --- a/arch/arm/mach-socfpga/socfpga.c
> +++ b/arch/arm/mach-socfpga/socfpga.c
> @@ -32,6 +32,7 @@
>  void __iomem *socfpga_scu_base_addr = ((void __iomem *)(SOCFPGA_SCU_VIRT_BASE));
>  void __iomem *sys_manager_base_addr;
>  void __iomem *rst_manager_base_addr;
> +void __iomem *sdr_ctl_base_addr;
>  void __iomem *clk_mgr_base_addr;
>  unsigned long cpu1start_addr;
>  

Can't we get rid of all these global pointers instead of adding to them?

> @@ -150,6 +151,15 @@ void __init socfpga_sysmgr_init(void)
>  
>  	np = of_find_compatible_node(NULL, NULL, "altr,clk-mgr");
>  	clk_mgr_base_addr = of_iomap(np, 0);
> +
> +	np = of_find_compatible_node(NULL, NULL, "altr,sdr-ctl");
> +	if (!np) {
> +		pr_err("SOCFPGA: Unable to find sdr-ctl\n");
> +		return;
> +	}
> +
> +	sdr_ctl_base_addr = of_iomap(np, 0);
> +	WARN_ON(!sdr_ctl_base_addr);
>  }
>  
>  static void __init socfpga_init_irq(void)
> -- 
> 1.7.9.5
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
