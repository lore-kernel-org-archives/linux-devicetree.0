From: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [Letux-kernel] [PATCH RFC] bluetooth: add uart h4 devices via
 serdev/devicetree
Date: Fri, 4 Jan 2019 20:57:10 +0100
Message-ID: <20190104205600.3e6b31c9@aktux>
References: <20181110232034.17277-1-andreas@kemnade.info>
        <20181111024648.7rt7rlhaqihtqecv@earth.universe>
        <20181112215812.18ebca35@aktux>
        <2C74C837-A6D3-47C9-BE59-CCA594289B94@goldelico.com>
        <20181112222726.73m2oca7hankvcjs@earth.universe>
        <CABGGisxsdv+BTd5-HMzF8asEcWtL5F4CMzmkrBCwK=NibvqjLQ@mail.gmail.com>
        <20181113170128.0f59ef0e@kemnade.info>
        <86A3A2E6-FC89-42FE-8410-9C8273EC9CF7@holtmann.org>
        <20181116204601.4e1aa0de@kemnade.info>
        <09AFE47C-D188-4397-A2CD-C70FFAC3B677@holtmann.org>
        <20190104064403.325771fd@kemnade.info>
        <B5CEA49A-0F54-40C5-BCEA-7875BE1358E3@holtmann.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/k.3xD97g07g2Scmu0iHJy5M"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <B5CEA49A-0F54-40C5-BCEA-7875BE1358E3@holtmann.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>
Cc: Rob Herring <robh@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, "H . Nikolaus Schaller" <hns@goldelico.com>, devicetree <devicetree@vger.kernel.org>, Johan Hedberg <johan.hedberg@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-bluetooth@vger.kernel.org, letux-kernel@openphoenux.org
List-Id: devicetree@vger.kernel.org

--Sig_/k.3xD97g07g2Scmu0iHJy5M
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Marcel,

On Fri, 4 Jan 2019 10:07:34 +0100
Marcel Holtmann <marcel@holtmann.org> wrote:

> Hi Andreas,
>=20
> >>>> Btw. I see nothing standing in the way of merging btuart.c driver an=
d then go from there. Either I dig this out and submit or someone else does.
> >>>>  =20
> >>> Do you mean this?
> >>> https://patchwork.kernel.org/patch/10490651/   =20
> >>=20
> >> yes, that one.
> >>  =20
> > Hmm, there seemed to be nothing in the pull requests regarding btuart.
> > Did you change plans? =20
>=20
> because I only submitted it as RFC. We can easily merge that one upstream=
 since it is rather trivial. The main problem is how you want to do the dev=
ice matching. Do you have a DT entry for your really simple devices?
>=20
Hmm, in that link it is non-rfc. So someone picked you rfc patch up and
submitted it?

You might see what we are already doing here:
http://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dblobdiff;f=3Darch/arm/bo=
ot/dts/omap3-gta04.dtsi;h=3D4d2bac4293938de4a15a59979616909cf8842524;hp=3Db=
fced960d63ec40cf9db4901374b331737a9a168;hb=3Df78bf51754e35010de40518b9a8a14=
8d0269bbc8;hpb=3Db6805813a9ab5b0d66b44cc54a0059eca4dd0a98

We are using compatible=C2=A0=3D=C2=A0"wi2wi,w2cbw003-bluetooth"

But I think we should also add a generic device string like
bluetooth,h4
So if people dig out older hardware, they can just add that to their
device trees and have bluetooth

The full patchset we are currently using is here:
http://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dshortlog;h=3Drefs/heads/=
letux/bluetooth-h4-serdev

Regards,
Andreas

--Sig_/k.3xD97g07g2Scmu0iHJy5M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE7sDbhY5mwNpwYgrAfb1qx03ikyQFAlwvupYACgkQfb1qx03i
kyQCMA//UcuhECwYbxbjrGLdMxqjvgo452MgX/hSy9bN/NTFmq2g09u1g5nv5MkV
b76cfWGRkMw+Zn6Sui2dE7gJUgHNHpyrt7IfmLiHYGHGOnG3S9q89lStD7+XQyrR
ox8sE4N/vpIfc2OFwu3QLDeTH33ZxsA1ICpDsnuCiikl7gAkRGh5FzFaOvAKprCC
htWcq2BvpMp8HkoFcWAUi/ucjswO2qk7s66zVJW7ssfw4yhnrRJDrlLUnv1EF+K0
J8/MT/TydjHRklISPA5gXG1HhMZa3m+gyMt9Kx85W7aLnbY/bEp44gtR+IKteKNO
FnOR23XwwBK+/nG+GJ7R55R0Gg5vbR0JpF/caglux2gpEQM2tS4HM8kaW0Hvhuwd
O8FBOQiVg1z0bNwd111H6/R2j0+REE1gYW80iLJjHVKqRzMYF5J7ayO/OT0sKYKD
LVBlUcDsDTumjuwcyFWbJ/Zk6Z8F3u9RMOv+1GCL3JNJKthYDj3JN6MAMcEINA0n
Y1JuGj++4jK1R5z2H0dd1a3TTuy/lVGoySxrVU6U5CgobwRuMxhN3YBdWHDMC9qo
t9/RnAkI/xj8ScNeAsZEYJe9ZDwWgWZ3lygols7QvqApSMtQjB8h6Ci/yD5Vbzss
KXKyrPayXyPO2HRrsFxBoLX/CRAscvGlwvKeN2uyNUWCG/Tt4Uo=
=N5bk
-----END PGP SIGNATURE-----

--Sig_/k.3xD97g07g2Scmu0iHJy5M--
