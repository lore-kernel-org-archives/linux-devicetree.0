From: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Subject: Re: [PATCH 2/2] bmips: add device tree example for BCM6358
Date: Sun, 21 Feb 2016 12:27:52 +0100
Message-ID: <56C99F38.2070709@gmail.com>
References: <1453030101-14794-2-git-send-email-noltari@gmail.com>
 <20160120165910.GA32520@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
        format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20160120165910.GA32520@rob-hp-laptop>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Rob Herring <robh@kernel.org>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, jogo@openwrt.org, cernekee@gmail.com
List-Id: devicetree@vger.kernel.org


El 20/01/2016 a las 17:59, Rob Herring escribi=F3:
> On Sun, Jan 17, 2016 at 12:28:21PM +0100, =C1lvaro Fern=E1ndez Rojas =
wrote:
>> This adds a device tree example for SFR Neufbox4 (Sercomm version), =
which
>> also serves as a real example for brcm,bcm6358-leds.
>>
>> Signed-off-by: =C1lvaro Fern=E1ndez Rojas <noltari@gmail.com>
> [...]
>
>> diff --git a/arch/mips/boot/dts/brcm/bcm6358.dtsi
> b/arch/mips/boot/dts/brcm/bcm6358.dtsi
>> new file mode 100644
>> index 0000000..b2d11da
>> --- /dev/null
>> +++ b/arch/mips/boot/dts/brcm/bcm6358.dtsi
>> @@ -0,0 +1,111 @@
>> +/ {
>> +	#address-cells =3D <1>;
>> +	#size-cells =3D <1>;
>> +	compatible =3D "brcm,bcm6358";
>> +
>> +	cpus {
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +
>> +		mips-hpt-frequency =3D <150000000>;
>> +
>> +		cpu@0 {
>> +			compatible =3D "brcm,bmips4350";
>> +			device_type =3D "cpu";
>> +			reg =3D <0>;
>> +		};
>> +
>> +		cpu@1 {
>> +			compatible =3D "brcm,bmips4350";
>> +			device_type =3D "cpu";
>> +			reg =3D <1>;
>> +		};
>> +	};
>> +
>> +	clocks {
>> +		periph_clk: periph_clk {
>> +			compatible =3D "fixed-clock";
>> +			#clock-cells =3D <0>;
>> +			clock-frequency =3D <50000000>;
>> +		};
>> +	};
>> +
>> +	aliases {
>> +		leds0 =3D &leds0;
> Why do we need alias for LEDs?
Okay, I will remove this, but you should know it was accepted for=20
BCM6328 and BCM6368 too:
http://git.linux-mips.org/cgit/sjhill/linux-sjhill.git/commit/arch/mips=
/boot/dts/brcm?h=3Dmips-for-linux-next&id=3Ddb66dbbbfd8ded204a97d090357=
aff582968fcf5
http://git.linux-mips.org/cgit/sjhill/linux-sjhill.git/commit/arch/mips=
/boot/dts/brcm?h=3Dmips-for-linux-next&id=3D70ce14bfc9fdb9b6af84ac492e9=
d3311551618a5
>
>> +		uart0 =3D &uart0;
>> +		uart1 =3D &uart1;
>> +	};
> [...]
>
>> diff --git a/arch/mips/boot/dts/brcm/bcm96358nb4ser.dts b/arch/mips/=
boot/dts/brcm/bcm96358nb4ser.dts
>> new file mode 100644
>> index 0000000..ca95084
>> --- /dev/null
>> +++ b/arch/mips/boot/dts/brcm/bcm96358nb4ser.dts
>> @@ -0,0 +1,47 @@
>> +/dts-v1/;
>> +
>> +/include/ "bcm6358.dtsi"
>> +
>> +/ {
>> +	compatible =3D "sfr,nb4-ser", "brcm,bcm6358";
>> +	model =3D "SFR Neufbox 4 (Sercomm)";
>> +
>> +	memory@0 {
>> +		device_type =3D "memory";
>> +		reg =3D <0x00000000 0x02000000>;
>> +	};
>> +
>> +	chosen {
>> +		bootargs =3D "console=3DttyS0,115200";
>> +		stdout-path =3D &uart0;
> You shouldn't need both here. Just stdout-path.
Okay, I will use stdout-path only, but once again you should know that=20
both are used on every bmips board:
https://github.com/torvalds/linux/tree/master/arch/mips/boot/dts/brcm
https://github.com/torvalds/linux/blob/master/arch/mips/boot/dts/brcm/b=
cm93384wvg.dts#L9
=2E..
https://github.com/torvalds/linux/blob/master/arch/mips/boot/dts/brcm/b=
cm9ejtagprb.dts#L14
>
> Rob
=C1lvaro.
