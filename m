From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v6 5/9] usb: gadget: s3c-hsotg: use generic
 phy_init()/phy_exit() support
Date: Mon, 16 Dec 2013 15:20:01 -0600
Message-ID: <20131216212001.GD12896@saruman.home>
References: <1386953483-21631-1-git-send-email-mporter@linaro.org>
 <1386953483-21631-6-git-send-email-mporter@linaro.org>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6012839854980590731=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1386953483-21631-6-git-send-email-mporter@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matt Porter <mporter@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Kamil Debski <k.debski@samsung.com>, Linux USB List <linux-usb@vger.kernel.org>, Dinh Nguyen <dinh.linux@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tomasz Figa <t.figa@samsung.com>, Christian Daudt <bcm@fixthebug.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Kishon Vijay Abraham I <kishon@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, Felipe Balbi <balbi@ti.com>, Linaro Patches <patches@linaro.org>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Paul Zimmerman <paulz@synopsys.com>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============6012839854980590731==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UoPmpPX/dBe4BELn"
Content-Disposition: inline

--UoPmpPX/dBe4BELn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2013 at 11:51:19AM -0500, Matt Porter wrote:
> If a generic phy is present, call phy_init()/phy_exit(). This supports
> generic phys that must be soft reset before power on.
>=20
> Signed-off-by: Matt Porter <mporter@linaro.org>
> Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  drivers/usb/gadget/s3c-hsotg.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsot=
g.c
> index 7c5d8bd..e9683c2 100644
> --- a/drivers/usb/gadget/s3c-hsotg.c
> +++ b/drivers/usb/gadget/s3c-hsotg.c
> @@ -3621,6 +3621,9 @@ static int s3c_hsotg_probe(struct platform_device *=
pdev)
>  		goto err_supplies;
>  	}
> =20
> +	if (hsotg->phy)
> +		phy_init(hsotg->phy);

doesn't build. you need to include <linux/phy/phy.h>

--=20
balbi

--UoPmpPX/dBe4BELn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSr26BAAoJEIaOsuA1yqRESYkP/1LrfZ2asiCFbfXVAgCu7uxS
oGGJ8193TNJ1DForZ4MrtiJiWQd3HGP+qjs1oUwrKepEwVVJtWuibkXvw5yyELXy
blDmS/sXmdI7WC84b2gkLlTJ2FpOiYF2wYpanh/Nla0OJptIFfosPlhA3pVwCa6l
UdVBd0p4/fmj5w9Yr9ZwYEbLC87HGNrx8kksanT9yKwi2NMOC6t+Z1MQ2ZDc/UdP
TBbe5FdS33c3HbpXI/F/c8pjLYBqzKCm/lR1qHNGJcQGd4kpe1vMsIUA/oz95g4v
S5SKOoTVmC05qWyal/r5Lg5pgbMTIrnA2HgKYrHq8PmcTLOQtAX/sR7iz4Q/pE4E
xqnyEE8Y9zMjieA40ZVq6c7Su0f2sdCFBEGNmEWfoi/ajKE2baVTq9PRqidXhVnz
4F2o491FtBhdJACkw6OdCC27G8KCXqtVGpNqAfYlfFgSMIeuBsSuEyTE/vRonFC9
eDtq8FrSaI/bhrFw+enoeQeaZuzCR0Xn9KORkXC8wzghRnuiTuFgKC2Sr1Ql0hwU
iLDrOCI4fmWdZXjy8j1ySdWSD9kN2uGO5QBviinPPv171fJ9t+16TIf6F+MVI380
57V+aOCRX9RlTxDZypQU73bV6HqWxMav1Jil5epzmA1qSAo610GhO80OErDmAKzq
3ZvpJG8fNTWwL8lDyotX
=6Zsf
-----END PGP SIGNATURE-----

--UoPmpPX/dBe4BELn--


--===============6012839854980590731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6012839854980590731==--
