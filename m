From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 0/6] ARM: STi reset controller support
Date: Mon, 24 Feb 2014 11:33:08 +0100
Message-ID: <1393237988.3091.14.camel@pizza.hi.pengutronix.de>
References: <1389696613-19683-1-git-send-email-srinivas.kandagatla@st.com>
			<1391437665-11913-1-git-send-email-srinivas.kandagatla@st.com>
		<1391592486.11239.4.camel@pizza.hi.pengutronix.de>
	 <52F4D76F.8070301@st.com> <5304B849.2080806@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5304B849.2080806-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>
Cc: srinivas kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stephen.gallimore-qxv4g6HH51o@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

Am Mittwoch, den 19.02.2014, 14:57 +0100 schrieb Maxime Coquelin:
> Hi Philipp,
> 
> On 02/07/2014 01:54 PM, srinivas kandagatla wrote:
> > Hi Philipp,
> > Thankyou for looking at the patches.
> >
> >
> > On 05/02/14 09:28, Philipp Zabel wrote:
> >> Hi Srinivas,
> >>
> > ...
> >>
> >> the patchset looks good to me for the soft resets. But for the powerdown
> >> bits I am wondering whether the reset controller API is the right
> >> abstraction. Depending on whether those bits really just put the IPs
> >> into reset or there is some power gating / sequencing involved,
> >> shouldn't this rather be handled as a set of pm domains?
> >
> > The hardware name of these control signals into the devices is
> > slightly unfortunate and a bit misleading. We do not generally
> > have separate power domains for peripheral devices in our
> > current STB SoCs, in the sense that the voltage cannot actually be
> > removed from individual devices. In the USB case we believe the
> > powerdown signals internally gate off two of the three
> > incoming clocks to most of the USB controller's logic blocks,
> > essentially holding the device in a disabled (enable/disable
> > might have been a better name for the signal) state.
> >
> > The primary requirement to manipulate these signals is to bring
> > the device out of its cold boot default powerdown/disabled/reset
> > (whatever you want to call it) state when the device is probed or
> > after a SoC wide power loss when resuming from PM_SUSPEND_MEM.
> >
> >
> >> I see that for example on STiH415 there are both soft resets and
> >> powerdown bits for USB[012].
> >
> > Our IPs typically have two or sometimes three signals going into
> > them, controlled from outside of the IP block itself (typically using
> > SoC global system configuration registers) that you could view
> > as "reset-a-like"; that is toggling each of the signals puts the IP
> > into a state where it is in some way unusable and then back to
> > being useable again. The reset controller API appeared to be the
> > natural abstraction for the drivers to be given access to such control
> > signals, regardless of the precise effect the signals have on the
> > device's internal state.
> >
> > With regards to sequencing between these signals; it is the case that
> > there is a likely sequencing because at least in the USB case it is
> > thought that the "powerdown" stops the clock going to the reset chain
> > logic. But we did not see that as an issue as the reset controller
> > framework allows for multiple named "reset" lines being defined for
> > a device through its DT attributes. The driver knows which signal
> > is which and what each does, because it asks for them by name;
> > therefore, it knows how to impose any required ordering when changing
> > the state of those signals.
> >
> 
> Did Srini's explanations convinced you?
> 
> If so, could you queue the series for v3.15?

to be honest, I'm not comfortable with this explanation. If the
"powerdown" bits only gate the clocks to those modules, calling it a
reset control is clearly the wrong abstraction. If that is the case,
couldn't you handle those bits via the clock framework?
If on the other hand these powerdown bits also trigger reset machinery,
such that asserting and deasserting that bit will change the module's
internal state, I could be convinced to queue them like this.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
