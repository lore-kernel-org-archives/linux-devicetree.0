From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v4 2/4] arm64: dts: Add Qualcomm MSM8916 SoC and evaluation board dts
Date: Fri, 13 Mar 2015 10:50:42 -0500
Message-ID: <04AD8E46-277D-4652-88AF-D16538C2AA87@codeaurora.org>
References: <1426182985-10425-1-git-send-email-galak@codeaurora.org> <20150313105207.GB3592@leverpostej>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20150313105207.GB3592@leverpostej>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "heiko@sntech.de" <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org


On Mar 13, 2015, at 5:52 AM, Mark Rutland <mark.rutland@arm.com> wrote:

>> +/ {
>> +	chosen {
>> +		stdout-path =3D &blsp1_uart2;
>> +	};
>=20
> It would be good if we had the configuration too (see
> Documentation/devicetree/bindings/chosen.txt), as that avoids any
> reliance on kernel defaults.
>=20
> You can refer to an alias, so this could be:
>=20
> aliases {
> 	serial0 =3D &blsp1_uart2;
> };
>=20
> chosen {
> 	stdout-path =3D "serial0:115200n8";
> };
>=20
> ...assuming that 115200n8 is correct for your UART, of course.
>=20
>=20
> [=85]

Where is the code that actually handles this parsing?  I=92m not see it=
 in early_init_dt_scan_chosen_serial and I don=92t believe fdt_path_off=
set does anything special with =91:'

>=20
>> +#include "skeleton.dtsi"
>=20
> I'd like to get rid of skeleton.dtsi; it causes more problems than it
> solves (the address/size cells mismatch is confusing and hidden, peop=
le
> forget to fill in memory nodes appropriately, etc).
>=20
> Please remove this include and place appropriate #address-cells and #=
size-cells here.
>=20
> I'd strongly recommend going with /#size-cells =3D <2>; it' will save=
 on a
> lot of pain if you need to add PCIe or something with large ranges
> later. If things all fall in 4GB within the SoC then have
> /soc/#size=3Dcells =3D <1> and an appropriate /soc/ranges property.
>=20
> I note this DT doesn't have any memory nodes. Is that an accident or
> does the loader fill that in?

it was coming out of skeleton.dtsi

>=20
> If the latter, have an empty node with a comment to that effect.

I=92ll kill off usage of skeleton.dtsi

- k
--=20
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora For=
um,
a Linux Foundation Collaborative Project
