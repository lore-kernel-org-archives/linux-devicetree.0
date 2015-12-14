From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 13/14] ARM: dts: dove: add DT GPU support
Date: Mon, 14 Dec 2015 14:56:41 +0100
Message-ID: <87twnlw2ue.fsf@free-electrons.com>
References: <1449661707-30532-1-git-send-email-l.stach@pengutronix.de>
	<1449661707-30532-13-git-send-email-l.stach@pengutronix.de>
	<1450099862.3163.38.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450099862.3163.38.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> (Lucas Stach's message
	of "Mon, 14 Dec 2015 14:31:02 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lucas,
=20
 On lun., d=C3=A9c. 14 2015, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote=
:

> Dove maintainers,
>
> can you please tell me if you prefer the DT changes to go along with =
the
> rest of the etnaviv series through the DRM tree, or plan on picking t=
his
> separate?

I prefer to take the DT change in the mvebu tree. I was waiting for
acknowledgment on this series from the DRM maintainers to be sure that
the binding was OK. However, the fact that Rob Herring already acked th=
e
binding is a good point for me.

Gregory


>
> Regards,
> Lucas
>
> Am Mittwoch, den 09.12.2015, 12:48 +0100 schrieb Lucas Stach:
>> From: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
>>=20
>> Add DT support for the Vivante GC600 GPU on Marvell Dove platforms.
>> These nodes default to being disabled unless a platform decides they
>> should be enabled.
>>=20
>> Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
>> Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/dove.dtsi | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dt=
si
>> index cd58c2e62757..ea1d999ca7a7 100644
>> --- a/arch/arm/boot/dts/dove.dtsi
>> +++ b/arch/arm/boot/dts/dove.dtsi
>> @@ -33,6 +33,12 @@
>>  		marvell,tauros2-cache-features =3D <0>;
>>  	};
>> =20
>> +	gpu-subsystem {
>> +		compatible =3D "marvell,dove-gpu-subsystem";
>> +		cores =3D <&gpu>;
>> +		status =3D "disabled";
>> +	};
>> +
>>  	i2c-mux {
>>  		compatible =3D "i2c-mux-pinctrl";
>>  		#address-cells =3D <1>;
>> @@ -776,6 +782,16 @@
>>  				#address-cells =3D <1>;
>>  				#size-cells =3D <1>;
>>  			};
>> +
>> +			gpu: gpu@840000 {
>> +				clocks =3D <&divider_clk 1>;
>> +				clock-names =3D "core";
>> +				compatible =3D "vivante,gc";
>> +				interrupts =3D <48>;
>> +				power-domains =3D <&gpu_domain>;
>> +				reg =3D <0x840000 0x4000>;
>> +				status =3D "disabled";
>> +			};
>>  		};
>>  	};
>>  };
>
> --=20
> Pengutronix e.K.             | Lucas Stach                 |
> Industrial Linux Solutions   | http://www.pengutronix.de/  |
>

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
