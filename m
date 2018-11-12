From: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH RFC] bluetooth: add uart h4 devices via
 serdev/devicetree
Date: Mon, 12 Nov 2018 21:59:34 +0100
Message-ID: <20181112215812.18ebca35@aktux>
References: <20181110232034.17277-1-andreas@kemnade.info>
        <20181111024648.7rt7rlhaqihtqecv@earth.universe>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/aWdB_CefDoLhkjCidefch86"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181111024648.7rt7rlhaqihtqecv@earth.universe>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, letux-kernel@openphoenux.org
List-Id: devicetree@vger.kernel.org

--Sig_/aWdB_CefDoLhkjCidefch86
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, 11 Nov 2018 03:46:48 +0100
Sebastian Reichel <sebastian.reichel@collabora.com> wrote:

> Hi,
>=20
> On Sun, Nov 11, 2018 at 12:20:34AM +0100, Andreas Kemnade wrote:
> > This is a first try to be able to use h4 devices specified in
> > the devicetree, so you do not need to call hciattach and
> > it can be automatically probed.
> >=20
> > Of course, proper devicetree bindings documentation is
> > missing. And also you would extend that by regulator/
> > enable gpio settings.
> >=20
> > But before proceeding further it should be checked if the
> > general way of doing things is right.
> >=20
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > --- =20
>=20
> Patch looks good to me, just one note
>=20
I found one thing myself:
Shouldn't we have a generic compatible string like "generic-h4".
ehci-platform.c has for example:
        { .compatible =3D "generic-ehci", },

Regards,
Andreas

--Sig_/aWdB_CefDoLhkjCidefch86
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE7sDbhY5mwNpwYgrAfb1qx03ikyQFAlvp6bcACgkQfb1qx03i
kyQjnBAAvdRtlj7zGjvLbgzTX7vCh9rFv3v3Nw28EezbMuaKmMAZmp3FSibfRUbx
D6BkAHc2244r8gy3cizNUzOCeN3w2MjDFCp3ZBka1ff+oonW7nQTiV4fZt/XCW5h
ieSMHH8pem5fpuGdgYVSnH51VbrDcSB2adw1Y1SHBTAeYpSIl4AGtx+Yavn8qS+9
RsbUTGd1fAE38KbpOoRNgjN/UtagBD8a9rrj39c+6l44RX4YioLFivY8xP21cZNW
pEgUFEhr6hCs4EathF5vmmMVYjwA6Tx69rPjuAfd+Cle14FcAQVgVrDa8y8J/s4X
dMpEYc1ZJL2JTkvBW+TqKmhs3TQiR0gbGLDgdRyf3DLJGRFbcqskzErk1ZhyWqnu
E5R/cwjBTuSu5JEN7guPefrbfN9slKnfTOdYWG+33v0U47uftt7F+zGNDBG2zjoL
sznthXrDLsLoqoCXsnmqQp/RHUB80gzk1tPtFe2jMj0QvHJi53EVd5GLqsK7/7B3
Ai7OOMuF34KMSvZ9I/sMkw6Yg9nwtdL09NHyfJXABbNgkFskseGV849JngeyeLiT
Dlrc3l08yovs3dYZBJnDCD8U1iaXBaXx653B1+m0xtVeY9o+wfRbtgL/tDNsaqBf
4KlfOWUxWUvhojh7MPSfD4oMji0QDeEpSM3BvY6WhVTXrLkeZGc=
=49KN
-----END PGP SIGNATURE-----

--Sig_/aWdB_CefDoLhkjCidefch86--
