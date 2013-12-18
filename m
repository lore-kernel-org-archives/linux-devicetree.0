From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 3/9] clocksource/cadence_ttc: Store timer frequency
 in driver data
Date: Wed, 18 Dec 2013 22:58:26 +0100
Message-ID: <52B21A82.7050608@linaro.org>
References: <1385514296-26702-1-git-send-email-soren.brinkmann@xilinx.com> <1385514296-26702-4-git-send-email-soren.brinkmann@xilinx.com> <5cff3201-db97-4061-a686-bf79ac17d4fe@CO1EHSMHS006.ehs.local> <52B1B6FF.7000400@linaro.org> <ce29829b-3727-46ba-8c46-54273ce04745@DB8EHSMHS003.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ce29829b-3727-46ba-8c46-54273ce04745@DB8EHSMHS003.ehs.local>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?U8O2cmVuIEJyaW5rbWFubg==?= <soren.brinkmann@xilinx.com>
Cc: Michal Simek <michal.simek@xilinx.com>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Ingo Molnar <mingo@kernel.org>
List-Id: devicetree@vger.kernel.org

On 12/18/2013 05:47 PM, S=C3=B6ren Brinkmann wrote:
> Hi Daniel,
>
> On Wed, Dec 18, 2013 at 03:53:51PM +0100, Daniel Lezcano wrote:
>> On 12/17/2013 08:21 PM, S=C3=B6ren Brinkmann wrote:
>>> Hi Daniel,
>>>
>>> On Tue, Nov 26, 2013 at 05:04:50PM -0800, Soren Brinkmann wrote:
>>>> It is not allowed to call clk_get_rate() from interrupt context. T=
o
>>>> avoid such calls the timer input frequency is stored in the driver=
's
>>>> data struct which makes it accessible to the driver in any context=
=2E
>>>>
>>>> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
>>>> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>>>
>>> I doubt that we'll resolve all issues with this series before the
>>> holidays or even the next merge window. Could you take this patch i=
nto
>>> your tree for 3.14? It is not directly related to the cpufreq work =
and
>>> fixes an actual issue that triggers a kernel WARN under some condit=
ion
>>> (I missed preserving the details and the trace). That would take th=
e
>>> easy stuff out of the way and we can focus on the more controversia=
l
>>> changes.
>>
>> You are asking to take it for 3.14 but shouldn't it go as a 3.13 fix=
 ?
>
> That's also an option. As I remember, the patch fixes a kernel WARN. =
The
> system still seemed operational though. Up to you whether this is
> considered severe enough for the 3.13 series. I'm happy either way.

I was not able to reproduce the WARN with my board.

Please, could you give the WARN or give the procedure to reproduce it ?

Thanks
   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
