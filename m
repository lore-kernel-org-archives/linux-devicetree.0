From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH v2] powerpc/rcpm: add RCPM driver
Date: Fri, 12 Jun 2015 10:57:42 +0200
Message-ID: <1434099462.2271.149.camel@x220>
References: <1434004357-2294-1-git-send-email-Yuantian.Tang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434004357-2294-1-git-send-email-Yuantian.Tang@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yuantian.Tang@freescale.com
Cc: b07421@freescale.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Chenhui Zhao <chenhui.zhao@freescale.com>
List-Id: devicetree@vger.kernel.org

Just a nit.

On Thu, 2015-06-11 at 14:32 +0800, Yuantian.Tang@freescale.com wrote:
> --- /dev/null
> +++ b/arch/powerpc/sysdev/fsl_rcpm.c

> +int fsl_rcpm_init(void)

This is used only through early_initcall(). I took the cargo cult
approach of looking at the other uses of early_initcall() in
arch/powerpc/. That approach tells me this function could be static and
marked as __init. Would that work here too?

> +{
> +	[...]
> +}
> +
> +/* need to call this before SMP init */
> +early_initcall(fsl_rcpm_init);

Thanks,

Paul Bolle
