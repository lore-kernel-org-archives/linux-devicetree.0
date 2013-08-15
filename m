From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH] pwm: atmel-pwm: add pwm controller driver
Date: Thu, 15 Aug 2013 13:13:52 +0200
Message-ID: <20130815111351.GA14418@ulmo>
References: <1371804355-8071-1-git-send-email-voice.shen@atmel.com>
 <51D523FD.7040409@atmel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4690591058816510007=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <51D523FD.7040409@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bo Shen <voice.shen@atmel.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============4690591058816510007==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2013 at 03:27:57PM +0800, Bo Shen wrote:
> Hi All,
>=20
> On 6/21/2013 16:45, Bo Shen wrote:
> >add atmel pwm controller driver based on PWM framework
> >
> >this is basic function implementation of pwm controller
> >it can work with pwm based led and backlight
> >
> >Signed-off-by: Bo Shen <voice.shen@atmel.com>
> >---
> >  .../devicetree/bindings/pwm/atmel-pwm.txt          |   19 ++
> >  drivers/pwm/Kconfig                                |    9 +
> >  drivers/pwm/Makefile                               |    1 +
> >  drivers/pwm/pwm-atmel.c                            |  326 ++++++++++++=
++++++++
> >  4 files changed, 355 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pwm/atmel-pwm.txt
> >  create mode 100644 drivers/pwm/pwm-atmel.c
>=20
> Does this patch can be applied? If yes, I will send out the formal
> patch without RFC in subject. If no, please help review this patch
> and give your comments.

Hi,

Sorry I seem to have completely missed this. Can you please resend the
patch to my new email address and Cc linux-pwm@vger.kernel.org. That
will make sure that I see and can review it.

Thanks,
Thierry

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSDLfvAAoJEN0jrNd/PrOhknYQAKVD1g6hjnzSZItuyFeXv+3W
MI2b4mAft7E11pKu+rYErQclb40oeVi7OPptBLiHYu1q+yyqOyhM/gvB0elcVTPN
HaEAbULpCv4U2StkXHD6bBlLA9aBnaA1SlQSsBOpOK4UAXR45G+dSf40CYz7XrRu
UZliniimeaszKxauMEFXdnpBKiaXYgP/Lelpo0tCclOR7rSNWbnoHiA52QKXlGLU
/MlYNl2AfaMj0J8uEG8/cLH2HswID55k8jj0pH4wbJ8oP1ccdW562FNWIXcCNQfg
TN+hWOI4OyqARlQ1N4AzzbnU4I37qLE1ZvJGmK6RbOJJ8au9xlnzeoXMsVwlY6jD
/zbr07Z+GDrncd30/0rynBSyOeA6K+lVMQaFL8JohnPrnmGsK2R93eYfzjAKXgUM
g4yC3Dwl4Om/uaswqRVEzLnL98fJ5xJ6PEgoO2jxIZBs1iQlfyj8mLai1Cr/b7Vb
0/p9AA3zxFZdB1a53hnmCVnCYbV0WxTsLiNCRteltFVGXNJISkmls0b0kp2cS/lz
/biOo3dZADP9lppa0K4evAS4NBtrz9g8AszON4vpbbYzBCvnQlCXC5LgbOgfJSg9
D1CjlR0vOPtCh6KiGi7HxM/BX+orPLyua2ztWMUH//uhPVOaoZu3NvoL1rg6tQDu
griVBch1oqupxonv3XXL
=Wny8
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--


--===============4690591058816510007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4690591058816510007==--
