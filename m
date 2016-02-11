From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 01/14] pinctrl: sunxi: Add A83T R_PIO controller support
Date: Thu, 11 Feb 2016 13:36:48 +0100
Message-ID: <20160211123648.GN31506@lukather>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
 <1454203266-4450-2-git-send-email-vishnupatekar0510@gmail.com>
 <CACRpkdbCgOBQw28d=qc1fAURY3x8UdoWqiMtXMZ=uWLaQj-nbg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zp3AMgPTa9Mf+MXm"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbCgOBQw28d=qc1fAURY3x8UdoWqiMtXMZ=uWLaQj-nbg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Vishnu Patekar <vishnupatekar0510@gmail.com>, Rob Herring <robh+dt@kernel.org>, Jon Corbet <corbet@lwn.net>, =?utf-8?B?UGF3ZcWC?= Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Emilio Lopez <emilio@elopez.com.ar>, Jens Kuske <jenskuske@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Reinder
List-Id: devicetree@vger.kernel.org


--zp3AMgPTa9Mf+MXm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Thu, Feb 11, 2016 at 12:59:47PM +0100, Linus Walleij wrote:
> On Sun, Jan 31, 2016 at 2:20 AM, Vishnu Patekar
> <vishnupatekar0510@gmail.com> wrote:
>=20
> > The A83T has R_PIO pin controller, it's same as A23, execpt A83T
> > interrupt bit is 6th and A83T has one extra pin PL12.
> >
> > Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
>=20
> Maxime, can you look at this patch?

Chen-Yu had one minor comment on it, and he's also the Allwinner
maintainer now, so you can trust his Acked-by just like you would
trust mine ;)

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--zp3AMgPTa9Mf+MXm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWvIBgAAoJEBx+YmzsjxAgvDoP/2cRJSsB3vNt1L4a7unZ3Q4r
PKIQqTYjq5jMVhMciqaUX/7KWEye8oXLyEYPmKZlmN3O6he4Irfl2DtLNVOeQ3Cz
o3dvnhyhnSEfyZtVAvlDD70F4Yj9bXESirAnekQza/e1tookMHj9t8tH+xZ3R704
DfBNwl9EVbi1HvaqyhVUuTpEU1tu80zZogvSvIDXCTDubGXdAJ02jLjM70lY3xHE
iLtLgoH8R1yEopaV6LPN7EqLDBjsdF6EEaThegRvEzslGPxgyKfuJGTJfhIQMoa2
JuFDR36zPlUXzx6Oinp7VcgT1Wh1n2QApwCfPm9WsTjku8mskXpMOMPRslZRPc2T
3RG9CDHXe6cKHQh2vNuQQSUuhZRPN+bdDlcsC5520B49fFRABSbGnfKhhnOj6ueI
9vq2SYTOQX2ov+UNRZ46CODonbj1dtuF2bA21mhcMchhm5kmIKVMGtA2/qIsLYAx
Eaoe/1mE6HyfDiqFlgkAHIBP+cCLR4UwS+9p/wRiSUOcBdtslOJv18Ofu2mr0Nau
Uf73vHuWlaUfM1ft5mwzQGmcGeIBSmdgtaFG8PzL6b4dMhlhpGB+uohAYI3Weurr
GNtbFS1tdKtEct4LB6hnxrop2sbwr42ydXNeVtUIFvc+JeLudEKT8ywdxo7iBOMJ
ysg3zMqldUpPCoP+iY7n
=/Hfg
-----END PGP SIGNATURE-----

--zp3AMgPTa9Mf+MXm--
