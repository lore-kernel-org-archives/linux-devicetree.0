From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH] dma: of: Move the functions under CONFIG_OF_DMA instead
 of CONFIG_OF
Date: Thu, 27 Feb 2014 19:27:03 -0500
Message-ID: <530FD7D7.9000104@ti.com>
References: <1393546850-13907-1-git-send-email-santosh.shilimkar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1393546850-13907-1-git-send-email-santosh.shilimkar@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, arnd@arndb.de
List-Id: devicetree@vger.kernel.org

On Thursday 27 February 2014 07:20 PM, Santosh Shilimkar wrote:
> The of-dma.c is compiled out with !CONFIG_OF_DMA but the functions in
> the header are kept under CONFIG_OF. Move them under CONFIG_OF_DMA
> to avoid build errors with CONFIG_OFF && !CONFIG_OF_DMA
> 
> Cc: Grant Likely <grant.likely@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
> ---
>  include/linux/of_dma.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/of_dma.h b/include/linux/of_dma.h
> index 0322363..3d2beab 100644
> --- a/include/linux/of_dma.h
> +++ b/include/linux/of_dma.h
> @@ -31,7 +31,7 @@ struct of_dma_filter_info {
>  	dma_filter_fn	filter_fn;
>  };
>  
> -#ifdef CONFIG_OF
> +#ifdef CONFIG_OF_DMA
Sorry.. Typo here.. Should have been CONFIG_DMA_OF

>From 31242461b6ba5e8c0c5ee26e394fa4cab61e3aa1 Mon Sep 17 00:00:00 2001
From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Date: Thu, 27 Feb 2014 19:13:36 -0500
Subject: [PATCH] dma: of: Move the functions under CONFIG_DMA_OF instead of
 CONFIG_OF

The of-dma.c is compiled out with !CONFIG_DMA_OF but the functions in
the header are kept under CONFIG_OF. Move them under CONFIG_OF_DMA
to avoid build errors with CONFIG_OFF && !CONFIG_DMA_OF

Cc: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
---
 include/linux/of_dma.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/of_dma.h b/include/linux/of_dma.h
index 0322363..0ea24f4 100644
--- a/include/linux/of_dma.h
+++ b/include/linux/of_dma.h
@@ -31,7 +31,7 @@ struct of_dma_filter_info {
 	dma_filter_fn	filter_fn;
 };
 
-#ifdef CONFIG_OF
+#ifdef CONFIG_DMA_OF
 extern int of_dma_controller_register(struct device_node *np,
 		struct dma_chan *(*of_dma_xlate)
 		(struct of_phandle_args *, struct of_dma *),
-- 
1.7.9.5
