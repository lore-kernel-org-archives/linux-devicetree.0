From: Troy Benjegerdes <troy.benjegerdes@sifive.com>
Subject: Re: [PATCH v2] riscv: dts: Add DT node for SiFive FU540 Ethernet
 controller driver
Date: Sat, 22 Jun 2019 13:15:33 -0500
Message-ID: <24385C38-D1FC-46B0-8AAA-0FB0B371784A@sifive.com>
References: <1561114429-29612-1-git-send-email-yash.shah@sifive.com>
 <1561114429-29612-2-git-send-email-yash.shah@sifive.com>
 <18c7992607dd1fed062bd295ac0738a759eff078.camel@wdc.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <18c7992607dd1fed062bd295ac0738a759eff078.camel@wdc.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Atish Patra <Atish.Patra@wdc.com>, "yash.shah@sifive.com" <yash.shah@sifive.com>
Cc: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "sachin.ghadi@sifive.com" <sachin.ghadi@sifive.com>, "palmer@sifive.com" <palmer@sifive.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
List-Id: devicetree@vger.kernel.org



> On Jun 21, 2019, at 2:14 PM, Atish Patra <Atish.Patra@wdc.com> wrote:
>=20
> On Fri, 2019-06-21 at 16:23 +0530, Yash Shah wrote:
>> DT node for SiFive FU540-C000 GEMGXL Ethernet controller driver added
>>=20
>> Signed-off-by: Yash Shah <yash.shah@sifive.com>
>> ---
>> arch/riscv/boot/dts/sifive/fu540-c000.dtsi          | 16
>> ++++++++++++++++
>> arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts |  9 +++++++++
>> 2 files changed, 25 insertions(+)
>>=20
>> diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
>> b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
>> index 4e8fbde..c53b4ea 100644
>> --- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
>> +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
>> @@ -225,5 +225,21 @@
>> 			#address-cells =3D <1>;
>> 			#size-cells =3D <0>;
>> 		};
>> +		eth0: ethernet@10090000 {
>> +			compatible =3D "sifive,fu540-macb";
>> +			interrupt-parent =3D <&plic0>;
>> +			interrupts =3D <53>;
>> +			reg =3D <0x0 0x10090000 0x0 0x2000
>> +			       0x0 0x100a0000 0x0 0x1000>;
>> +			reg-names =3D "control";
>> +			status =3D "disabled";
>> +			local-mac-address =3D [00 00 00 00 00 00];
>> +			clock-names =3D "pclk", "hclk";
>> +			clocks =3D <&prci PRCI_CLK_GEMGXLPLL>,
>> +				 <&prci PRCI_CLK_GEMGXLPLL>;
>> +			#address-cells =3D <1>;
>> +			#size-cells =3D <0>;
>> +		};
>> +
>> 	};
>> };
>> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
>> b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
>> index 4da8870..d783bf2 100644
>> --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
>> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
>> @@ -63,3 +63,12 @@
>> 		disable-wp;
>> 	};
>> };
>> +
>> +&eth0 {
>> +	status =3D "okay";
>> +	phy-mode =3D "gmii";
>> +	phy-handle =3D <&phy1>;
>> +	phy1: ethernet-phy@0 {
>> +		reg =3D <0>;
>> +	};
>> +};
>=20
> Thanks. I am able to boot Unleashed with networking enabled with this
> patch.
>=20
> FWIW,=20
> Tested-by: Atish Patra <atish.patra@wdc.com>
>=20
> Regards,
> Atish

I am able to boot using a build from the dev/new-dts branch of
my freedom-u-sdk development tree [1] which has this patch
with an additional reset-gpios entry for the ethernet phy in the
DTS provided by the legacy U-boot[2].

Tested-by: Troy Benjegerdes <troy.benjegerdes@sifive.com>

[1] https://github.com/tmagik/freedom-u-sdk=20
[2] =
https://github.com/sifive/HiFive_U-Boot/blob/081373fa3eb0ca79ba3f4a703e8e8=
3a15135a6d1/arch/riscv/dts/hifive_u540.dts#L73=
