From: Chris Packham <Chris.Packham-6g8wRflRTwXFdCa3tKVlE6U/zSkkHjvu@public.gmane.org>
Subject: Re: [PATCH v2 0/3] ARM: mvebu: dts: updates to enable EDAC
Date: Thu, 11 Jan 2018 20:06:01 +0000
Message-ID: <d2460bc23c4d4ff2adbd05821e86aea9@svr-chch-ex1.atlnz.lc>
References: <20180111015903.11322-1-chris.packham@alliedtelesis.co.nz>
 <87a7xk7o5t.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "andrew-g2DYL2Zd6BY@public.gmane.org" <andrew-g2DYL2Zd6BY@public.gmane.org>, "jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org" <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org" <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/01/18 22:14, Gregory CLEMENT wrote:=0A=
> Hi Chris,=0A=
>   =0A=
>   On jeu., janv. 11 2018, Chris Packham <chris.packham-6g8wRflRTwXFdCa3tKVlE1db9wn+61SL@public.gmane.org=
z> wrote:=0A=
> =0A=
>> I've split this off from my earlier series[1] this is just the dts chang=
es that=0A=
>> will enable support for the EDAC series when it lands.=0A=
>>=0A=
>> The Armada 38x as well as the 98dx3236 and similar switch chips with int=
egrated=0A=
>> CPUs use the same SDRAM controller block as the Armada XP. The key diffe=
rence=0A=
>> is the width of the DDR interface.=0A=
>>=0A=
>> [1] - https://marc.info/?l=3Dlinux-kernel&m=3D151545124505964&w=3D2=0A=
> =0A=
> The series is looks good now. For patch 1 I still wait for that=0A=
> the "marvell,,ecc-enable" property was accepted before merging it.=0A=
> =0A=
> So I can either wait for that it was accepted before applying the series,=
=0A=
> or just applying patch 2 and 3 for now, as you want.=0A=
=0A=
I'm happy either way. If it's easier for you to keep the 3 patches =0A=
together that's fine by me.=0A=
=0A=
> =0A=
> Thanks,=0A=
> =0A=
> Gregory=0A=
> =0A=
> =0A=
>>=0A=
>> Changes in v2:=0A=
>> - update commit message=0A=
>> - add labels to dts=0A=
>>=0A=
>> Chris Packham (3):=0A=
>>    ARM: dts: armada-xp: enable L2 cache parity and ecc on db-xc3-24g4xg=
=0A=
>>    ARM: dts: armada-xp: add label to sdram-controller node=0A=
>>    ARM: dts: mvebu: add sdram controller node to Armada-38x=0A=
>>=0A=
>>   arch/arm/boot/dts/armada-38x.dtsi             | 5 +++++=0A=
>>   arch/arm/boot/dts/armada-xp-98dx3236.dtsi     | 2 +-=0A=
>>   arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts | 5 +++++=0A=
>>   arch/arm/boot/dts/armada-xp.dtsi              | 2 +-=0A=
>>   4 files changed, 12 insertions(+), 2 deletions(-)=0A=
>>=0A=
>> -- =0A=
>> 2.15.1=0A=
>>=0A=
> =0A=
=0A=
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
