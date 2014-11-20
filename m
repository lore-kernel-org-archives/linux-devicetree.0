From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 0/2] arm64: Add support for Juno development board
Date: Thu, 20 Nov 2014 10:54:11 +0000
Message-ID: <20141120105410.GD17214@e106497-lin.cambridge.arm.com>
References: <1415727131-4572-1-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415727131-4572-1-git-send-email-Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, device tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 11, 2014 at 05:32:09PM +0000, Liviu Dudau wrote:
> Hi,
>=20
> This patchset adds device tree support for ARM's AArch64 Juno develop=
ment
> board. It enables use of various peripherals on the board, from USB a=
nd
> networking to I2C and PL011 UART.
>=20
> The patches can also be found in the repository at:
>=20
>    git://github.com/ARM-software/linux.git juno/dts-for-armsoc
>=20
> for you to fetch.

Gentle ping!

Olof, Arnd, Kevin: are you OK with this patchset?

Best regards,
Liviu

>=20
>=20
> Changes vs v2:
>   - rebased on top of arm-soc/next/cleanup
>   - Split the flat device tree into several files. Although some
>     commonality still remains in the main .dts file with other
>     devices trees (see psci node) it is not clear what benefits can
>     be gained from moving such a small node into its own file.
>   - Ordered nodes according to their address space
>   - Removed ulpi_phy node as it was redundant and the bindings non-st=
andard.
>=20
> v2 version: http://lkml.org/lkml/2014/11/10/242
>=20
> Best regards,
> Liviu
>=20
> Liviu Dudau (2):
>   arm64: Create link to include/dt-bindings to enable C preprocessor
>     use.
>   arm64: Add Juno board device tree.
>=20
>  arch/arm64/boot/dts/arm/Makefile              |   1 +
>  arch/arm64/boot/dts/arm/juno-clocks.dtsi      |  45 ++++++
>  arch/arm64/boot/dts/arm/juno-motherboard.dtsi | 129 +++++++++++++++
>  arch/arm64/boot/dts/arm/juno.dts              | 218 ++++++++++++++++=
++++++++++
>  arch/arm64/boot/dts/include/dt-bindings       |   1 +
>  5 files changed, 394 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/arm/juno-clocks.dtsi
>  create mode 100644 arch/arm64/boot/dts/arm/juno-motherboard.dtsi
>  create mode 100644 arch/arm64/boot/dts/arm/juno.dts
>  create mode 120000 arch/arm64/boot/dts/include/dt-bindings
>=20
> --=20
> 2.1.3
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
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
