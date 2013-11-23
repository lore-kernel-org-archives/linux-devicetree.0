From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH 5/7] clocksource/cadence_ttc: Overhaul clocksource
 frequency adjustment
Date: Fri, 22 Nov 2013 17:30:59 -0800
Message-ID: <8cbd0206-ca30-48ae-8820-7d5c23b6fa3a@CO9EHSMHS022.ehs.local>
References: <1383945677-29674-1-git-send-email-soren.brinkmann@xilinx.com>
 <1383945677-29674-6-git-send-email-soren.brinkmann@xilinx.com>
 <52827B11.5040308@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52827B11.5040308@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Michal Simek <michal.simek@xilinx.com>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 12, 2013 at 08:01:37PM +0100, Daniel Lezcano wrote:
> On 11/08/2013 10:21 PM, Soren Brinkmann wrote:
> >The currently used method adjusting the clocksource to a changing in=
put
> >frequency does not work on kernels from 3.11 on.
> >The new approach is to keep the timer frequency as constant as possi=
ble.
> >I.e.
> >  - due to the TTC's prescaler limitations, allow frequency changes
> >    only if the frequency scales by a power of 2
> >  - adjust the counter's divider on the fly when a frequency change
> >    occurs
> >
> >When suspending though, the driver should not prevent rate changes i=
n
> >order to allow the system to enter its low power state. For that
> >reason a PM notifier is added so rate changes can be ignored during
> >suspend/resume.
>=20
> It sounds very weird you have to add a PM notifier in this driver.
>=20
> Have you been facing an issue or do you assume it could happen ?

As I said in my other email, we do have some issues related with
suspend. The construct with the PM notifier seemed to work but since we
upgraded our vendor tree to 3.12 I see issues with this code.

So, for now, I'll remove the PM notifier and associated code from this
patch.
I have to revisit the suspend case later.

	Thanks,
	S=C3=B6ren
