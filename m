From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 2/3] arm64: dts: uniphier: add CPU clock and OPP table for
 LD11 SoC
Date: Wed, 19 Oct 2016 17:33:00 +0900
Message-ID: <CAK7LNATc2XxAZf-rvMkRjGn3q_18yB=9aycAE1j9+n0==xzaHQ@mail.gmail.com>
References: <1476629958-25368-1-git-send-email-yamada.masahiro@socionext.com>
 <1476629958-25368-3-git-send-email-yamada.masahiro@socionext.com>
 <20161018112548.GA11471@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161018112548.GA11471@vireshk-i7>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Viresh,


2016-10-18 20:25 GMT+09:00 Viresh Kumar <viresh.kumar@linaro.org>:
> On 16-10-16, 23:59, Masahiro Yamada wrote:
>> +     cluster0_opp: opp_table {
>> +             compatible = "operating-points-v2";
>> +             opp-shared;
>> +
>> +             opp@245000000 {
>> +                     opp-hz = /bits/ 64 <245000000>;
>> +                     clock-latency-ns = <300>;
>> +             };
>> +             opp@250000000 {
>> +                     opp-hz = /bits/ 64 <250000000>;
>> +                     clock-latency-ns = <300>;
>> +             };
>> +             opp@490000000 {
>> +                     opp-hz = /bits/ 64 <490000000>;
>> +                     clock-latency-ns = <300>;
>> +             };
>> +             opp@500000000 {
>> +                     opp-hz = /bits/ 64 <500000000>;
>> +                     clock-latency-ns = <300>;
>> +             };
>> +             opp@653333333 {
>
> Why isn't ^^ matching with below values ? Same in next patch as well.



When I try to update /sys/devices/system/cpu/cpufreq/policy*/scaling_max_freq,
it did not work as I had expected.


scaling_max_freq is specified by kHz unit,
on the other hand, clock frequency in the clk driver is specified by Hz.



If the operating point is 653333kHz, the cpufreq requests
the clk driver to set 653333000, but it is lower than
the exact clock, 653333333.
So, the next lower frequency, 500000000 is selected.
As a result, the operating point 653333kHz is never enabled.


So, the operating point must be equal or a little bit bigger.


Do you know a better way to solve this distortion?


-- 
Best Regards
Masahiro Yamada
