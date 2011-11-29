From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 2/5] ARM: vexpress: Get rid of MMIO_P2V
Date: Tue, 29 Nov 2011 21:15:10 +0000
Message-ID: <201111292115.10833.arnd@arndb.de>
References: <1322579473-8804-1-git-send-email-pawel.moll@arm.com>
 <1322579473-8804-3-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1322579473-8804-3-git-send-email-pawel.moll@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, Pawel Moll <pawel.moll@arm.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 29 November 2011, Pawel Moll wrote:
> @@ -1,6 +1,3 @@
> -#define __MMIO_P2V(x)  (((x) & 0xfffff) | (((x) & 0x0f000000) >> 4) | 0xf8000000)
> -#define MMIO_P2V(x)    ((void __iomem *)__MMIO_P2V(x))
> -
...
> +
> +/* 2MB large area for motherboard's peripherals static mapping */
> +#define V2M_PERIPH 0xf8000000
> +#define V2M_PERIPH_P2V(offset) ((void __iomem *)(V2M_PERIPH | (offset)))
> +
> +/* Tile's peripherals static mappings should start here */
> +#define V2T_PERIPH 0xf8200000
> +#define V2T_PERIPH_P2V(offset) ((void __iomem *)(V2T_PERIPH | (offset)))

I think it would be even better if you could express the same with
pointer arithmetic instead of the macro, like:

#define V2M_PERIPH ((void __iomem *)0xf8000000)
#define V2T_PERIPH ((void __iomem *)0xf8200000)

and then instead of 

+       gic_init(0, 29, V2T_PERIPH_P2V(A9_MPCORE_GIC_DIST),
+                V2T_PERIPH_P2V(A9_MPCORE_GIC_CPU));

do 

+       gic_init(0, 29, V2T_PERIPH + A9_MPCORE_GIC_DIST,
+                V2T_PERIPH + A9_MPCORE_GIC_CPU);

and so on. This ends up being more readable IMHO because it
means you don't have to know what the macro does.

	Arnd
