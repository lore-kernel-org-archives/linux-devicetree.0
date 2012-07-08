From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 06/36] fdt: Add generic dt_memblock_reserve() function
Date: Sun, 8 Jul 2012 10:43:35 +0100
Message-ID: <20120708094335.GD3845@arm.com>
References: <1341608777-12982-1-git-send-email-catalin.marinas@arm.com>
 <1341608777-12982-7-git-send-email-catalin.marinas@arm.com>
 <4FF8A78E.5090709@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4FF8A78E.5090709@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Grant Likely <grant.likely@secretlab.ca>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 07, 2012 at 10:18:06PM +0100, Rob Herring wrote:
> On 07/06/2012 04:05 PM, Catalin Marinas wrote:
> > This function reserves initial_boot_params total size and reserve map.
> > 
> > Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Grant Likely <grant.likely@secretlab.ca>
> 
> If you had run get_maintainers.pl you would have copied all the
> maintainers and the appropriate list (devicetree-discuss) for this patch.

You are right. As I replied to Alan, those patches which are not
strictly arch/aarch64 will be pushed separately and asking the
corresponding maintainers for acked-by. I just posted them here to show
the context. The reason I cc'ed Grant was because I discussed this with
him during Linaro Connect.

> This is hardly generic if you aren't using it anywhere but on a new
> arch. Presumably, you can remove the arm 32-bit version, but its still
> to be debated whether 32-bit and 64-bit ARM will remain separate.
> 
> It does appear that only ARM and powerpc currently handle reserve map,
> so the other DT enabled platforms will need to have something similar here.

I know for sure that arch/arm/ uses it and it is not ARM-specific code,
so other architectures could benefit. We'll discuss this when posting
the patch separately on devicetree-discuss.

Thanks.

-- 
Catalin
