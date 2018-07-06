From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] arm64: hikey960: update idle-states
Date: Fri, 6 Jul 2018 09:59:15 +0200
Message-ID: <722aed2b-673b-7f17-2337-a7b3442dca56@linaro.org>
References: <1530860246-29072-1-git-send-email-vincent.guittot@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530860246-29072-1-git-send-email-vincent.guittot@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vincent Guittot <vincent.guittot@linaro.org>, xuwei5@hisilicon.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: leo.yan@linaro.org
List-Id: devicetree@vger.kernel.org

On 06/07/2018 08:57, Vincent Guittot wrote:
> Update entry/exit latency and residency time of hikey960 to use more
> realistic figures based on unitary tests done on the platform.
> 
> The complete results (in us) :
>                   big cluster
>                   cluster  CPU
> max entry latency     800  400
> max exit latency     2900  550
> residency  903Mhz    5000 1500
> residency 2363Mhz       0 1500
> 
>                   little cluster
>                   cluster  CPU
> max entry latency     500  400
> max exit latency     1600  650
> residency  533Mhz    8000 4500
> residency 1844Mhz       0 1500
> 
> We can see that the residency time depends of the running OPP which is not
> handled for now. Then we also have to take into account the constraint of
> a residency time shorter than the tick to get full advantage of idle loop
> reordering(tick is stopped if idle duration is higher than tick period).
> Finally the selected residency value are :
>                  big cluster
>                   cluster  CPU
> residency            3700 1500
> 
>                   little cluster
>                   cluster  CPU
> residency            3500 1500
> 
> A simple test with a task waking up every 11,111ms shows improvement:
> - 5% a lowest OPP
> - 22% at highest OPP
> 
> The period has been chosen:
> - to be shorter than old cluster residency time and longer than new
> residency time od cluster off C-state
> - to prevent any sync with tick (4ms) when running tests that can add
> some variances between tests
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---

Great! Thanks for fixing the values.

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
