From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH v3 3/5] ARM: vexpress: Add DT support in v2m
Date: Wed, 30 Nov 2011 18:46:19 +0000
Message-ID: <1322678779.3180.36.camel@hornet.cambridge.arm.com>
References: <1322579473-8804-1-git-send-email-pawel.moll@arm.com>
 <1322579473-8804-4-git-send-email-pawel.moll@arm.com>
 <20111130155800.GF2045@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20111130155800.GF2045@localhost.localdomain>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dave Martin <dave.martin@linaro.org>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2011-11-30 at 15:58 +0000, Dave Martin wrote:
> Now that a person may fail to boot on a supported board simply due to
> failing to supply a device tree, it may be a good idea to have a more
> helpful panic message for that situation, perhaps something like the
> following.
> 
> If you don't think this fits in this series, I can always follow up 
> later.
> 
> diff --git a/arch/arm/mach-vexpress/v2m.c b/arch/arm/mach-vexpress/v2m.c
> index 6965f64..9dda482 100644
> --- a/arch/arm/mach-vexpress/v2m.c
> +++ b/arch/arm/mach-vexpress/v2m.c
> @@ -434,8 +434,11 @@ static void __init v2m_populate_ct_desc(void)
>  			ct_desc = ct_descs[i];
>  
>  	if (!ct_desc)
> -		panic("vexpress: failed to populate core tile description "
> -		      "for tile ID 0x%8x\n", current_tile_id);
> +		panic("vexpress: this kernel does not support core tile ID "
> +		      "0x%08x when booting via ATAGs.\n"
> +		      "You may need a device tree blob or a different kernel "
> +		      "to boot on this board.\n",
> +		      current_tile_id);
>  }
>  
>  static void __init v2m_map_io(void)
> 

No, that's cool with me, will add that. Thanks!

Pawel
