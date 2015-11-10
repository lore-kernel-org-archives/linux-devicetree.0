From: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: add SMP enable-method for Broadcom
 NSP
Date: Tue, 10 Nov 2015 21:37:58 +0530
Message-ID: <5642165E.1080408@broadcom.com>
References: <1446844273-6460-1-git-send-email-kapilh@broadcom.com>
 <1446844273-6460-2-git-send-email-kapilh@broadcom.com>
 <563E6FC7.6070700@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <563E6FC7.6070700-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Florian,

On 11/8/2015 3:10 AM, Florian Fainelli wrote:
> Le 06/11/2015 13:11, Kapil Hali a =C3=A9crit :
>> Add a compatible string "brcm,bcm-nsp-smp" for Broadcom's
>> Northstar Plus CPU to the 32-bit ARM CPU device tree binding
>> documentation file and create a new binding documentation for
>> Northstar Plus CPU.
>>
>> Signed-off-by: Kapil Hali <kapilh-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> ---
>>  .../bindings/arm/bcm/brcm,nsp-cpu-method.txt       | 36 +++++++++++=
+++++++++++
>>  Documentation/devicetree/bindings/arm/cpus.txt     |  1 +
>>  2 files changed, 37 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,n=
sp-cpu-method.txt
>>
>> diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-=
method.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-met=
hod.txt
>> new file mode 100644
>> index 0000000..8506da7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method.=
txt
>> @@ -0,0 +1,36 @@
>> +Broadcom Northstar Plus SoC CPU Enable Method
>> +---------------------------------------------
>> +This binding defines the enable method used for starting secondary
>> +CPUs in the following Broadcom SoCs:
>> +  BCM58522, BCM58525, BCM58535, BCM58622, BCM58623, BCM58625, BCM88=
312
>> +
>> +The enable method is specified by defining the following required
>> +properties in the "cpus" device tree node:
>> +  - enable-method =3D "brcm,bcm-nsp-smp";
>> +  - secondary-boot-reg =3D <...>;
>> +
>> +The secondary-boot-reg property is a u32 value that specifies the
>> +physical address of the register used to request the ROM holding pe=
n
>> +code release a secondary CPU.
>=20
> Is it really how the ROM code is implemented, as a pen holding/releas=
e
> mechanism (which sounds like how this was implemented previously in t=
he
> kernel actually) or should this be described in a more generic way as
> the physical address of the register where the secondary CPUs reset
> vector address must be written to? Or something along these lines.
>=20
I overlooked this patch and didn't change the description. It is a phys=
ical
address of a register which holds the address of the secondary core's e=
ntry=20
point.

>> +
>> +Example:
>> +	cpus {
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +		enable-method =3D "brcm,bcm-nsp-smp";
>=20
> Just a nit, but if NSP and NS are sharing the same mechanism, would n=
ot
> a more "NS-centric" property be more appropriate because NS came befo=
re NSP?
>=20
>> +		secondary-boot-reg =3D <0xffff042c>;
>> +
>> +		cpu0: cpu@0 {
>> +			device_type =3D "cpu";
>> +			compatible =3D "arm,cortex-a9";
>> +			next-level-cache =3D <&L2>;
>> +			reg =3D <0>;
>> +		};
>> +
>> +		cpu1: cpu@1 {
>> +			device_type =3D "cpu";
>> +			compatible =3D "arm,cortex-a9";
>> +			next-level-cache =3D <&L2>;
>> +			reg =3D <1>;
>> +		};
>> +	};
>> diff --git a/Documentation/devicetree/bindings/arm/cpus.txt b/Docume=
ntation/devicetree/bindings/arm/cpus.txt
>> index 91e6e5c..6abe3f3 100644
>> --- a/Documentation/devicetree/bindings/arm/cpus.txt
>> +++ b/Documentation/devicetree/bindings/arm/cpus.txt
>> @@ -191,6 +191,7 @@ nodes to be present and contain the properties d=
escribed below.
>>  			    "allwinner,sun8i-a23"
>>  			    "arm,psci"
>>  			    "brcm,brahma-b15"
>> +			    "brcm,bcm-nsp-smp"
>>  			    "marvell,armada-375-smp"
>>  			    "marvell,armada-380-smp"
>>  			    "marvell,armada-390-smp"
>>
>=20
>=20

Thanks,
Kapil Hali

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
