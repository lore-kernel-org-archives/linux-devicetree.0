From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v3 1/7] drm/vc4: Add devicetree bindings for VC4.
Date: Tue, 13 Oct 2015 10:59:35 -0700
Message-ID: <87oag23b08.fsf@eliezer.anholt.net>
References: <1444426068-15817-1-git-send-email-eric@anholt.net> <1444426068-15817-2-git-send-email-eric@anholt.net> <20151009233148.GA31997@earth>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151009233148.GA31997@earth>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Sebastian Reichel <sre@kernel.org> writes:

> Hi,
>
> On Fri, Oct 09, 2015 at 02:27:42PM -0700, Eric Anholt wrote:
>> VC4 is the GPU (display and 3D) subsystem present on the 2835 and some
>> other Broadcom SoCs.
>>=20
>> This binding follows the model of msm, imx, sti, and others, where
>> there is a subsystem node for the whole GPU, with nodes for the
>> individual HW components within it.
>
> I think it would be useful to have the acronyms written out one time
> in the document (VC4, HVS).

Done.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWHUaIAAoJELXWKTbR/J7oBM0P/iFHDiMuRdHbw19g815NVGNg
nRVCKX2YoMC/l1ZHQkbN3rD1JzDh4k2Nuu7O2gmIOXAfYHvQh/ge/8JCrfjZVnpd
lg9a2nzSYnqb1zGumnCjJ1kY/a6Ip3LFAYQjSilnlkttQamPzeCmtwSsRJ1ZDBZQ
n/oQj8+PmU9tIXGXcOMUyuKKLqWC4hT20IyqhsijNMe0hgHca7PlJcJtVpOMIOFV
xIdWRug8CZt94BE3RiVKzFK11HSujDA7INynZzvCYU4XmWVr9MZrOQzzc466k/lF
rYyXX/zDDBrh2I8B0s4TgIzSUH5cs+5XhbHs83EjF3EgXWWAfVn5BpsWMK93AEhf
vvKKuoXnsoTBTPEVzFigS5tzWbHSewBOvvOdSUigHM50OCiV61ADGMTfmstywsCm
cvK0jkuOsrdelstkqgr/o7CAvIBoi5/+oKjocQer4usxjC0zzver/JGTAmAPwTKn
Rfz1q6MbzpEqZ3uIfW0mjPeLUFJzLlHnRw67FRbWANm3qbvu58SWuRRCv+U5u8MR
xyRJyjgZW3JP5YkPJk1TjMBF6shMswFBd7qlHKeD8P0f/RmiWaWqkOydLupmm33d
1ASPzCjR9ViaRiEtmoxl1vgoo6Sa1kOCVuWNYRVEi8tGqrMqG+GvE4c0F6MfQ9nC
k3o4oR6auMl74Rgfrw/4
=I1b4
-----END PGP SIGNATURE-----
--=-=-=--
