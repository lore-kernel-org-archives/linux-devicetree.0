From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4] clocksource: arch_timer: Allow the device tree to specify uninitialized timer registers
Date: Wed, 26 Nov 2014 13:55:55 +0100
Message-ID: <19683112.9S9LAQsUEX@diego>
References: <1412753627-28287-1-git-send-email-sonnyrao@chromium.org> <11522840.iniX5CHHHk@diego> <5475CC75.5030300@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5475CC75.5030300-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nathan Lynch <Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, 26. November 2014, 13:49:57 schrieb Daniel Lezcano:
> On 11/26/2014 01:48 PM, Heiko St=FCbner wrote:
> > Am Mittwoch, 26. November 2014, 13:30:58 schrieb Daniel Lezcano:
> >> On 11/26/2014 01:06 PM, Heiko St=FCbner wrote:
> >>> Hi Daniel,
> >>>=20
> >>> Am Mittwoch, 26. November 2014, 12:51:08 schrieb Daniel Lezcano:
> >>>> Hi Doug, Olof,
> >>>>=20
> >>>> IIUC, it sounds like this patch is needed from some other patche=
s in
> >>>> arm-soc. Olof was proposing to take this patch through its tree =
to
> >>>> facilitate the integration.
> >>>>=20
> >>>> Olof, is it this patch you were worried about ?
> >>>=20
> >>> I think this is one of two patches in question.
> >>>=20
> >>> "clocksource: arch_timer: Fix code to use physical timers when
> >>> requested"
> >>> [0] would be the second one.
> >>>=20
> >>> And the patch for arm-soc that Olof means would be "ARM: dts: rk3=
288:
> >>> add
> >>> arm,cpu-registers-not-fw-configured" [1].
> >>=20
> >> Ok, so IIUC, "clocksource: arch_timer: Fix code to use physical ti=
mers
> >> when requested" should go via arm's tree, right ?
> >=20
> > If I'm reading Olof's irc-comments from yesterday correctly, that i=
s right
> > and the 3 patches should go in together:
> >=20
> > - "clocksource: arch_timer: Fix code to use physical timers
> >=20
> >    when requested" fixes the use of physical timers in general
> >=20
> > - "clocksource: arch_timer: Allow the device tree to specify uninit=
ialized
> >=20
> >    timer registers" allows this to be set from dt
> >=20
> > - "ARM: dts: rk3288: add arm,cpu-registers-not-fw-configured" enabl=
es this
> > on>=20
> >    rk3288
>=20
> Ok, then I drop them from my tree and will let Olof to handle them.

But maybe you could give them an Ack :-)


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
