From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 4/4] arch: arm: boot: dts: Added correct vendor-prefix
 with device name to compatible property
Date: Mon, 29 Sep 2014 10:02:06 +0100
Message-ID: <20140929090206.GA1899@leverpostej>
References: <1411734292-10910-1-git-send-email-darshanapadmadas@gmail.com>
 <1411734292-10910-5-git-send-email-darshanapadmadas@gmail.com>
 <20140926135047.GH7422@leverpostej>
 <b17b5b73-b571-41d9-abed-3626f111eb84@googlegroups.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b17b5b73-b571-41d9-abed-3626f111eb84-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Darshana Padmadas <darshanapadmadas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "opw-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org" <opw-kernel-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Sep 27, 2014 at 05:03:00PM +0100, Darshana Padmadas wrote:
>    On Friday, September 26, 2014 7:20:50 PM UTC+5:30, Mark Rutland wr=
ote:
>=20
>      Hi,
>=20
>      On Fri, Sep 26, 2014 at 01:24:52PM +0100, Darshana Padmadas wrot=
e:
>      > This patch adds the correct vendor-prefix listed in
>      Documentation/devicetree/bindings/vendor-prefixes.txt
>      > with the device name to compatible property.
>      >
>      > Signed-off-by: Darshana Padmadas <[1]darshana...-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>      > ---
>      > =C2=A0arch/arm/boot/dts/tegra30-cardhu.dtsi | 2 +-
>      > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>      >
>      > diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi
>      b/arch/arm/boot/dts/tegra30-cardhu.dtsi
>      > index 2063795..491fed6 100644
>      > --- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
>      > +++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
>      > @@ -187,7 +187,7 @@
>      > =C2=A0
>      > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* ALS and Proximity sensor */
>      > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0isl29028@44 {
>      > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0compatible =3D "isil,isl29028";
>      > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0compatible =3D "isl,isl29028", "isil,isl29028";
>=20
>      Please either drop the old string, or don't add the new string.
>=20
>      For compatibility with old DTBs, the kernel must continue to sup=
port the
>      old string. So the old string will alone will work -- it's not n=
ecessary
>      to add the new one to DTs just because the kernel now supports i=
t.
>=20
>      However, this DTB need not work with older kernels, so you could=
 simply
>      replace the string with the new one if your aim is to remove ins=
tances
>      of "isil" to ensure consistency going forwards. If so, please me=
ntion
>      that in the commit message.
>=20
>    So I simply replace isil with isl for the newer kernels?=C2=A0

=46or the dts(i) files, that should be fine. You will need to Cc the Te=
gra
maintainers to verify if they're ok with that.

As an aside, your email came through as HTML, which some lists will
reject. Please ensure your mail client sends plain text.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
