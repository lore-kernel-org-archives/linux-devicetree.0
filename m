From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v2 4/9] clocksource/cadence_ttc: Use enable/disable_irq
Date: Fri, 6 Dec 2013 14:47:32 -0800
Message-ID: <f6d25456-8e30-4792-b184-21eb02dfaa1c@AM1EHSMHS001.ehs.local>
References: <1385514296-26702-1-git-send-email-soren.brinkmann@xilinx.com>
 <1385514296-26702-5-git-send-email-soren.brinkmann@xilinx.com>
 <52972F3A.9090103@linaro.org>
 <alpine.DEB.2.02.1311281507280.30673@ionos.tec.linutronix.de>
 <b2ed3cbc-c9df-4235-8137-93514c05bffa@DB8EHSMHS031.ehs.local>
 <alpine.DEB.2.02.1311281939000.30673@ionos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1311281939000.30673@ionos.tec.linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Thomas,

sorry for the delay, but I couldn't find time any earlier.

On Thu, Nov 28, 2013 at 08:07:10PM +0100, Thomas Gleixner wrote:
> On Thu, 28 Nov 2013, S=C3=B6ren Brinkmann wrote:
> > On Thu, Nov 28, 2013 at 03:18:50PM +0100, Thomas Gleixner wrote:
> > > Now the problem with this device is that it is not a per cpu
> > > device. It's a global device, so this update can conflict with a
> > > parallel access on the other CPU. Now the disable_irq() only prev=
ents
> > > that the other CPU can handle a device interrupt from that timer.=
 But
> > > it does not prevent any parallel access from e.g. the idle code p=
ath
> > > which will try to reprogram it.
> >
> > Does that mean interrupts need to be disabled globally? Also, does =
the
>=20
> Globally disabling interrupts is not going to work, except you want t=
o
> use stomp_machine(). But that would be overkill.
>=20
> > cpuidle path depend on interrupts or can it interfere no matter wha=
t?
>=20
> It can interfere no matter what. The broadcast is modified for the cp=
u
> which loses its per cpu timer due to the idle state via
>=20
>       clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_ENTER, ...);
> =20
> > > Soren, is that timer used as the broadcast device ?
> >
> > Yes, this is the only broadcast capable timer on Zynq, AFAIK. Other=
 than
> > the TTC we only have the arm_global_timer and smp_twd timers, which=
 both
> > are per_cpu devices and thus not broadcast capable.
>=20
> There is a solution to this. We can identify the broadcast device in
> the core and serialize all callers including interrupts on a differen=
t
> cpu against the update. So no need for the disable/enable_irq() dance=
=2E

IIUC, and please correct me if I'm wrong, with the patch I'd simply cal=
l
'clockevents_update_freq() without having to disable IRQs. But I'm not
sure whether periodic mode is covered. I found, that I had to reprogram
the timer interval in my clock notifier callback when the timer
frequency changes. I think 'clockevents_update_freq()' only handles
oneshot mode. For that reason I call 'ttc_set_interval()' in the clock
notifier in case the timer is in periodic mode. For that call we'd stil=
l
have possible races. I guess the best solution would be to move that
functionality into 'clockevents_update_freq()'?

	S=C3=B6ren
