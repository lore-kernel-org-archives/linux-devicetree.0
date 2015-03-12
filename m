From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: Add Qualcomm MSM8916 SoC and
 evaluation board dts
Date: Thu, 12 Mar 2015 18:25:09 +0000
Message-ID: <20150312182508.GF30145@leverpostej>
References: <1426107080-29079-1-git-send-email-galak@codeaurora.org>
 <1426107080-29079-2-git-send-email-galak@codeaurora.org>
 <20150312170541.GE30145@leverpostej>
 <E114AF0E-5DA9-412A-B3E2-DDD95D224C66@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E114AF0E-5DA9-412A-B3E2-DDD95D224C66@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "heiko@sntech.de" <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

> >> +	cpus {
> >> +		#address-cells =3D <1>;
> >> +		#size-cells =3D <0>;
> >> +
> >> +		CPU0: cpu@0 {
> >> +			device_type =3D "cpu";
> >> +			compatible =3D "arm,cortex-a53", "arm,armv8";
> >> +			reg =3D <0x0>;
> >> +		};
> >> +
> >> +		CPU1: cpu@1 {
> >> +			device_type =3D "cpu";
> >> +			compatible =3D "arm,cortex-a53", "arm,armv8";
> >> +			reg =3D <0x1>;
> >> +		};
> >> +
> >> +		CPU2: cpu@2 {
> >> +			device_type =3D "cpu";
> >> +			compatible =3D "arm,cortex-a53", "arm,armv8";
> >> +			reg =3D <0x2>;
> >> +		};
> >> +
> >> +		CPU3: cpu@3 {
> >> +			device_type =3D "cpu";
> >> +			compatible =3D "arm,cortex-a53", "arm,armv8";
> >> +			reg =3D <0x3>;
> >> +		};
> >> +	};
> >=20
> > The secondary CPUs need an enable-method. Are you using PSCI or
> > spin-table?
>=20
> This is on purpose.  We aren=E2=80=99t using either PSCI or spin-tabl=
e.  Right
> now the dts is for booting on a single core.  I can drop CPU1..CPU3 i=
f
> that helps.

We won't poke the CPUs without an enable-method, so personally I'm not
too worried either way about having the CPUs listed.

Which of spin-table/psci are you planning on using for SMP support, and
when would that be likely to appear?

Which exception level do CPUs enter the kernel? Even without a
virt-capable GIC booting at EL2 is less work for the FW and gives the
kernel a better chance of fixing things up (e.g. CNTVOFF).

Thanks,
Mark.
