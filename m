From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH 2/5] arm: mvebu: Select DMA_BOUNCE when LPAE is selected
 in Kconfig
Date: Thu, 21 Mar 2013 13:19:43 -0500
Message-ID: <514B4F3F.8000308@gmail.com>
References: <1363883179-1361-1-git-send-email-gregory.clement@free-electrons.com> <1363883179-1361-3-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363883179-1361-3-git-send-email-gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Lior Amsalem <alior@marvell.com>, Ike Pan <ike.pan@canonical.com>, David Marlin <dmarlin@redhat.com>, Yehuda Yitschak <yehuday@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>, Leif Lindholm <leif.lindholm@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jon Masters <jcm@redhat.com>, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org, Chris Van Hoof <vanhoof@canonical.com>, linux-kernel@vger.kernel.org, Maen Suleiman <maen@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Shadi Ammouri <shadi@marvell.com>
List-Id: devicetree@vger.kernel.org

On 03/21/2013 11:26 AM, Gregory CLEMENT wrote:
> From: Lior Amsalem <alior@marvell.com>
> 
> For mvebu IOs are 32 bits and we have 40 bits memory due to LPAE so
> make sure we give 32 bits addresses to the IOs.
> 
> Signed-off-by: Lior Amsalem <alior@marvell.com>
> Tested-by: Franklin <flin@marvell.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---
>  arch/arm/mach-mvebu/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-mvebu/Kconfig b/arch/arm/mach-mvebu/Kconfig
> index 440b13e..617da94 100644
> --- a/arch/arm/mach-mvebu/Kconfig
> +++ b/arch/arm/mach-mvebu/Kconfig
> @@ -13,6 +13,7 @@ config ARCH_MVEBU
>  	select MVEBU_CLK_CORE
>  	select MVEBU_CLK_CPU
>  	select MVEBU_CLK_GATING
> +	select DMABOUNCE if ARM_LPAE

This alone is not enough to use bounce buffers. Am I missing something?

Rob

>  
>  if ARCH_MVEBU
>  
> 
