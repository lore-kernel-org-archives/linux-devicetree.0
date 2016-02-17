From: Han Xu <xhnjupt@gmail.com>
Subject: Re: [PATCH v4 7/7] Documentation: fsl-quadspi: Add optional
 properties
Date: Thu, 18 Feb 2016 01:16:52 +0800
Message-ID: <20160217171652.GH16812@shlinux2>
References: <1453793041-35868-1-git-send-email-yao.yuan@freescale.com>
 <1453793041-35868-7-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453793041-35868-7-git-send-email-yao.yuan@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yuan Yao <yao.yuan@freescale.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, han.xu@freescale.com, robh@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, yao.yuan@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 26, 2016 at 03:24:01PM +0800, Yuan Yao wrote:
> Add optional properties for QSPI:
> big-endian
> if the register is big endian on this platform.
> 
> Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> Changed in v4:
> No changes.
> 
> Changed in v3:
> No changes.
> 
> Changed in v2:
> Update my email to <yao.yuan@nxp.com>
> ---
>  Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> index 0df2f3a..0333ec8 100644
> --- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> @@ -21,6 +21,7 @@ Optional properties:
>  			      But if there are two NOR flashes connected to the
>  			      bus, you should enable this property.
>  			      (Please check the board's schematic.)
> +  - big-endian : That means the IP register is big endian
>  
>  Example:
>  
> -- 
> 2.1.0.27.g96db324
> 
> 
Acked-by: Han xu <han.xu@nxp.com>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
