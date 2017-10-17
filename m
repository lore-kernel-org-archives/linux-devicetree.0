From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: rockchip: fix typo in iommu nodes
Date: Tue, 17 Oct 2017 19:52:55 +0200
Message-ID: <35096146.J7tq43JfW1@phil>
References: <20171010085648.1339605-1-arnd@arndb.de> <4123717.0VmPnCpUOn@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4123717.0VmPnCpUOn@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Sugar Zhang <sugar.zhang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rocky Hao <rocky.hao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Liang Chen <cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Simon Xue <xxm-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 10. Oktober 2017, 11:48:25 CEST schrieb Heiko Stübner:
> Hi Arnd,
> 
> Am Dienstag, 10. Oktober 2017, 10:56:01 CEST schrieb Arnd Bergmann:
> > The latest dtc warns about an extraneous cell in the interrupt
> > property of two of the iommu device nodes:
> > 
> > Warning (interrupts_property): interrupts size is (16), expected multiple of
> > 12 in /iommu@ff373f00 Warning (interrupts_property): interrupts size is
> > (16), expected multiple of 12 in /iommu@ff900800
> > 
> > This removes the typo.
> > 
> > Fixes: cede4c79de28 ("arm64: dts: rockchip: add rk3368 iommu nodes")
> > Fixes: 49c82f2b7c5d ("arm64: dts: rockchip: add rk3328 iommu nodes")
> > Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> 
> looks like that got copy-pasted from rk3399 where we have 4 elements per irq.
> In any case the change looks good, so if you want to apply it directly to 
> armsoc-fixes here is a
> 
> Acked-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> 
> Depending on how you want to handle it I can also merge it, but
> Olof already picked up my 2 fixes for 4.14, so you applying it might
> save us the round-trip for a further 1-patch pull request :-)

as another (somewhat urgent) fix for 64bit dts has come up, I've now also
picked this change up for the following pull request.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
