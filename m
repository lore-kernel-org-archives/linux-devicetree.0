From: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] MIPS: BMIPS: Add support SPI device nodes
Date: Wed, 28 Dec 2016 16:39:20 +0900
Message-ID: <8BB6A4C9-96EF-42E1-8144-808B9C70E8EE@gmail.com>
References: <20161227015923.882-1-jaedon.shin@gmail.com>
 <20161227015923.882-3-jaedon.shin@gmail.com>
 <0dffeca2-68bf-bacd-7eff-8b966c721dde@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0dffeca2-68bf-bacd-7eff-8b966c721dde-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


> On 28 Dec 2016, at 7:12 AM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
>=20
> On 12/26/2016 05:59 PM, Jaedon Shin wrote:
>> Adds SPI device nodes to BCM7xxx MIPS based SoCs.
>>=20
>> Signed-off-by: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> arch/mips/boot/dts/brcm/bcm7125.dtsi      | 55 =
+++++++++++++++++++++++++++++--
>> arch/mips/boot/dts/brcm/bcm7346.dtsi      | 49 =
+++++++++++++++++++++++++++
>> arch/mips/boot/dts/brcm/bcm7358.dtsi      | 49 =
+++++++++++++++++++++++++++
>> arch/mips/boot/dts/brcm/bcm7360.dtsi      | 49 =
+++++++++++++++++++++++++++
>> arch/mips/boot/dts/brcm/bcm7362.dtsi      | 49 =
+++++++++++++++++++++++++++
>> arch/mips/boot/dts/brcm/bcm7420.dtsi      | 55 =
+++++++++++++++++++++++++++++--
>> arch/mips/boot/dts/brcm/bcm7425.dtsi      | 49 =
+++++++++++++++++++++++++++
>> arch/mips/boot/dts/brcm/bcm7435.dtsi      | 49 =
+++++++++++++++++++++++++++
>> arch/mips/boot/dts/brcm/bcm97125cbmb.dts  |  4 +++
>> arch/mips/boot/dts/brcm/bcm97346dbsmb.dts |  4 +++
>> arch/mips/boot/dts/brcm/bcm97358svmb.dts  | 36 ++++++++++++++++++++
>> arch/mips/boot/dts/brcm/bcm97360svmb.dts  | 36 ++++++++++++++++++++
>> arch/mips/boot/dts/brcm/bcm97362svmb.dts  |  4 +++
>> arch/mips/boot/dts/brcm/bcm97420c.dts     |  4 +++
>> arch/mips/boot/dts/brcm/bcm97425svmb.dts  | 36 ++++++++++++++++++++
>> arch/mips/boot/dts/brcm/bcm97435svmb.dts  |  4 +++
>> 16 files changed, 526 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/arch/mips/boot/dts/brcm/bcm7125.dtsi =
b/arch/mips/boot/dts/brcm/bcm7125.dtsi
>> index bbd00f65ce39..c1e19e57f64a 100644
>> --- a/arch/mips/boot/dts/brcm/bcm7125.dtsi
>> +++ b/arch/mips/boot/dts/brcm/bcm7125.dtsi
>> @@ -46,6 +46,12 @@
>> 			#clock-cells =3D <0>;
>> 			clock-frequency =3D <27000000>;
>> 		};
>> +
>> +		spi_clk: spi_clk {
>> +			compatible =3D "fixed-clock";
>> +			#clock-cells =3D <0>;
>> +			clock-frequency =3D <27000000>;
>> +		};
>=20
> Nit, this should actually be upg_clk, since this is the clock that the
> SPI controller uses, and it is a fixed-clock with a 27Mhz frequency.
>=20
> Other than that, the rest looks good to me, thanks!
> --=20
> Florian

I will change the qspi uses upg_clk in v2.

Thanks,
Jaedon

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
