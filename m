From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/4] soc: mediatek: Init MT8173 scpsys driver earlier
Date: Mon, 4 Jan 2016 10:52:51 +0800
Message-ID: <1451875971.14940.1.camel@mtksdaap41>
References: <1451457706-14798-1-git-send-email-jamesjj.liao@mediatek.com>
 <1451541566.10610.10.camel@mtksdaap41>
 <1451553394.10610.14.camel@mtksdaap41> <4141203.8f3N9nOLLy@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <4141203.8f3N9nOLLy@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Thu, 2015-12-31 at 15:45 +0100, Arnd Bergmann wrote:
> On Thursday 31 December 2015 17:16:34 James Liao wrote:
> > 
> > """
> > Take a example for our IOMMU(M4U) and SMI.  The IOMMU which is
> > subsys_init defaultly will depend on SMI. 
> > The SMI is a bridge between m4u and the Multimedia HW.  About the HW
> > block diagram and more other information please help check  [1].
> > SMI is responsible to enable/disable iommu and help transfer data for
> > each Multimedia HW,  Both have to wait until the power and the clocks is
> > enabled.  
> > 
> > So our iommu should probe done after smi, smi should be after
> > power-domain, and all the iommu consumer(display/vdec/venc/camera etc.)
> > should be after the iommu.
> > Then all the multimedia module will be delayed by power-domain who is
> > module_init currently.
> > 
> > After grep, we get some example whose  pm is not module_init:
> > core_initcall(exynos4_pm_init_power_domain);
> > subsys_initcall(imx_pgc_init);
> > 
> > So we expect move the power-domain initial more earlier too.  The
> > power-domain seems to be a basic module like ccf.
> > Is there some special reason about we should use module_init,  or do you
> > have any concern if we change it?
> > Thanks.
> 
> Ok, got it. Generally, we should try to avoid using the earlier initcall
> levels, but a few things like clock controllers, iommus etc are special
> enough that we need to make sure their dependencies are there by the
> time those are probed.
> 
> Please put your explanation above into the patch changelog and add a code
> comment about the IOMMU next to the subsys_initcall() so it doesn't
> accidentally get changed when someone tries to do a code cleanup.

OK, I'll add comments in next patch. Thanks for your comments.


Best regards,

James
