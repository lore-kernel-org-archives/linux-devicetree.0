From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 3/5] ARM: EXYNOS5420: Add IO mapping for non-secure SYSRAM
Date: Mon, 14 Apr 2014 13:47:56 +0200
Message-ID: <11327275.EJLfDGG21r@wuerfel>
References: <1397239311-27717-1-git-send-email-a.kesavan@samsung.com>
 <1397239311-27717-4-git-send-email-a.kesavan@samsung.com>
 <20140414112520.GC3844@e103592.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140414112520.GC3844@e103592.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dave Martin <Dave.Martin@arm.com>
Cc: nicolas.pitre@linaro.org, mark.rutland@arm.com, lorenzo.pieralisi@arm.com, devicetree@vger.kernel.org, abrestic@chromium.org, t.figa@samsung.com, inderpal.s@samsung.com, will.deacon@arm.com, robh+dt@kernel.org, grant.likely@linaro.org, thomas.ab@samsung.com, Abhilash Kesavan <a.kesavan@samsung.com>, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Monday 14 April 2014 12:25:20 Dave Martin wrote:
> On Fri, Apr 11, 2014 at 11:31:49PM +0530, Abhilash Kesavan wrote:
> > On the Exynos5420 non-secure SYSRAM is used for secondary CPU bring-up,
> > so add a mapping for it.
> > 
> > Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> > Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> > ---
> >  arch/arm/mach-exynos/exynos.c           |   11 +++++++++++
> >  arch/arm/mach-exynos/include/mach/map.h |    1 +
> >  2 files changed, 12 insertions(+)
> > 
> > diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
> > index b32a907..b1cf9d5 100644
> > --- a/arch/arm/mach-exynos/exynos.c
> > +++ b/arch/arm/mach-exynos/exynos.c
> > @@ -159,6 +159,15 @@ static struct map_desc exynos5250_iodesc[] __initdata = {
> >       },
> >  };
> >  
> > +static struct map_desc exynos5420_iodesc[] __initdata = {
> > +     {
> > +             .virtual        = (unsigned long)S5P_VA_SYSRAM_NS,
> > +             .pfn            = __phys_to_pfn(EXYNOS5420_PA_SYSRAM_NS),
> > +             .length         = SZ_4K,
> > +             .type           = MT_DEVICE,
> > +     },
> > +};
> > +
> 
> Regarding Arnd's NAK in
> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-April/246936.html,
> this looks like another instance of the same thing.
> 
> Arnd, what was your preferred solution?  Should this be described in DT?

Yes. There are already patches on the list to do this right.

	Arnd
