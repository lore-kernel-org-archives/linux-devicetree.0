From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v2 3/9] clocksource/cadence_ttc: Store timer frequency in
 driver data
Date: Thu, 19 Dec 2013 10:32:44 -0800
Message-ID: <0d7ba9e5-6a62-415d-86e1-763335645406@CH1EHSMHS002.ehs.local>
References: <1385514296-26702-1-git-send-email-soren.brinkmann@xilinx.com>
 <1385514296-26702-4-git-send-email-soren.brinkmann@xilinx.com>
 <5cff3201-db97-4061-a686-bf79ac17d4fe@CO1EHSMHS006.ehs.local>
 <52B1B6FF.7000400@linaro.org>
 <ce29829b-3727-46ba-8c46-54273ce04745@DB8EHSMHS003.ehs.local>
 <52B21A82.7050608@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52B21A82.7050608@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Michal Simek <michal.simek@xilinx.com>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Ingo Molnar <mingo@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Wed, Dec 18, 2013 at 10:58:26PM +0100, Daniel Lezcano wrote:
> On 12/18/2013 05:47 PM, S=C3=B6ren Brinkmann wrote:
> >Hi Daniel,
> >
> >On Wed, Dec 18, 2013 at 03:53:51PM +0100, Daniel Lezcano wrote:
> >>On 12/17/2013 08:21 PM, S=C3=B6ren Brinkmann wrote:
> >>>Hi Daniel,
> >>>
> >>>On Tue, Nov 26, 2013 at 05:04:50PM -0800, Soren Brinkmann wrote:
> >>>>It is not allowed to call clk_get_rate() from interrupt context. =
To
> >>>>avoid such calls the timer input frequency is stored in the drive=
r's
> >>>>data struct which makes it accessible to the driver in any contex=
t.
> >>>>
> >>>>Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> >>>>Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> >>>
> >>>I doubt that we'll resolve all issues with this series before the
> >>>holidays or even the next merge window. Could you take this patch =
into
> >>>your tree for 3.14? It is not directly related to the cpufreq work=
 and
> >>>fixes an actual issue that triggers a kernel WARN under some condi=
tion
> >>>(I missed preserving the details and the trace). That would take t=
he
> >>>easy stuff out of the way and we can focus on the more controversi=
al
> >>>changes.
> >>
> >>You are asking to take it for 3.14 but shouldn't it go as a 3.13 fi=
x ?
> >
> >That's also an option. As I remember, the patch fixes a kernel WARN.=
 The
> >system still seemed operational though. Up to you whether this is
> >considered severe enough for the 3.13 series. I'm happy either way.
>=20
> I was not able to reproduce the WARN with my board.
>=20
> Please, could you give the WARN or give the procedure to reproduce it=
 ?

I can't either... I thought I saw the WARN on a vanilla kernel during
boot (IIRC, when cpuidle started). Is there any chance the timer core
calls the timer's set_mode() from interrupt context?
Anyway, let's drop it for now. I'll make sure to record more informatio=
n
in case it reappears.

	S=C3=B6ren
