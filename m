From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [v3, 1/2] arm64: Create link to include/dt-bindings to enable C
 preprocessor use.
Date: Thu, 27 Nov 2014 11:24:13 +0000
Message-ID: <20141127112413.GL828@e106497-lin.cambridge.arm.com>
References: <1415727131-4572-2-git-send-email-Liviu.Dudau@arm.com>
 <5476E215.5020405@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5476E215.5020405-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, device tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 27, 2014 at 08:34:29AM +0000, Pankaj Dubey wrote:
> Hi Liviu,
>=20
> On Tuesday 11 November 2014 11:02 PM, Liviu Dudau wrote:
> > DT files used in the compilation phase can be preprocessed by the C
> > preprocessor. This requires an include/dt-bindings directory to be
> > present in the arch/arm64/boot/dts directory.
> >
> > Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> >
>=20
> Same change already has been posted as part of adding Exynos7 SoC=20
> support, as Exynos7 patches have been accepted in Kukjin's tree, I th=
ink=20
> following patch [1] as part of Exynos7 series [2] can also be taken.
>=20
> 1: http://www.spinics.net/lists/devicetree/msg56552.html
> 2: http://www.spinics.net/lists/devicetree/msg56551.html

Hi Pankaj,

I don't know how Olof and Arnd are going to handle this, but I believe
Arnd has already merged my patchset into the arm-soc tree.

Best regards,
Liviu

>=20
> Thanks,
> Pankaj Dubey
>=20
> > ---
> > arch/arm64/boot/dts/include/dt-bindings | 1 +
> >   1 file changed, 1 insertion(+)
> >   create mode 120000 arch/arm64/boot/dts/include/dt-bindings
> >
> > \ No newline at end of file
> >
> > diff --git a/arch/arm64/boot/dts/include/dt-bindings b/arch/arm64/b=
oot/dts/include/dt-bindings
> > new file mode 120000
> > index 0000000..08c00e4
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/include/dt-bindings
> > @@ -0,0 +1 @@
> > +../../../../../include/dt-bindings
> >
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
