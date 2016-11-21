From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 0/5] drm: sun8i: Add DE2 HDMI video support
Date: Mon, 21 Nov 2016 19:42:26 +0100
Message-ID: <900661e6-15cb-ec5a-2908-3fd802aca65d@megous.com>
References: <cover.1479641523.git.moinejf@free.fr>
 <1c9a02ff-ce6c-7ad7-36fa-8a2ea0b7675e@megous.com>
 <20161121191416.706b80c25d476fa002a001b1@free.fr>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CxpU9j0XKa1u4Io23f2Dn8lB6MMhBwaaq"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBF4AZXAQKGQE5MF7N6I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161121191416.706b80c25d476fa002a001b1-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CxpU9j0XKa1u4Io23f2Dn8lB6MMhBwaaq
Content-Type: multipart/mixed; boundary="5AUrl4Tdt7D17pWpqjlVE36EGPtuJ3TqH";
 protected-headers="v1"
From: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
To: moinejf-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org,
 linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Message-ID: <900661e6-15cb-ec5a-2908-3fd802aca65d-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH v6 0/5] drm: sun8i: Add DE2 HDMI video
 support
References: <cover.1479641523.git.moinejf-GANU6spQydw@public.gmane.org>
 <1c9a02ff-ce6c-7ad7-36fa-8a2ea0b7675e-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
 <20161121191416.706b80c25d476fa002a001b1-GANU6spQydw@public.gmane.org>
In-Reply-To: <20161121191416.706b80c25d476fa002a001b1-GANU6spQydw@public.gmane.org>

--5AUrl4Tdt7D17pWpqjlVE36EGPtuJ3TqH
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Dne 21.11.2016 v 19:14 Jean-Francois Moine napsal(a):
> On Mon, 21 Nov 2016 01:54:53 +0100
> Ond=C5=99ej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org> wrote:
>=20
>> Dne 20.11.2016 v 12:32 Jean-Francois Moine napsal(a):
>>> This patchset series adds HDMI video support to the Allwinner
>>> sun8i SoCs which include the display engine 2 (DE2).
>>> The driver contains the code for the A83T and H3, but it could be
>>> used/extended for other SoCs as the A64, H2 and H5.
>>
>> Hi,
>>
>> I'm trying to test your patches on Orange Pi PC, and I've run into a few
>> issues: (I'm using sunxi-ng with the same patches as last time, to make
>> it work with your driver)
>>
>> 1] I just get pink output on the monitor - there's some signal, but it's
>> pink (or more like magenta).
>>
>> dmesg ouput indicates no error:
>>
>> [    1.887823] [drm] Initialized
>> [    1.888503] sun8i-de2 1000000.de-controller: bound
>> 1c0c000.lcd-controller (ops 0xc0a63894)
>> [    2.057298] sun8i-de2 1000000.de-controller: bound 1ee0000.hdmi (ops
>> 0xc0a63b54)
>> [    2.057304] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013=
).
>> [    2.057307] [drm] No driver support for vblank timestamp query.
>> [    2.690862] Console: switching to colour frame buffer device 240x67
>> [    2.723059] sun8i-de2 1000000.de-controller: fb0:  frame buffer devic=
e
> 	[snip]
>=20
> My H3 boards work correctly, except the Orange PI 2 when it cannot read
> the EDID (but it is OK after reboot).
>=20
> Did you check if the EDID was correctly read?

EDID is correctly read (I verified that it is the same as with the v5
version of the driver), but there's one difference I noted. v5 says dpms
is Off, while v6 says dpms is On.

> Which resolution do you expect?
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--5AUrl4Tdt7D17pWpqjlVE36EGPtuJ3TqH--

--CxpU9j0XKa1u4Io23f2Dn8lB6MMhBwaaq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYM0AVAAoJEG5kJsZ3z+/xJ0IP/1HTkcj0hRiqn6DFJAH8Vnq/
1zDy6RcT1+lZII/8tMkcWupClral8el0ZMMT65rkPoD4u233xizS2eSOlv4AObNg
ehY+vR3hRqP3h0w9MDyYfV/a4elDdzKA2SJJfqMxBkvWKz/Z1opCJ+wRmW7onPrX
eEDSqzVKG51Bb0IrvKAeYCs4qhodEa3IfPnSrl/jbc+HtHZ2esrMrmGzL1lv9w6m
uIIL1u/CHCkSVen1T4ekiWg/GaoPGyMZrtHvELdRyb/NvP/CrLWoIKj59IIHfvXu
4IYn1WLA9elogsTWI8P4SFF4uwkt76Ms9fB10INLrbvXEoFWE15mwU5RcYYQ7cc4
nC1Id1iSAdu3Z/lX8rmR6qWU2tpKq7DfMvA8hopqUd2SJAmozW450u5MSnucBCZ3
vfSuD0h+3tZ3Ve7a44tbtkrFT3IAO/BxmFwFdT890HXIayRGyZOQgij1IYF8cVLH
0tBgd7luB2XeiKodacz+EytzhrGIm22JPvIUw9KeSyCw5yA7ORqbrAzO+cwqoIAt
X2X3jaM6/JuPzxBXl+8BTXP4F1n6svdAm9onK4aExO4L0WTR8Fuqao4hCyb/j9a0
iOf3/LaZmvfyEQ9S/7r2Qc5eHyAaLCbXi9jgEBolu+lp+JoXNy1KZSBbZVJ/6Dxf
Xr7vP4YcmuNh8nVanDim
=ZUo+
-----END PGP SIGNATURE-----

--CxpU9j0XKa1u4Io23f2Dn8lB6MMhBwaaq--
