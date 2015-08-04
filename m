From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v4 0/7] Clocksource changes for Pistachio CPUFreq.
Date: Tue, 04 Aug 2015 11:48:35 +0200
Message-ID: <55C08A73.60505@linaro.org>
References: <1438005618-27003-1-git-send-email-govindraj.raja@imgtec.com> <20150728095128.GA23771@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150728095128.GA23771@linux-mips.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Govindraj Raja <govindraj.raja@imgtec.com>, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Andrew Bresticker <abrestic@chromium.org>, James Hartley <James.Hartley@imgtec.com>, Damien Horsley <Damien.Horsley@imgtec.com>, James Hogan <James.Hogan@imgtec.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>
List-Id: devicetree@vger.kernel.org

On 07/28/2015 11:51 AM, Ralf Baechle wrote:
> Daniel,
>
> On Mon, Jul 27, 2015 at 03:00:11PM +0100, Govindraj Raja wrote:
>
>> From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
>>
>> The purpose of this patchset is to support CPUFreq on Pistachio SoC.
>> However, given Pistachio uses the MIPS GIC clocksource and clockeven=
t drivers
>> (clocked from the CPU), adding CPUFreq support needs some work.
>>
>> This patchset changes the MIPS GIC clockevent driver to update the f=
requency of
>> the per-cpu clockevents using a clock notifier.
>>
>> Then, we add a clocksource driver for IMG Pistachio SoC, based on th=
e
>> general purpose timers. The SoC only provides four timers, so we can=
't
>> use them to implement the four clockevents and the clocksource.
>>
>> However, we can use one of these timers to provide a clocksource and=
 a
>> sched clock. Given the general purpose timers are clocked from the p=
eripheral
>> system clock tree, they are not affected by CPU rate changes.
>>
>> Patches 1 to 3 are just style cleaning and preparation work.
>> Patch 4 adds the clockevent frequency update.
>> Patches 5 and 6 add the new clocksource driver.
>> Patch 7 introduces an option to enable the timer based clocksource o=
n Pistachio.
>
> if you're happy with this series feel free to add my ack to patch 7/7
> which is the only one that touches arch/mips.
>
> Alternatively I can carry this in the MIPS tree which would have tbe
> benefit of better testing.

Ok, go ahead.

=46or the series 1-4: Acked-by: Daniel Lezcano <daniel.lezcano@linaro.o=
rg>



--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
