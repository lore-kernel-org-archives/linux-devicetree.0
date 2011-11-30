From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/5] ARM: vexpress: Add DT support in v2m
Date: Wed, 30 Nov 2011 15:58:00 +0000
Message-ID: <20111130155800.GF2045@localhost.localdomain>
References: <1322579473-8804-1-git-send-email-pawel.moll@arm.com>
 <1322579473-8804-4-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1322579473-8804-4-git-send-email-pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 29, 2011 at 03:11:11PM +0000, Pawel Moll wrote:
> This patch provides hooks for DT-based tile machine implementations
> and adds Device Tree description for the motherboard.

[...]

> +config ARCH_VEXPRESS_DT
> +	bool
> +	select OF
> +	help
> +	  VE platform *requiring* Flattened Device Tree to boot.
> +

Now that a person may fail to boot on a supported board simply due to
failing to supply a device tree, it may be a good idea to have a more
helpful panic message for that situation, perhaps something like the
following.

If you don't think this fits in this series, I can always follow up 
later.

Cheers
---Dave


diff --git a/arch/arm/mach-vexpress/v2m.c b/arch/arm/mach-vexpress/v2m.c
index 6965f64..9dda482 100644
--- a/arch/arm/mach-vexpress/v2m.c
+++ b/arch/arm/mach-vexpress/v2m.c
@@ -434,8 +434,11 @@ static void __init v2m_populate_ct_desc(void)
 			ct_desc = ct_descs[i];
 
 	if (!ct_desc)
-		panic("vexpress: failed to populate core tile description "
-		      "for tile ID 0x%8x\n", current_tile_id);
+		panic("vexpress: this kernel does not support core tile ID "
+		      "0x%08x when booting via ATAGs.\n"
+		      "You may need a device tree blob or a different kernel "
+		      "to boot on this board.\n",
+		      current_tile_id);
 }
 
 static void __init v2m_map_io(void)
