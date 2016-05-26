From: Ganapatrao Kulkarni <gpkulkarni@gmail.com>
Subject: Re: [PATCH 3/3] arm64/numa: fix type info
Date: Thu, 26 May 2016 09:22:31 -0700
Message-ID: <CAFpQJXWih2V9Ki-vkL+cDni=VoWL0nA-fx5B5XtfNxFsoUso-g@mail.gmail.com>
References: <1464230639-9852-1-git-send-email-thunder.leizhen@huawei.com>
	<1464230639-9852-3-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464230639-9852-3-git-send-email-thunder.leizhen@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Ganapatrao Kulkarni <gkulkarni@caviumnetworks.com>, Robert Richter <rrichter@cavium.com>, David Daney <david.daney@cavium.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Xinwei Hu <huxinwei@huawei.com>, Zefan Li <lizefan@huawei.com>, Hanjun Guo <guohanjun@huawei.com>, Tianhong Ding <dingtianhong@huawei.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 25, 2016 at 7:43 PM, Zhen Lei <thunder.leizhen@huawei.com> wrote:
> numa_init(of_numa_init) may returned error because of numa configuration
> error. So "No NUMA configuration found" is inaccurate. In fact, specific
> configuration error information can be immediately printed by the
> testing branch. So "No NUMA..." only needs to be printed when numa_off.
>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  arch/arm64/mm/numa.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
> index 98dc104..9937cc1 100644
> --- a/arch/arm64/mm/numa.c
> +++ b/arch/arm64/mm/numa.c
> @@ -362,7 +362,8 @@ static int __init dummy_numa_init(void)
>         int ret;
>         struct memblock_region *mblk;
>
> -       pr_info("%s\n", "No NUMA configuration found");
> +       if (numa_off)

IIRC, it should be
if (!numa_off)
we want to print this message when we failed to find proper numa configuration.
when numa_off is set, we will not look for any numa configuration.

> +               pr_info("%s\n", "No NUMA configuration found");
>         pr_info("NUMA: Faking a node at [mem %#018Lx-%#018Lx]\n",
>                0LLU, PFN_PHYS(max_pfn) - 1);
>
> --
> 2.5.0

ganapat
>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
