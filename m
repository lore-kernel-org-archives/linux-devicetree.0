From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 3/5] arm64: introduce CPU_OF_TABLES for cpu ops selection
Date: Thu, 09 Apr 2015 23:17:06 +0200
Message-ID: <3133453.Cys8lc6CAy@wuerfel>
References: <1428601031-5366-1-git-send-email-galak@codeaurora.org> <1428601031-5366-4-git-send-email-galak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428601031-5366-4-git-send-email-galak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Kumar Gala <galak@codeaurora.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, arm@kernel.org, Abhimanyu Kapur <abhimany@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Thursday 09 April 2015 12:37:09 Kumar Gala wrote:
> @@ -67,4 +67,9 @@ extern const struct cpu_operations *cpu_ops[NR_CPUS];
>  int __init cpu_read_ops(struct device_node *dn, int cpu);
>  void __init cpu_read_bootcpu_ops(void);
>  
> +#define CPU_METHOD_OF_DECLARE(name, __ops)                             \
> +       static const struct cpu_operations *__cpu_method_table_##name   \
> +       __used __section(__cpu_method_of_table)                         \
> +       = __ops;
> +
>  #endif /* ifndef __ASM_CPU_OPS_H */
> 

I'd rather not add this, to avoid giving the appearance that platforms
can just add another one here.

	Arnd
