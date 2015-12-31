From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/4] soc: mediatek: Init MT8173 scpsys driver earlier
Date: Thu, 31 Dec 2015 15:45:22 +0100
Message-ID: <4141203.8f3N9nOLLy@wuerfel>
References: <1451457706-14798-1-git-send-email-jamesjj.liao@mediatek.com> <1451541566.10610.10.camel@mtksdaap41> <1451553394.10610.14.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1451553394.10610.14.camel@mtksdaap41>
Sender: linux-kernel-owner@vger.kernel.org
To: James Liao <jamesjj.liao@mediatek.com>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com, Kevin Hilman <khilman@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thursday 31 December 2015 17:16:34 James Liao wrote:
> 
> """
> Take a example for our IOMMU(M4U) and SMI.  The IOMMU which is
> subsys_init defaultly will depend on SMI. 
> The SMI is a bridge between m4u and the Multimedia HW.  About the HW
> block diagram and more other information please help check  [1].
> SMI is responsible to enable/disable iommu and help transfer data for
> each Multimedia HW,  Both have to wait until the power and the clocks is
> enabled.  
> 
> So our iommu should probe done after smi, smi should be after
> power-domain, and all the iommu consumer(display/vdec/venc/camera etc.)
> should be after the iommu.
> Then all the multimedia module will be delayed by power-domain who is
> module_init currently.
> 
> After grep, we get some example whose  pm is not module_init:
> core_initcall(exynos4_pm_init_power_domain);
> subsys_initcall(imx_pgc_init);
> 
> So we expect move the power-domain initial more earlier too.  The
> power-domain seems to be a basic module like ccf.
> Is there some special reason about we should use module_init,  or do you
> have any concern if we change it?
> Thanks.

Ok, got it. Generally, we should try to avoid using the earlier initcall
levels, but a few things like clock controllers, iommus etc are special
enough that we need to make sure their dependencies are there by the
time those are probed.

Please put your explanation above into the patch changelog and add a code
comment about the IOMMU next to the subsys_initcall() so it doesn't
accidentally get changed when someone tries to do a code cleanup.

	Arnd
