From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH 2/2] ARM: sunxi: add support for R40 SoC
Date: Tue, 22 Aug 2017 13:14:09 +0800
Message-ID: <0809ae2d75f210b9bfee49b383f226b2@aosc.io>
References: <20170820052957.34597-1-icenowy@aosc.io>
 <20170820052957.34597-2-icenowy@aosc.io>
 <20170821093405.n4bum7j6nswnv6wr@flea.lan>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBJX353GAKGQEZD4WBPQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170821093405.n4bum7j6nswnv6wr-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017-08-21 17:34=EF=BC=8CMaxime Ripard =E5=86=99=E9=81=93=EF=BC=
=9A
> Hi,
>=20
> On Sun, Aug 20, 2017 at 01:29:57PM +0800, Icenowy Zheng wrote:
>> Allwinner R40 is a new SoC, with Quad Core Cortex-A7 and peripherals
>> like A20.
>>=20
>> Add support for it.
>>=20
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>>  Documentation/arm/sunxi/README                  | 6 ++++++
>>  Documentation/devicetree/bindings/arm/sunxi.txt | 1 +
>>  arch/arm/mach-sunxi/sunxi.c                     | 1 +
>>  3 files changed, 8 insertions(+)
>>=20
>> diff --git a/Documentation/arm/sunxi/README=20
>> b/Documentation/arm/sunxi/README
>> index d7b1f016bd62..4fa836782e46 100644
>> --- a/Documentation/arm/sunxi/README
>> +++ b/Documentation/arm/sunxi/README
>> @@ -75,6 +75,12 @@ SunXi family
>>          + Datasheet
>>           =20
>> http://linux-sunxi.org/File:Allwinner_V3s_Datasheet_V1.0.pdf
>>=20
>> +      - Allwinner R40 (sun8i)
>> +        + Datasheet
>> +         =20
>> https://github.com/tinalinux/docs/raw/r40-v1.y/R40_Datasheet_V1.0.pdf
>> +        + User Manual
>> +         =20
>> https://github.com/tinalinux/docs/raw/r40-v1.y/Allwinner_R40_User_Manual=
_V1.0.pdf
>> +
>=20
> Please sort it by alphabetical order.

I prefer to sort it by the wafer ID (the number after w in the official=20
ID).

The current document can be explained to follow the alphabetical order
or the wafer ID.

P.S. there's some error in the V3s datasheet position, and if it's fixed
we can still continue to make the two kinds of order both meaningful ;-)

>=20
>>      * Quad ARM Cortex-A15, Quad ARM Cortex-A7 based SoCs
>>        - Allwinner A80
>>          + Datasheet
>> diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt=20
>> b/Documentation/devicetree/bindings/arm/sunxi.txt
>> index f35c6ada5a65..e4beec3d9ad3 100644
>> --- a/Documentation/devicetree/bindings/arm/sunxi.txt
>> +++ b/Documentation/devicetree/bindings/arm/sunxi.txt
>> @@ -14,6 +14,7 @@ using one of the following compatible strings:
>>    allwinner,sun8i-a83t
>>    allwinner,sun8i-h2-plus
>>    allwinner,sun8i-h3
>> +  allwinner-sun8i-r40
>>    allwinner,sun8i-v3s
>>    allwinner,sun9i-a80
>>    allwinner,sun50i-a64
>> diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
>> index 7ab353fb25f2..311e6c4fc4f4 100644
>> --- a/arch/arm/mach-sunxi/sunxi.c
>> +++ b/arch/arm/mach-sunxi/sunxi.c
>> @@ -66,6 +66,7 @@ static const char * const sun8i_board_dt_compat[] =3D=
=20
>> {
>>  	"allwinner,sun8i-h2-plus",
>>  	"allwinner,sun8i-h3",
>>  	"allwinner,sun8i-v3s",
>> +	"allwinner,sun8i-r40",
>=20
> And same thing here.
>=20
> Thanks!
> Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
