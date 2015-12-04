From: xuejiancheng <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 4/9] ARM: dts: add dts files for hi3519-demb board
Date: Fri, 4 Dec 2015 10:27:58 +0800
Message-ID: <5660FA2E.6040601@huawei.com>
References: <1449110668-23647-1-git-send-email-xuejiancheng@huawei.com>
 <1728470.0OiiXMcl88@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1728470.0OiiXMcl88@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,
   Thank you very much for all your comments.

On 2015/12/3 17:36, Arnd Bergmann wrote:
> On Thursday 03 December 2015 10:44:28 Jiancheng Xue wrote:
>=20
>> +
>> +/dts-v1/;
>> +#include "hi3519.dtsi"
>> +
>> +/ {
>> +	model =3D "HiSilicon HI3519 DEMO Board";
>> +	compatible =3D "hisilicon,hi3519";
>> +
>> +	chosen {
>> +		bootargs =3D "mem=3D64M console=3DttyAMA0,115200 early_printk \
>> +root=3D/dev/mtdblock2 rootfstype=3Djffs2 \
>> +mtdparts=3Dhi_sfc:1M(boot),4M(kernel),11M(rootfs)";
>> +	};
>=20
> Most of the arguments should be dropped and replaced with the respect=
ive
> DT properties in this file:
>=20
> mem:		/memory (you have that already, but the size seems wrong)
> console:	/chosen/stdout-path
> early_printk:	just drop this, maybe use "earlycon")
> root:		this one is fine
> rootfstype:	should not be needed
> mtdparts:	use nodes below the MTD device
>=20

This chosen node is just for debug. The real parameters will be set at =
boot stage.
I will drop it.

>> +
>> +#include "skeleton.dtsi"
>> +#include <dt-bindings/clock/hi3519-clock.h>
>> +/ {
>> +	aliases {
>> +		serial0 =3D &uart0;
>> +	};
>=20
> Move this into the .dts file.

OK. Thank you.

>=20
>> +
>> +			uart0: uart@12100000 {
>=20
> rename to serial@12100000

OK.

>=20
>> +			dual_timer1: dual_timer@12001000 {
>> +				compatible =3D "arm,sp804", "arm,primecell";
>> +				interrupts =3D <0 66 4>, <0 67 4>;
>> +				reg =3D <0x12001000 0x1000>;
>> +				clocks =3D <&crg HI3519_FIXED_3M>;
>> +				status =3D "disable";
>> +			};
>=20
> rename to timer@12001000

OK.

>=20
>> +		sysctrl: system-controller@12020000 {
>> +			compatible =3D "hisilicon,sysctrl";
>> +			reg =3D <0x12020000 0x1000>;
>> +			reboot-offset =3D <0x4>;
>> +		};
>=20
> Is this one identical to the one in hip04?
>=20
> If not, pick a new unique compatible string

Yes. It's compatible with the one in hip04.

>=20
>> +
>> +		crg: crg@12010000 {
>> +			compatible =3D "hisilicon,hi3519-crg";
>=20
>=20
> what is a "crg"? Is there a standard name for these?

The "crg" means Clock and Reset Generator. It's a block which supplies =
clock
and reset signals for other modules in the chip. I used "hi3519-clock"
in last version patch. Rob Herring suggested that it's better to use "h=
i3519-crg"
as the compatible string if it's a whole block.

what about writing like this=EF=BC=9F

crg: clock-reset-controller@12010000 {
	compatible =3D "hisilicon,hi3519-crg";
	}

>=20
> 	Arnd
>=20
> .
>=20

Jiancheng
=2E

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
