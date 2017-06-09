From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/3] clk: meson: meson8b: add compatibles for Meson8 and Meson8m2
Date: Fri, 09 Jun 2017 11:13:17 -0700
Message-ID: <m2lgp19ghu.fsf@baylibre.com>
References: <20170604183341.21417-1-martin.blumenstingl@googlemail.com>
        <20170604183341.21417-2-martin.blumenstingl@googlemail.com>
        <1496606325.3552.16.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496606325.3552.16.camel-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (Jerome Brunet's message
        of "Sun, 04 Jun 2017 21:58:45 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> On Sun, 2017-06-04 at 20:33 +0200, Martin Blumenstingl wrote:
>> The clock controller on Meson8, Meson8b and Meson8m2 is very similar
>> based on the code from the Amlogic GPL kernel sources. Add separate
>> compatibles for each SoC to make sure that we can easily implement
>> all the small differences for each SoC later on.
>>=20
>> In general the Meson8 and Meson8m2 seem to be almost identical as they
>> even share the same mach-meson8 directory in Amlogic's GPL kernel
>> sources.
>> The main clocks on Meson8, Meson8b and Meson8m2 are very similar,
>> because they are all using the same PLL values, 90% of the clock gates
>> are the same (the actual diffstat of the mach-meson8/clock.c and
>> mach-meson8b/clock.c files is around 30 to 40 lines, when excluding
>> all commented out code).
>> The difference between the Meson8 and Meson8b clock gates seem to be:
>> - Meson8 has AIU_PCLK, HDMI_RX, VCLK2_ENCT, VCLK2_ENCL, UART3,
>> =C2=A0 CSI_DIG_CLKIN gates which don't seem to be available on Meson8b
>> - the gate on Meson8 for bit 7 seems to be named "_1200XXX" instead
>> =C2=A0 of "PERIPHS_TOP" (on Meson8b)
>> - Meson8b has a SANA gate which doesn't seem to exist on Meson8 (or
>> =C2=A0 on Meson8 the same bit is used by the UART3 gate in Amlogic's GPL
>> =C2=A0 kernel sources)
>> None of these gates is added for now, since it's unclear whether these
>> definitions are actually correct (the VCLK2_ENCT gate for example is
>> defined, but only used in some commented block).
>>=20
>> The main difference between all three SoCs seem to be the video (VPU)
>> clocks. Apart from different supported clock rates (according to vpu.c
>> in mach-meson8 and mach-meson8b from Amlogic's GPL kernel sources) the
>> most notable difference is that Meson8m2 has a GP_PLL clock and a mux
>> (probably the same as on the Meson GX SoCs) to support glitch-free
>> (clock rate) switching.
>> None of these VPU clocks are not supported by our mainline meson8b
>> clock driver yet though.
>>=20
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>> ---
>> =C2=A0.../devicetree/bindings/clock/amlogic,meson8b-clkc.txt=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 11 +++++++---
>
> I think you should split the binding documentation and clk changes into s=
eparate
> patches.
>
>> -
>> =C2=A0drivers/clk/meson/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A06 +++---
>> =C2=A0drivers/clk/meson/meson8b.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A05 ++++-
>
> The change being more platform than clock related, I'd prefer if Kevin or=
 Carlo
> ack it before we apply it.

Acked-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
