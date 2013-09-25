From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 3/4] tick: broadcast: Deny per-cpu clockevents from
 being broadcast sources
Date: Wed, 25 Sep 2013 17:11:46 +0200
Message-ID: <5242FD32.7030008@linaro.org>
References: <1379530118-22813-1-git-send-email-soren.brinkmann@xilinx.com> <1379530118-22813-4-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1379530118-22813-4-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Soren Brinkmann <soren.brinkmann@xilinx.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Michal Simek <michal.simek@xilinx.com>, Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@codeaurora.org>, Grant Likely <grant.likely@secretlab.ca>, Preeti Murthy <preeti.lkml@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 09/18/2013 08:48 PM, Soren Brinkmann wrote:
> On most ARM systems the per-cpu clockevents are truly per-cpu in
> the sense that they can't be controlled on any other CPU besides
> the CPU that they interrupt. If one of these clockevents were to
> become a broadcast source we will run into a lot of trouble
> because the broadcast source is enabled on the first CPU to go
> into deep idle (if that CPU suffers from FEAT_C3_STOP) and that
> could be a different CPU than what the clockevent is interrupting
> (or even worse the CPU that the clockevent interrupts could be
> offline).
>=20
> Theoretically it's possible to support per-cpu clockevents as the
> broadcast source but so far we haven't needed this and supporting
> it is rather complicated. Let's just deny the possibility for now
> until this becomes a reality (let's hope it never does!).
>=20
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

> ---
>  kernel/time/tick-broadcast.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/kernel/time/tick-broadcast.c b/kernel/time/tick-broadcas=
t.c
> index 218bcb5..9532690 100644
> --- a/kernel/time/tick-broadcast.c
> +++ b/kernel/time/tick-broadcast.c
> @@ -70,6 +70,7 @@ static bool tick_check_broadcast_device(struct cloc=
k_event_device *curdev,
>  					struct clock_event_device *newdev)
>  {
>  	if ((newdev->features & CLOCK_EVT_FEAT_DUMMY) ||
> +	    (newdev->features & CLOCK_EVT_FEAT_PERCPU) ||
>  	    (newdev->features & CLOCK_EVT_FEAT_C3STOP))
>  		return false;
> =20
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
