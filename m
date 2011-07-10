From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] ARM: mmp: remove builtin gpio driver support
Date: Sun, 10 Jul 2011 13:02:18 +0900
Message-ID: <20110710040218.GA10912@ponder.secretlab.ca>
References: <1310120428-22700-1-git-send-email-haojian.zhuang@marvell.com>
	<1310120428-22700-2-git-send-email-haojian.zhuang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1310120428-22700-2-git-send-email-haojian.zhuang@marvell.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Haojian Zhuang <haojian.zhuang@marvell.com>
Cc: eric.y.miao@gmail.com, nico@fluxnic.net, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, haojian.zhuang@gmail.com, samuel.ortiz@intel.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, alan@linux.intel.com
List-Id: devicetree@vger.kernel.org

On Fri, Jul 08, 2011 at 06:20:18PM +0800, Haojian Zhuang wrote:
> Remove builtin gpio driver support form mmp.
> 
> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>

Hi Haojian.

I'm not clear what this patch is intending to do.  I understand that
it removes the mmp-specific gpio support, but I looks like don't see the code
that replaces it, which would mean that applying this patch breaks
gpio on mmp platforms.

Am I missing something?

> diff --git a/arch/arm/plat-pxa/Makefile b/arch/arm/plat-pxa/Makefile
> index 3aca5ba..8e432b1 100644
> --- a/arch/arm/plat-pxa/Makefile
> +++ b/arch/arm/plat-pxa/Makefile
> @@ -4,7 +4,9 @@
>  
>  obj-y	:= dma.o
>  
> +ifeq ($(CONFIG_OF),)
>  obj-$(CONFIG_GENERIC_GPIO)	+= gpio.o
> +endif

Be careful about this.  Turning on device tree support must not
disable booting on non-DT machines.

g.
