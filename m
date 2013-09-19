From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mfd: core: introduce of_node_name for mfd sub devices
Date: Thu, 19 Sep 2013 13:22:40 +0100
Message-ID: <20130919122240.GI22389@lee--X1>
References: <1379579392-1794-1-git-send-email-ldewangan@nvidia.com>
 <20130919083050.GH16984@lee--X1>
 <20130919115501.GM21013@sirena.org.uk>
 <20130919120051.GG22389@lee--X1>
 <523AEE07.9090405@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <523AEE07.9090405-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org" <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> >>>Do the sub-nodes have their own properties? If so, it would be wor=
th
> >>>breaking them up as other OSes could reuse the specifics. If they =
do,
> >>>then you need so put them in the binding. If they don't, then you =
do
> >>>not require sub-nodes. The MFD core will ensure the sub-devices ar=
e
> >>>probed and there is no requirement for the of_node to be assigned.
> >>You do see some reusable IP blocks (like the regualtors on the wm83=
1x
> >>PMICs for example, they're repeated blocks) which can be reused but
> >>generally they have a register base as part of the binding.  Person=
ally
> >>if it's just a property or two I'd probably just put them on the ro=
ot
> >>node for the device.
> >Agreed. Besides, there doesn't seem to be *any* sub-device propertie=
s
> >defined in the binding document. So what are you trying to achieve
> >with the child nodes?
>=20
> I wanted to have the DT like:
>=20
> as3722 {
>                 compatible =3D "ams,as3722";
>                 reg =3D <0x40>;
>=20
>                 #interrupt-controller;
>                 .....
>=20
>=20
>                 regulators {
>                             ldo1-in-supply =3D <..>;
>                             ....
>                             sd0 {
>                                     regulator-name =3D "vdd-cpu";
>                                     .....
>                             };
>                             sd1 {
>                                     regulator-name =3D "vdd-ddr";
>                                     .....
>                             };
>                             ....
>             };
> };
>=20
> And regulator driver should get the regulator node by their
> pdev->dev.of_node.
> Currently, in most of driver, we are having the code on regulator
> driver to get "regulators" node from parent node which I want to
> avoid.

Ah, I see. Yes, I believe the regulators should have their own node,
complete with a compatible string. To have each regulator listed
separately in the parent node seems a little messy. Just out of
interest, how many regulators are we talking about here?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
