From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v5 2/9] staging: dwc2: update DT binding to add generic
 clock/phy properties
Date: Thu, 12 Dec 2013 12:19:09 -0600
Message-ID: <20131212181909.GJ1939@saruman.home>
References: <1386854770-2173-1-git-send-email-mporter@linaro.org>
 <1386854770-2173-3-git-send-email-mporter@linaro.org>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0445220015494884759=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1386854770-2173-3-git-send-email-mporter@linaro.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, Kamil Debski <k.debski@samsung.com>, Linux USB List <linux-usb@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tomasz Figa <t.figa@samsung.com>, Christian Daudt <bcm@fixthebug.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Kishon Vijay Abraham I <kishon@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, Felipe Balbi <balbi@ti.com>, Linaro Patches <patches@linaro.org>, Kumar Gala <galak@codeaurora.org>, Paul Zimmerman <paulz@synopsys.com>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--===============0445220015494884759==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KjX7LgAomYr70Ka9"
Content-Disposition: inline

--KjX7LgAomYr70Ka9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2013 at 08:26:03AM -0500, Matt Porter wrote:
> dwc2/s3c-hsotg require a single clock to be specified and optionally
> a generic phy. On the s3c-hsotg driver old style USB phy support is
> present as a fallback so the generic phy properties are optional.
>=20
> Signed-off-by: Matt Porter <mporter@linaro.org>
> Acked-by: Kishon Vijay Abraham I <kishon@ti.com>

Here I need Acked-by from any of the DT folks. It's pretty obvious
patch, so I woudln't expect to have any issues.

--=20
balbi

--KjX7LgAomYr70Ka9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSqf4dAAoJEIaOsuA1yqREKBcP/iBwHjsIpA/WTu42Kf09b6lX
rHxNaiBqGqvr9hEhpvHdlmymdCrtllLx2R+VKaK5V2muIROX4WkfdQrrMIP/juub
WfuosqQf298DuXDyWgymiAbzwnRB8czodmMrXgglXYXV5fTfkW5h0hapFwbroDtB
Hu3YWD3ipf7wC8I8DlZYhCDRLuXbpntKhy2yk3tZFwKiEtYUtjzNqK/NSV75QuYw
gJuvPEslcZ/NaMEbavBKw833Adxt0Wc4Qe9F8hXA1+5mSksxNi5x+EXfJnNTo9zJ
FQ6GQKQLEWRpCI0nyLfmfD1oIIsKMCpXzzf4VBOpbg93hH/SRRnBEZpuR5yDDi8j
O0+mAF3h7ll9HWameoXinr+QjFQKlar6WqduoU3mCnysPxctDCr3FPTFQprAHjbl
olFNmn8JCdTkWKDpjcuiuVc1/YXQGtstZbhHP1JGsJl7Bih+818cy0KrdcpuzUKD
pJ3qD2kn380mq6Q0eyw6A8Z+3u+jz7XSoN2boHCmtI2qynlKoetFYliz7dJVB9f7
wHr/Yh15EjMi2b9jpJDU+HgRB2kUs7X07UWlXbYrIZH4N7Yu2uVHp1lYttCmwNlz
OeGI2N3z7dLz9QMlVNOw/ca5QAm8dNU9ddNNkEiVbVPUy75c1mvnSwRmWF6LWGun
P1JLqQWFEoisrZxFJjXe
=6Yfc
-----END PGP SIGNATURE-----

--KjX7LgAomYr70Ka9--


--===============0445220015494884759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0445220015494884759==--
