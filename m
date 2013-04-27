From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: Re: [PATCH -next] xen/arm: remove duplicated include from
 enlighten.c
Date: Sat, 27 Apr 2013 15:35:39 +0100
Message-ID: <alpine.DEB.2.02.1304271535210.4180@kaball.uk.xensource.com>
References: <CAPgLHd95AtzEDXUMHryWmmVAkBfkh42hgeLKdSLFYwkO_JB-ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPgLHd95AtzEDXUMHryWmmVAkBfkh42hgeLKdSLFYwkO_JB-ZA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Stefano Stabellini <Stefano.Stabellini@eu.citrix.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "yongjun_wei@trendmicro.com.cn" <yongjun_wei@trendmicro.com.cn>, "xen-devel@lists.xensource.com" <xen-devel@lists.xensource.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, 27 Apr 2013, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Remove duplicated include.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>


>  arch/arm/xen/enlighten.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> index 9a0a917..d30042e 100644
> --- a/arch/arm/xen/enlighten.c
> +++ b/arch/arm/xen/enlighten.c
> @@ -10,7 +10,6 @@
>  #include <xen/platform_pci.h>
>  #include <xen/xenbus.h>
>  #include <xen/page.h>
> -#include <xen/xen.h>
>  #include <xen/interface/sched.h>
>  #include <xen/xen-ops.h>
>  #include <asm/xen/hypervisor.h>
> 
