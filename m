From: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH v2 5/5] sched: cpu_power: enable ARCH_POWER
Date: Wed, 20 Jun 2012 11:11:04 +0200
Message-ID: <CAKfTPtAdSMJ1RnDPDYZZ378QW9DUCKLA+oC3TWJD7v5KAkFitA@mail.gmail.com>
References: <1340094536-20873-1-git-send-email-vincent.guittot@linaro.org>
	<1340094536-20873-6-git-send-email-vincent.guittot@linaro.org>
	<20120619090110.GA1692@zhy>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120619090110.GA1692@zhy>
Sender: linux-kernel-owner@vger.kernel.org
To: Yong Zhang <yong.zhang0@gmail.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, devicetree-discuss@lists.ozlabs.org, linux@arm.linux.org.uk, grant.likely@secretlab.ca, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On 19 June 2012 11:01, Yong Zhang <yong.zhang0@gmail.com> wrote:
> On Tue, Jun 19, 2012 at 10:28:56AM +0200, Vincent Guittot wrote:
>> Heteregeneous ARM platform uses arch_scale_freq_power function
>> to reflect the relative capacity of each core
>>
>> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
>> ---
>> =A0kernel/sched/features.h | =A0 =A02 +-
>> =A01 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/kernel/sched/features.h b/kernel/sched/features.h
>> index de00a48..d98ae90 100644
>> --- a/kernel/sched/features.h
>> +++ b/kernel/sched/features.h
>> @@ -42,7 +42,7 @@ SCHED_FEAT(CACHE_HOT_BUDDY, true)
>> =A0/*
>> =A0 * Use arch dependent cpu power functions
>> =A0 */
>> -SCHED_FEAT(ARCH_POWER, false)
>> +SCHED_FEAT(ARCH_POWER, true)
>
> Hmmm...seems we can remove this knob completely.
>

Peter,

Do you prefer to keep it or remove it completely ?

Thanks

> __weak arch_scale_smt_power() is doing all the trick.
>
> Thanks,
> Yong
