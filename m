From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/5] arm64: Juno: Split juno.dts into juno-base.dtsi and
 juno.dts.
Date: Thu, 14 May 2015 14:11:12 +0100
Message-ID: <20150514131112.GQ2345@e106497-lin.cambridge.arm.com>
References: <1431537092-19597-1-git-send-email-Liviu.Dudau@arm.com>
 <1431537092-19597-3-git-send-email-Liviu.Dudau@arm.com>
 <1431596142.2881.13.camel@linaro.org>
 <20150514103040.GN2345@e106497-lin.cambridge.arm.com>
 <1431601471.2881.36.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431601471.2881.36.camel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Jon Medhurst (Tixy)" <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 14, 2015 at 12:04:31PM +0100, Jon Medhurst (Tixy) wrote:
> On Thu, 2015-05-14 at 11:30 +0100, Liviu Dudau wrote:
> > On Thu, May 14, 2015 at 10:35:42AM +0100, Jon Medhurst (Tixy) wrote=
:
> [...]
> > >=20
> > > What criteria were used to select the contents of juno-base.dtsi?
> > > From what I can see, the stuff left out of base is still the same=
 for r0
> > > and r1 (cpu, pmu, memory, psci!).
> [...]
> >=20
> > There are potential differences. Cortex-A53 cluster in r1 has limit=
ed
> > CPUfreq functionality due to a chip errata and there were talks int=
ernally
> > to actually disable it, hence the reason for keeping CPUs outside t=
he
> > juno-base.dtsi. r2 will have a different set of big CPUs as well, s=
o this
> > is preparing for the future as well.
> >=20
> > PMU are linked to the CPUs, hence the reason they stayed. As for th=
e
> > memory and psci nodes the thinking behind it was mostly to allow fo=
r
> > ACPI to make changes there, but it does look now like retrofitting =
an
> > explanation to something that I did not give too much thought at th=
at
> > moment.
>=20
> I guess my concern was motivated by the selfish aspect of having to
> maintain a bunch of out-of-tree Juno patches (like cpuidle and cpufre=
q
> related DT updates) and having to duplicate those in more than one DT=
,
> and also having backport DT reorgs like this patch. Of course, none o=
f
> that should be a consideration in deciding what goes into mainline, I
> just wanted to make sure there was a reason for the patch.

You are probably the best placed engineer to offer feedback on these pa=
tches,
as it will affect you in the downstream.

Given that cpufreq will have limited ranges for Juno r1 (~200MHz spread=
) and
that HMP/EAS will not be working optimally on R1, do you still want to =
see
the CPUs nodes moved into juno-base.dtsi?

Best regards,
Liviu

>=20
> --=20
> Tixy
>=20
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
