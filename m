From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v5] powerpc/rcpm: add RCPM driver
Date: Fri, 31 Jul 2015 19:45:06 -0500
Message-ID: <1438389906.19345.101.camel@freescale.com>
References: <1435304656-34505-1-git-send-email-Yuantian.Tang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435304656-34505-1-git-send-email-Yuantian.Tang@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yuantian.Tang@freescale.com
Cc: b07421@freescale.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Chenhui Zhao <chenhui.zhao@freescale.com>
List-Id: devicetree@vger.kernel.org

On Fri, 2015-06-26 at 15:44 +0800, Yuantian.Tang@freescale.com wrote:
> +static void rcpm_v1_set_ip_power(bool enable, u32 *mask)
> +{
> +     if (enable)
> +             setbits32(&rcpm_v1_regs->ippdexpcr, *mask);
> +     else
> +             clrbits32(&rcpm_v1_regs->ippdexpcr, *mask);
> +}
> +
> +static void rcpm_v2_set_ip_power(bool enable, u32 *mask)
> +{
> +     if (enable)
> +             setbits32(&rcpm_v2_regs->ippdexpcr[0], *mask);
> +     else
> +             clrbits32(&rcpm_v2_regs->ippdexpcr[0], *mask);
> +}

Why do these take "u32 *mask" instead of "u32 mask"?

-Scott
