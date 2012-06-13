From: Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 4/4] sched: cpu_power: enable ARCH_POWER
Date: Wed, 13 Jun 2012 15:20:53 +0200
Message-ID: <CAKfTPtCERCDdCSLyPAYAhxAB4wkDMVfMbfecv+vOMbgUXvYwYg@mail.gmail.com>
References: <1339502524-10265-1-git-send-email-vincent.guittot@linaro.org>
	<1339502524-10265-5-git-send-email-vincent.guittot@linaro.org>
	<1339591819.8980.28.camel@twins>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1339591819.8980.28.camel@twins>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 13 June 2012 14:50, Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
> On Tue, 2012-06-12 at 14:02 +0200, Vincent Guittot wrote:
>> Heteregeneous ARM platform uses arch_scale_freq_power function
>> to reflect the relative capacity of each core
>
> I think I've pointed out before that this breaks x86.. you need a patch
> killing at that stuff before this.

In v3.4, x86 hasn't got any specific declaration for
arch_scale_freq_power so it would now use the weak
arch_scale_freq_power which calls default_scale_freq_power. Isn't it
enough ?

>
>> Signed-off-by: Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
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
>>
>> =A0SCHED_FEAT(HRTICK, false)
>> =A0SCHED_FEAT(DOUBLE_TICK, false)
>
