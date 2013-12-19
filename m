From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 3/9] clocksource/cadence_ttc: Store timer frequency
 in driver data
Date: Thu, 19 Dec 2013 21:53:14 +0100
Message-ID: <52B35CBA.7020202@linaro.org>
References: <1385514296-26702-1-git-send-email-soren.brinkmann@xilinx.com> <1385514296-26702-4-git-send-email-soren.brinkmann@xilinx.com> <5cff3201-db97-4061-a686-bf79ac17d4fe@CO1EHSMHS006.ehs.local> <52B1B6FF.7000400@linaro.org> <ce29829b-3727-46ba-8c46-54273ce04745@DB8EHSMHS003.ehs.local> <52B21A82.7050608@linaro.org> <0d7ba9e5-6a62-415d-86e1-763335645406@CH1EHSMHS002.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0d7ba9e5-6a62-415d-86e1-763335645406@CH1EHSMHS002.ehs.local>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>
Cc: Michal Simek <michal.simek@xilinx.com>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Ingo Molnar <mingo@kernel.org>
List-Id: devicetree@vger.kernel.org

On 12/19/2013 07:32 PM, S=C3=B6ren Brinkmann wrote:
> Hi Daniel,
>
> On Wed, Dec 18, 2013 at 10:58:26PM +0100, Daniel Lezcano wrote:
>> On 12/18/2013 05:47 PM, S=C3=B6ren Brinkmann wrote:
>>> Hi Daniel,
>>>
>>> On Wed, Dec 18, 2013 at 03:53:51PM +0100, Daniel Lezcano wrote:
>>>> On 12/17/2013 08:21 PM, S=C3=B6ren Brinkmann wrote:
>>>>> Hi Daniel,
>>>>>
>>>>> On Tue, Nov 26, 2013 at 05:04:50PM -0800, Soren Brinkmann wrote:
>>>>>> It is not allowed to call clk_get_rate() from interrupt context.=
 To
>>>>>> avoid such calls the timer input frequency is stored in the driv=
er's
>>>>>> data struct which makes it accessible to the driver in any conte=
xt.
>>>>>>
>>>>>> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
>>>>>> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>>>
>>>>> I doubt that we'll resolve all issues with this series before the
>>>>> holidays or even the next merge window. Could you take this patch=
 into
>>>>> your tree for 3.14? It is not directly related to the cpufreq wor=
k and
>>>>> fixes an actual issue that triggers a kernel WARN under some cond=
ition
>>>>> (I missed preserving the details and the trace). That would take =
the
>>>>> easy stuff out of the way and we can focus on the more controvers=
ial
>>>>> changes.
>>>>
>>>> You are asking to take it for 3.14 but shouldn't it go as a 3.13 f=
ix ?
>>>
>>> That's also an option. As I remember, the patch fixes a kernel WARN=
=2E The
>>> system still seemed operational though. Up to you whether this is
>>> considered severe enough for the 3.13 series. I'm happy either way.
>>
>> I was not able to reproduce the WARN with my board.
>>
>> Please, could you give the WARN or give the procedure to reproduce i=
t ?
>
> I can't either... I thought I saw the WARN on a vanilla kernel during
> boot (IIRC, when cpuidle started). Is there any chance the timer core
> calls the timer's set_mode() from interrupt context?
> Anyway, let's drop it for now. I'll make sure to record more informat=
ion
> in case it reappears.

=46inally I was able to reproduce it with the highres timers disabled, =
the=20
periodic tick system and the locks debug.

Indeed, we are in an interrupt context (IPI) and we are calling=20
clk_get_rate in the the set_mode function which in turn ends up by=20
getting a mutex... Even if that does not hang, it is a potential kernel=
=20
crash so I will apply the patch with an updated changelog.

------------[ cut here ]------------
WARNING: CPU: 1 PID: 0 at=20
/home/dlezcano/Work/src/cpuidle-next/kernel/mutex.c:856=20
mutex_trylock+0x70/0x1fc()
DEBUG_LOCKS_WARN_ON(in_interrupt())
Modules linked in:
CPU: 1 PID: 0 Comm: swapper/1 Not tainted 3.12.0-xilinx-dirty #93
[<c0014a78>] (unwind_backtrace+0x0/0x11c) from [<c0011b6c>]=20
(show_stack+0x10/0x14)
[<c0011b6c>] (show_stack+0x10/0x14) from [<c039120c>] (dump_stack+0x7c/=
0xc0)
[<c039120c>] (dump_stack+0x7c/0xc0) from [<c001fda4>]=20
(warn_slowpath_common+0x60/0x84)
[<c001fda4>] (warn_slowpath_common+0x60/0x84) from [<c001fe48>]=20
(warn_slowpath_fmt+0x2c/0x3c)
[<c001fe48>] (warn_slowpath_fmt+0x2c/0x3c) from [<c0392658>]=20
(mutex_trylock+0x70/0x1fc)
[<c0392658>] (mutex_trylock+0x70/0x1fc) from [<c02dfc08>]=20
(clk_prepare_lock+0xc/0xe4)
[<c02dfc08>] (clk_prepare_lock+0xc/0xe4) from [<c02e099c>]=20
(clk_get_rate+0xc/0x44)
[<c02e099c>] (clk_get_rate+0xc/0x44) from [<c02d0394>]=20
(ttc_set_mode+0x34/0x78)
[<c02d0394>] (ttc_set_mode+0x34/0x78) from [<c005f794>]=20
(clockevents_set_mode+0x28/0x5c)
[<c005f794>] (clockevents_set_mode+0x28/0x5c) from [<c00607fc>]=20
(tick_broadcast_on_off+0x190/0x1c0)
[<c00607fc>] (tick_broadcast_on_off+0x190/0x1c0) from [<c005f168>]=20
(clockevents_notify+0x58/0x1ac)
[<c005f168>] (clockevents_notify+0x58/0x1ac) from [<c02b99dc>]=20
(cpuidle_setup_broadcast_timer+0x20/0x24)
[<c02b99dc>] (cpuidle_setup_broadcast_timer+0x20/0x24) from [<c006cd04>=
]=20
(generic_smp_call_function_single_interrupt+0)
[<c006cd04>] (generic_smp_call_function_single_interrupt+0xe0/0x130)=20
from [<c00138c8>] (handle_IPI+0x88/0x118)
[<c00138c8>] (handle_IPI+0x88/0x118) from [<c0008504>]=20
(gic_handle_irq+0x58/0x60)
[<c0008504>] (gic_handle_irq+0x58/0x60) from [<c0012644>]=20
(__irq_svc+0x44/0x78)
Exception stack(0xef099fa0 to 0xef099fe8)
9fa0: 00000001 ef092100 00000000 ef092100 ef098000 00000015 c0399f2c=20
c0579d74
9fc0: 0000406a 413fc090 00000000 00000000 00000000 ef099fe8 c00666ec=20
c000f46c
9fe0: 20000113 ffffffff
[<c0012644>] (__irq_svc+0x44/0x78) from [<c000f46c>]=20
(arch_cpu_idle+0x34/0x3c)
[<c000f46c>] (arch_cpu_idle+0x34/0x3c) from [<c0053980>]=20
(cpu_startup_entry+0xa8/0x10c)
[<c0053980>] (cpu_startup_entry+0xa8/0x10c) from [<000085a4>] (0x85a4)
---[ end trace 8185ad1c7a65f6e7 ]---

--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
