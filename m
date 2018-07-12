From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: Re: [PATCH 1/2] ARM: sun8i: h3: enable HDMI output
 on Banana Pi M2 Zero
Date: Thu, 12 Jul 2018 15:09:55 +0800
Message-ID: <A7CA2831-7117-415C-BC59-3FB4AE425598@aosc.io>
References: <20180711132233.42301-1-icenowy@aosc.io> <20180711132233.42301-2-icenowy@aosc.io> <20180711150532.6gzm7krouriddreh@flea> <8F6CDF5C-2AC1-43EC-858A-5C6345CF279A@aosc.io> <20180712064601.m3bdd46wzac5fpgh@flea>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBXX5TPNAKGQEDGI634I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180712064601.m3bdd46wzac5fpgh@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2018=E5=B9=B47=E6=9C=8812=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=882:=
46:01, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
>On Wed, Jul 11, 2018 at 11:15:50PM +0800, Icenowy Zheng wrote:
>>=20
>>=20
>> =E4=BA=8E 2018=E5=B9=B47=E6=9C=8811=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=8811:05:32, Maxime Ripard
><maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> =E5=86=99=E5=88=B0:
>> >Hi,
>> >
>> >On Wed, Jul 11, 2018 at 09:22:32PM +0800, Icenowy Zheng wrote:
>> >> Banana Pi M2 Zero board has a miniHDMI port connected to the HDMI
>> >> controller of Allwinner H3 SoC.
>> >>=20
>> >> Enable the HDMI output in Banana Pi M2 Zero device tree.
>> >>=20
>> >> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> >> ---
>> >>  .../dts/sun8i-h2-plus-bananapi-m2-zero.dts    | 25
>> >+++++++++++++++++++
>> >>  1 file changed, 25 insertions(+)
>> >>=20
>> >> diff --git a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
>> >b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
>> >> index 7d01f9322658..eb61dcf32797 100644
>> >> --- a/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
>> >> +++ b/arch/arm/boot/dts/sun8i-h2-plus-bananapi-m2-zero.dts
>> >> @@ -26,6 +26,17 @@
>> >>  		stdout-path =3D "serial0:115200n8";
>> >>  	};
>> >> =20
>> >> +	hdmi-connector {
>> >> +		compatible =3D "hdmi-connector";
>> >> +		type =3D "c";
>> >
>> >This is not one of the connector type declared in DRM, how is it
>> >exposed to the userspace?
>>=20
>> So just use "A" here (because of single link)?
>
>If the connector type is C, it should be C, and DRM / driver adjusted
>to handle it.

Okay I won't change this property, if there's any further revisions.

For DRM driver, I think it can be an independent patchset.

>
>Maxime

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
