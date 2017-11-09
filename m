From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v10 1/8] perf: Export perf_event_update_userpage
Date: Thu, 9 Nov 2017 10:07:06 +0100
Message-ID: <20171109090706.oangi7qebju5mvmu@hirez.programming.kicks-ass.net>
References: <20171103175105.23546-1-suzuki.poulose@arm.com>
 <20171103175105.23546-2-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20171103175105.23546-2-suzuki.poulose@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: mark.rutland@arm.com, robh@kernel.org, mathieu.poirier@linaro.org, devicetree@vger.kernel.org, marc.zyngier@arm.com, catalin.marinas@arm.com, leo.yan@linaro.org, will.deacon@arm.com, linux-kernel@vger.kernel.org, Jonathan.Cameron@huawei.com, sudeep.holla@arm.com, frowand.list@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 03, 2017 at 05:50:58PM +0000, Suzuki K Poulose wrote:
> Export perf_event_update_userpage() so that PMU driver using them,
> can be built as modules.
> 
> Cc: Peter Zilstra <peterz@infradead.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> ---
>  kernel/events/core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 9d93db81fa36..550015829db8 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -4982,6 +4982,7 @@ void perf_event_update_userpage(struct perf_event *event)
>  unlock:
>  	rcu_read_unlock();
>  }
> +EXPORT_SYMBOL_GPL(perf_event_update_userpage);
>  
>  static int perf_mmap_fault(struct vm_fault *vmf)
>  {
> -- 
> 2.13.6
> 
