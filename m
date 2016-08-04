From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/7] MIPS: BMIPS: Add BCM3368 support
Date: Thu, 4 Aug 2016 12:47:19 -0500
Message-ID: <20160804174719.GA24679@rob-hp-laptop>
References: <1470218310-2978-4-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <1470218310-2978-4-git-send-email-noltari@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ralf@linux-mips.org, f.fainelli@gmail.com, jogo@openwrt.org, cernekee@gmail.com, simon@fire.lp0.eu, john@phrozen.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 03, 2016 at 11:58:27AM +0200, Álvaro Fernández Rojas wrote:
> BCM3368 has a shared TLB which conflicts with current SMP support, so it must
> be disabled for now.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  Documentation/devicetree/bindings/mips/brcm/soc.txt | 2 +-
>  arch/mips/bmips/setup.c                             | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.txt b/Documentation/devicetree/bindings/mips/brcm/soc.txt
> index 4a7e030..65bc572 100644
> --- a/Documentation/devicetree/bindings/mips/brcm/soc.txt
> +++ b/Documentation/devicetree/bindings/mips/brcm/soc.txt
> @@ -2,7 +2,7 @@
>  
>  Required properties:
>  
> -- compatible: "brcm,bcm3384", "brcm,bcm33843"
> +- compatible: "brcm,bcm3368", "brcm,bcm3384", "brcm,bcm33843"

No need to respin just for this, but please make this one valid 
combination per line if you respin the series.

Acked-by: Rob Herring <robh@kernel.org>

>                "brcm,bcm3384-viper", "brcm,bcm33843-viper"
>                "brcm,bcm6328", "brcm,bcm6358", "brcm,bcm6368",
>                "brcm,bcm63168", "brcm,bcm63268",
