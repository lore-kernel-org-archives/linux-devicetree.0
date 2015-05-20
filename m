From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v2 0/5]  arm64: Juno DT updates and new DT for Juno R1
Date: Wed, 20 May 2015 11:47:52 +0100
Message-ID: <20150520104752.GM2175@e106497-lin.cambridge.arm.com>
References: <1431970109-8902-1-git-send-email-Liviu.Dudau@arm.com>
 <555B1A77.9070403@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <555B1A77.9070403@arm.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, "Jon Medhurst (Tixy)" <tixy@linaro.org>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <Marc.Zyngier@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, devicetree <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 19, 2015 at 12:11:51PM +0100, Sudeep Holla wrote:
>=20
>=20
> On 18/05/15 18:28, Liviu Dudau wrote:
> > This series restructures the Juno DT files and introduces the DT
> > for the new Juno R1. The board is an update of the Juno R0 with
> > support for PCIe, but the current series only brings the board to
> > parity with Juno R0. The series that enable the PCIe Generic Host
> > Bridge to be used on Juno R1 will be posted separately.
> >
> > Changes from v1:
> >   - Moved memory node inside juno-base.dtsi as this is common betwe=
en
> >     boards and unlikely to change soon.
> >   - Added "arm,juno-r1" as compatible string in juno-r1.dts at Jon =
Medhurst's
> >     suggestion.
>=20
> It would be good to add these juno* compatible somewhere in the bindi=
ng
> document. In past I have seen checkpatch complaining about missing
> compatibles on vexpress(which is annoying if you are not adding it
> but fixing a bug around existing node).

How about something like this:


8<---------------------------------------------------------------------=
------
=46rom 55b575f3d0888e6134c492b66a3fa12c9cceca02 Mon Sep 17 00:00:00 200=
1
=46rom: Liviu Dudau <Liviu.Dudau@arm.com>
Date: Wed, 20 May 2015 11:42:37 +0100
Subject: [PATCH] Documentation: bindings: Add DT bindings for ARM Juno =
boards.

List the required properties and nodes used to describe the
ARM Juno boards.

Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
---
 Documentation/devicetree/bindings/arm/arm-boards | 66 ++++++++++++++++=
++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm-boards b/Documen=
tation/devicetree/bindings/arm/arm-boards
index b78564b..1a70997 100644
--- a/Documentation/devicetree/bindings/arm/arm-boards
+++ b/Documentation/devicetree/bindings/arm/arm-boards
@@ -157,3 +157,69 @@ Example:
=20
 	};
 };
+
+ARM Versatile Express Boards
+-----------------------------
+For details on the device tree bindings for ARM Versatile Express boar=
ds
+please consult the vexpress.txt file in the same directory as this fil=
e.
+
+ARM Juno Boards
+----------------
+The Juno boards are targeting development for AArch64 systems. The fir=
st
+iteration, Juno r0, is a vehicle for evaluating big.LITTLE on AArch64,
+with the second iteration, Juno r1, mainly aimed at development of PCI=
e
+based systems. Juno r1 also has support for AXI masters placed on the =
TLX
+connectors to join the coherency domain.
+
+Juno boards are described in a similar way to ARM Versatile Express bo=
ards,
+with the motherboard part of the hardware being described in a separat=
e file
+to highlight the fact that is part of the support infrastructure for t=
he SoC.
+Juno device tree bindings also share the Versatile Express bindings as
+described under the RS1 memory mapping.
+
+Required properties (in root node):
+	compatible =3D "arm,juno";	/* For Juno r0 board */
+	compatible =3D "arm,juno-r1";	/* For Juno r1 board */
+
+Required nodes:
+The description for the board must include:
+   - a "psci" node describing the boot method used for the secondary C=
PUs.
+     A detailed description of the bindings used for "psci" nodes is p=
resent
+     in the psci.txt file.
+   - a "cpus" node describing the available cores and their associated
+     "enable-method"s. For more details see cpus.txt file.
+
+Example:
+
+/dts-v1/;
+/ {
+	model =3D "ARM Juno development board (r0)";
+	compatible =3D "arm,juno", "arm,vexpress";
+	interrupt-parent =3D <&gic>;
+	#address-cells =3D <2>;
+	#size-cells =3D <2>;
+
+	cpus {
+		#address-cells =3D <2>;
+		#size-cells =3D <0>;
+
+		A57_0: cpu@0 {
+			compatible =3D "arm,cortex-a57","arm,armv8";
+			reg =3D <0x0 0x0>;
+			device_type =3D "cpu";
+			enable-method =3D "psci";
+		};
+
+		.....
+
+		A53_0: cpu@100 {
+			compatible =3D "arm,cortex-a53","arm,armv8";
+			reg =3D <0x0 0x100>;
+			device_type =3D "cpu";
+			enable-method =3D "psci";
+		};
+
+		.....
+	};
+
+};
--=20
2.4.0

>8---------------------------------------------------------------------=
------

>=20
> Otherwise the whole series looks good to me. So feel free to add
>=20
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>

Thanks,
Liviu

>=20
> Regards,
> Sudeep
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
