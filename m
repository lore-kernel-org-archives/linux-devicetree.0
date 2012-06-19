From: Yong Zhang <yong.zhang0@gmail.com>
Subject: Re: [PATCH v2 5/5] sched: cpu_power: enable ARCH_POWER
Date: Tue, 19 Jun 2012 17:01:11 +0800
Message-ID: <20120619090110.GA1692@zhy>
References: <1340094536-20873-1-git-send-email-vincent.guittot@linaro.org>
 <1340094536-20873-6-git-send-email-vincent.guittot@linaro.org>
Reply-To: Yong Zhang <yong.zhang0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1340094536-20873-6-git-send-email-vincent.guittot@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, devicetree-discuss@lists.ozlabs.org, linux@arm.linux.org.uk, a.p.zijlstra@chello.nl, grant.likely@secretlab.ca, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On Tue, Jun 19, 2012 at 10:28:56AM +0200, Vincent Guittot wrote:
> Heteregeneous ARM platform uses arch_scale_freq_power function
> to reflect the relative capacity of each core
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  kernel/sched/features.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/features.h b/kernel/sched/features.h
> index de00a48..d98ae90 100644
> --- a/kernel/sched/features.h
> +++ b/kernel/sched/features.h
> @@ -42,7 +42,7 @@ SCHED_FEAT(CACHE_HOT_BUDDY, true)
>  /*
>   * Use arch dependent cpu power functions
>   */
> -SCHED_FEAT(ARCH_POWER, false)
> +SCHED_FEAT(ARCH_POWER, true)

Hmmm...seems we can remove this knob completely.

__weak arch_scale_smt_power() is doing all the trick.

Thanks,
Yong
