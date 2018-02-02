From: Jolly Shah <JOLLYS@xilinx.com>
Subject: RE: [PATCH v3 1/4] dt-bindings: firmware: Add bindings for ZynqMP
 firmware
Date: Fri, 2 Feb 2018 19:50:05 +0000
Message-ID: <DM2PR0201MB0767C06A1B7A47DB79723C96B8F90@DM2PR0201MB0767.namprd02.prod.outlook.com>
References: <1516836074-4149-1-git-send-email-jollys@xilinx.com>
 <1516836074-4149-2-git-send-email-jollys@xilinx.com>
 <20180131180354.mqf4gvvprdtycbn5@lakrids.cambridge.arm.com>
 <CY1PR0201MB076454E915A6E6947A39F04BB8FA0@CY1PR0201MB0764.namprd02.prod.outlook.com>
 <20180201102730.33q4xrjw3vhrgk4i@lakrids.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180201102730.33q4xrjw3vhrgk4i@lakrids.cambridge.arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "mingo@kernel.org" <mingo@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "matt@codeblueprint.co.uk" <matt@codeblueprint.co.uk>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "keescook@chromium.org" <keescook@chromium.org>, "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rajan Vaja <RAJANV@xilinx.com>
List-Id: devicetree@vger.kernel.org

Hi Mark,

> -----Original Message-----
> From: Mark Rutland [mailto:mark.rutland@arm.com]
> Sent: Thursday, February 01, 2018 2:28 AM
> To: Jolly Shah <JOLLYS@xilinx.com>
> Cc: ard.biesheuvel@linaro.org; mingo@kernel.org;
> gregkh@linuxfoundation.org; matt@codeblueprint.co.uk;
> sudeep.holla@arm.com; hkallweit1@gmail.com; keescook@chromium.org;
> dmitry.torokhov@gmail.com; michal.simek@xilinx.com; robh+dt@kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; Rajan Vaja <RAJANV@xilinx.com>
> Subject: Re: [PATCH v3 1/4] dt-bindings: firmware: Add bindings for ZynqM=
P
> firmware
>=20
> On Thu, Feb 01, 2018 at 01:04:45AM +0000, Jolly Shah wrote:
> > > > +Xilinx Zynq MPSoC Firmware Device Tree Bindings
> > > > +
> > > > +The zynqmp-firmware node describes the interface to platform firmw=
are.
> > >
> > > Is there any documentation for this that can be referred to?
> > >
> >
> > Will add more information about supported APIs in next version patch.
> > Below document describes interface APIs though it is not latest.
> > https://www.xilinx.com/support/documentation/user_guides/ug1200-eemi-a
> > pi.pdf
>=20
> Thanks for the link.
>=20
> It might be better for the compatible string to be "xlnx,zynqmp-eemi", to=
 make it
> clear which firmware interfaces are being described, assuming that this b=
eing is
> only intended to cover EEMI.
>=20
> Thanks,
> Mark.

It is interface to firmware be it ATF/PMU. EEMI is part of it.=20

Thanks,
Jolly Shah
