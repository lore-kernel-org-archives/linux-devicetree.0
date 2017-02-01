From: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: Re: [PATCH v2] EDAC: mpc85xx: Add T2080 l2-cache support
Date: Wed, 1 Feb 2017 23:46:23 +0000
Message-ID: <01fe1af463c640a8bd48e45c2752b52c@svr-chch-ex1.atlnz.lc>
References: <20170201231624.28843-1-chris.packham@alliedtelesis.co.nz>
 <20170201232735.byk7bnpeoqtcc7mh@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: "linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "morbidrsa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <morbidrsa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/02/17 12:28, Borislav Petkov wrote:=0A=
> On Thu, Feb 02, 2017 at 12:16:24PM +1300, Chris Packham wrote:=0A=
>> The l2-cache controller on the T2080 SoC has similar capabilities to the=
=0A=
>> others already supported by the mpc85xx_edac driver. Add it to the list=
=0A=
>> of compatible devices.=0A=
>>=0A=
>> Signed-off-by: Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>=0A=
>> Acked-by: Johannes Thumshirn <jth-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>=0A=
>> ---=0A=
>> This is a resend of a patch that got an ack[1] but didn't seem to get=0A=
>> picked up.=0A=
>>=0A=
>> [1] http://marc.info/?l=3Dlinux-edac&m=3D148042072225488&w=3D2=0A=
>>=0A=
>> Changes since v1:=0A=
>> - Collect ack from Johannes.=0A=
>=0A=
> Whoops, my bad. Sorry about that.=0A=
>=0A=
>>  arch/powerpc/boot/dts/fsl/t2081si-post.dtsi | 1 +=0A=
>>  drivers/edac/mpc85xx_edac.c                 | 1 +=0A=
>>  2 files changed, 2 insertions(+)=0A=
>>=0A=
>> diff --git a/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi b/arch/powerpc/=
boot/dts/fsl/t2081si-post.dtsi=0A=
>> index c744569a20e1..a97296c64eb2 100644=0A=
>> --- a/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi=0A=
>> +++ b/arch/powerpc/boot/dts/fsl/t2081si-post.dtsi=0A=
>> @@ -678,5 +678,6 @@=0A=
>>  		compatible =3D "fsl,t2080-l2-cache-controller";=0A=
>>  		reg =3D <0xc20000 0x40000>;=0A=
>>  		next-level-cache =3D <&cpc>;=0A=
>> +		interrupts =3D <16 2 1 9>;=0A=
>>  	};=0A=
>>  };=0A=
>> diff --git a/drivers/edac/mpc85xx_edac.c b/drivers/edac/mpc85xx_edac.c=
=0A=
>> index 8f66cbed70b7..67f7bc3fe5b3 100644=0A=
>> --- a/drivers/edac/mpc85xx_edac.c=0A=
>> +++ b/drivers/edac/mpc85xx_edac.c=0A=
>> @@ -629,6 +629,7 @@ static const struct of_device_id mpc85xx_l2_err_of_m=
atch[] =3D {=0A=
>>  	{ .compatible =3D "fsl,p1020-l2-cache-controller", },=0A=
>>  	{ .compatible =3D "fsl,p1021-l2-cache-controller", },=0A=
>>  	{ .compatible =3D "fsl,p2020-l2-cache-controller", },=0A=
>> +	{ .compatible =3D "fsl,t2080-l2-cache-controller", },=0A=
>=0A=
> WARNING: DT compatible string "fsl,t2080-l2-cache-controller" appears un-=
documented -- check ./Documentation/devicetree/bindings/=0A=
> #58: FILE: drivers/edac/mpc85xx_edac.c:632:=0A=
> +       { .compatible =3D "fsl,t2080-l2-cache-controller", },=0A=
>=0A=
> What is checkpatch.pl trying to tell me here?=0A=
>=0A=
=0A=
checpkatch.pl is confused by =0A=
Documentation/devicetree/bindings/powerpc/fsl/l2cache.txt which says=0A=
=0A=
- compatible    : Should include "fsl,chip-l2-cache-controller" and "cache"=
=0A=
                   where chip is the processor (bsc9132, npc8572 etc.)=0A=
=0A=
So none of the fsl cache controllers pass the checkpatch.pl test.=0A=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
