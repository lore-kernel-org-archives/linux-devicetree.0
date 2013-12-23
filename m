From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v8 9/9] ARM: dts: add usb udc support to bcm281xx
Date: Mon, 23 Dec 2013 14:36:02 -0600
Message-ID: <20131223203602.GC15101@saruman.home>
References: <1387462990-12039-1-git-send-email-mporter@linaro.org>
 <1387462990-12039-10-git-send-email-mporter@linaro.org>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8586025971280046184=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1387462990-12039-10-git-send-email-mporter@linaro.org>
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

--===============8586025971280046184==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Content-Disposition: inline

--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2013 at 09:23:10AM -0500, Matt Porter wrote:
> Adds USB OTG/PHY and clock support to BCM281xx and enables
> UDC support on the bcm11351-brt and bcm28155-ap boards.
>=20
> Signed-off-by: Matt Porter <mporter@linaro.org>
> Reviewed-by: Markus Mayer <markus.mayer@linaro.org>
> Reviewed-by: Tim Kryger <tim.kryger@linaro.org>

doesn't apply to my tree:

checking file arch/arm/boot/dts/bcm11351-brt.dts
checking file arch/arm/boot/dts/bcm11351.dtsi
Hunk #1 FAILED at 243.
1 out of 1 hunk FAILED
checking file arch/arm/boot/dts/bcm28155-ap.dts

I will skip this patch from my tree, all others are now in my
testing/next branch after fixing dependency ARM-only for now.

Send me a patch removing ARCH dependency for v3.15, since this driver
can be used in other arches too.

cheers

--=20
balbi

--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSuJ6yAAoJEIaOsuA1yqRElJUP/i7GVyFrlkcDYkiYO8++VYV5
RDQ8Vz3OT7sLc0L2B0OvRGbLrWeVvNogPwfRddlqtrs9Q3nWrovaWuFONaUrYrKm
2XQnLINdSFzMlfH/VH7Zu0Xsy2emwZ+xCrCNSUYc2iv11CGMWMF3ATFJ0rkguUes
VftXXVzqDai724Pongf1mPZ5yVWjoPUSxN/Y0SYPNTxtlPoOlvxgKRBEsyWosV6h
C7WL9ZGL6u85t/bFRTRgaAn6Uokp1XUn2otUokcQTWXwnL/lsfgnmqDgDEqUtUKK
FcyEu2/gQXYhQ2hNphxAXBj2zg87I39ze1wibhEDAHXDfTs2TSl1/Mv9wBhOLdcn
awlHTiSB2PnVOsk04dTh4Vmfr5srOAkyHhqiwI9MREB2jpqvcq05XHDAQ9jUtla1
BJLi0xq+6fI+mc2Oag5Omo+Cy15t8Sk3z3C1N/Sz0STY6j/gLPqC2kPKQeUgZ+NQ
VNjmUG8qkEEvxj6nJmeRt5LztZ9e/k6xyco2irIIujEZumAcIhttstkpqn+/bqHG
Je8X4aEVnAkNRULew6Whulp50xWRWI0cOu+hyTmjEAPXlRcUZNXiTubKi1i1gx1/
AvuTi0bauah2skuDki5XZ5fPg+lWtbQR3ZNuSLXaiM3cEbARJ2GIoK9GZDUAvvzM
9QvZKJhvjWhgOj9pT8DP
=JJkD
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--


--===============8586025971280046184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8586025971280046184==--
