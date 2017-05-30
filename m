From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 4/4] defconfig: PCI: Enable  Kirin PCIe defconfig
Date: Tue, 30 May 2017 15:31:54 -0500
Message-ID: <20170530203154.GF4664@bhelgaas-glaptop.roam.corp.google.com>
References: <20170526015333.92482-1-songxiaowei@hisilicon.com>
 <20170526015333.92482-5-songxiaowei@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170526015333.92482-5-songxiaowei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Xiaowei Song <songxiaowei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, tn-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org, keith.busch-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, niklas.cassel-VrBV9hrLPhE@public.gmane.org, dhdang-qTEPVZfXA3Y@public.gmane.org, liudongdong3-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, chenyao11-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suzhuangluan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Subject line:

  arm64: defconfig: Enable Kirin PCIe

(Hint: run "git log --oneline <file>" to see what pattern you should
follow)

On Fri, May 26, 2017 at 09:53:33AM +0800, Xiaowei Song wrote:
> Cc: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Xiaowei Song <songxiaowei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 7c48028ec64a..d56d8f1062ab 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -71,6 +71,7 @@ CONFIG_PCI_XGENE=y
>  CONFIG_PCI_LAYERSCAPE=y
>  CONFIG_PCI_HISI=y
>  CONFIG_PCIE_QCOM=y
> +CONFIG_PCIE_KIRIN=y
>  CONFIG_PCIE_ARMADA_8K=y
>  CONFIG_ARM64_VA_BITS_48=y
>  CONFIG_SCHED_MC=y
> -- 
> 2.11.GIT
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
