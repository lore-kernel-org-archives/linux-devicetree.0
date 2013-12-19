From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 3/9] clocksource/cadence_ttc: Store timer frequency in
 driver data
Date: Thu, 19 Dec 2013 13:23:36 -0800
Message-ID: <f5bcb974-8645-48d3-b03c-f894c0bb5b7b@DB8EHSMHS014.ehs.local>
References: <1385514296-26702-1-git-send-email-soren.brinkmann@xilinx.com>
 <1385514296-26702-4-git-send-email-soren.brinkmann@xilinx.com>
 <5cff3201-db97-4061-a686-bf79ac17d4fe@CO1EHSMHS006.ehs.local>
 <52B1B6FF.7000400@linaro.org>
 <ce29829b-3727-46ba-8c46-54273ce04745@DB8EHSMHS003.ehs.local>
 <52B21A82.7050608@linaro.org>
 <0d7ba9e5-6a62-415d-86e1-763335645406@CH1EHSMHS002.ehs.local>
 <52B35CBA.7020202@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52B35CBA.7020202-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Thu, Dec 19, 2013 at 09:53:14PM +0100, Daniel Lezcano wrote:
> On 12/19/2013 07:32 PM, S=C3=B6ren Brinkmann wrote:
> >Hi Daniel,
> >
> >On Wed, Dec 18, 2013 at 10:58:26PM +0100, Daniel Lezcano wrote:
> >>On 12/18/2013 05:47 PM, S=C3=B6ren Brinkmann wrote:
> >>>Hi Daniel,
> >>>
> >>>On Wed, Dec 18, 2013 at 03:53:51PM +0100, Daniel Lezcano wrote:
> >>>>On 12/17/2013 08:21 PM, S=C3=B6ren Brinkmann wrote:
> >>>>>Hi Daniel,
> >>>>>
> >>>>>On Tue, Nov 26, 2013 at 05:04:50PM -0800, Soren Brinkmann wrote:
> >>>>>>It is not allowed to call clk_get_rate() from interrupt context=
=2E To
> >>>>>>avoid such calls the timer input frequency is stored in the dri=
ver's
> >>>>>>data struct which makes it accessible to the driver in any cont=
ext.
> >>>>>>
> >>>>>>Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> >>>>>>Acked-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >>>>>
> >>>>>I doubt that we'll resolve all issues with this series before th=
e
> >>>>>holidays or even the next merge window. Could you take this patc=
h into
> >>>>>your tree for 3.14? It is not directly related to the cpufreq wo=
rk and
> >>>>>fixes an actual issue that triggers a kernel WARN under some con=
dition
> >>>>>(I missed preserving the details and the trace). That would take=
 the
> >>>>>easy stuff out of the way and we can focus on the more controver=
sial
> >>>>>changes.
> >>>>
> >>>>You are asking to take it for 3.14 but shouldn't it go as a 3.13 =
fix ?
> >>>
> >>>That's also an option. As I remember, the patch fixes a kernel WAR=
N. The
> >>>system still seemed operational though. Up to you whether this is
> >>>considered severe enough for the 3.13 series. I'm happy either way=
=2E
> >>
> >>I was not able to reproduce the WARN with my board.
> >>
> >>Please, could you give the WARN or give the procedure to reproduce =
it ?
> >
> >I can't either... I thought I saw the WARN on a vanilla kernel durin=
g
> >boot (IIRC, when cpuidle started). Is there any chance the timer cor=
e
> >calls the timer's set_mode() from interrupt context?
> >Anyway, let's drop it for now. I'll make sure to record more informa=
tion
> >in case it reappears.
>=20
> Finally I was able to reproduce it with the highres timers disabled,
> the periodic tick system and the locks debug.
>=20
> Indeed, we are in an interrupt context (IPI) and we are calling
> clk_get_rate in the the set_mode function which in turn ends up by
> getting a mutex... Even if that does not hang, it is a potential
> kernel crash so I will apply the patch with an updated changelog.

Thanks! Kind of comforting to know that the issue I tried to fix actual=
ly exists.

	S=C3=B6ren


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
