From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: Re: [PATCH 1/2] ARM: sun8i: h3: enable HDMI output
 on Banana Pi M2 Zero
Date: Wed, 11 Jul 2018 23:19:00 +0800
Message-ID: <2D440118-7036-4AA3-976C-A43116F459E7@aosc.io>
References: <20180711132233.42301-1-icenowy@aosc.io> <20180711132233.42301-2-icenowy@aosc.io> <20180711150532.6gzm7krouriddreh@flea> <3039364.lZKhBVCAIj@jernej-laptop>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB657TDNAKGQEA5MSHIY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <3039364.lZKhBVCAIj@jernej-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B47=E6=9C=8811=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=8811=
:14:19, "Jernej =C5=A0krabec" <jernej.skrabec-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =E5=86=99=E5=88=B0=
:
>Dne sreda, 11. julij 2018 ob 17:05:32 CEST je Maxime Ripard napisal(a):
>> Hi,
>>=20
>> On Wed, Jul 11, 2018 at 09:22:32PM +0800, Icenowy Zheng wrote:
>> > Banana Pi M2 Zero board has a miniHDMI port connected to the HDMI
>> > controller of Allwinner H3 SoC.
>> >=20
>> > Enable the HDMI output in Banana Pi M2 Zero device tree.
>> >=20
>> > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> > ---
>> >=20
>> >  .../dts/sun8i-h2-plus-bananapi-m2-zero.dts    | 25
>+++++++++++++++++++
>> >  1 file changed, 25 insertions(+)
>> >=20
>> > diff --git a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
>> > b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts index
>> > 7d01f9322658..eb61dcf32797 100644
>> > --- a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
>> > +++ b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
>> > @@ -26,6 +26,17 @@
>> >=20
>> >  		stdout-path =3D "serial0:115200n8";
>> >  =09
>> >  	};
>> >=20
>> > +	hdmi-connector {
>> > +		compatible =3D "hdmi-connector";
>> > +		type =3D "c";
>>=20
>> This is not one of the connector type declared in DRM, how is it
>> exposed to the userspace?
>
>DT binding allows it:
>
>HDMI Connector
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>Required properties:
>- compatible: "hdmi-connector"
>- type: the HDMI connector type: "a", "b", "c", "d" or "e"
>
>but DW HDMI bridge driver hardcodes it to type A. Actually, kernel has
>defines=20
>only for type A and B.

I assume it's for single link/dual link.

>
>Actually, many HDMI drivers have type A hardcoded...
>
>Best regards,
>Jernej

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
