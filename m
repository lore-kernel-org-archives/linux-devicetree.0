From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] clk/mpc85xx: Update the compatible string
Date: Thu, 30 May 2013 11:57:32 -0700
Message-ID: <20130530185732.4470.91176@quantum>
References: <1369210939-25087-1-git-send-email-Yuantian.Tang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1369210939-25087-1-git-send-email-Yuantian.Tang@freescale.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Cc: Tang Yuantian <Yuantian.Tang@freescale.com>, devicetree-discuss@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Quoting Yuantian.Tang@freescale.com (2013-05-22 01:22:19)
> From: Tang Yuantian <yuantian.tang@freescale.com>
> 
> The compatible string of clock is changed from *-2 to *-2.0
> on chassis 2. So updated it accordingly.
> 
> Signed-off-by: Tang Yuantian <Yuantian.Tang@freescale.com>

Taken into clk-next.

Regards,
Mike

> ---
>  drivers/clk/clk-ppc-corenet.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/clk-ppc-corenet.c b/drivers/clk/clk-ppc-corenet.c
> index a2d483f..e958707 100644
> --- a/drivers/clk/clk-ppc-corenet.c
> +++ b/drivers/clk/clk-ppc-corenet.c
> @@ -260,7 +260,7 @@ static int __init ppc_corenet_clk_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id ppc_clk_ids[] __initconst = {
>         { .compatible = "fsl,qoriq-clockgen-1.0", },
> -       { .compatible = "fsl,qoriq-clockgen-2", },
> +       { .compatible = "fsl,qoriq-clockgen-2.0", },
>         {}
>  };
>  
> -- 
> 1.8.0
