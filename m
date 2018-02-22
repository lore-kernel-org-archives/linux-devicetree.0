From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v4] ARM: dts: bcm283x: Fix pin function of JTAG pins
Date: Thu, 22 Feb 2018 12:12:23 -0800
Message-ID: <87y3jk942g.fsf@anholt.net>
References: <1516243293-25010-1-git-send-email-henryzhang62@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6520529255332756237=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1516243293-25010-1-git-send-email-henryzhang62@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, stefan.wahren@i2se.com, sbranden@broadcom.com, rjui@broadcom.com, linux@armlinux.org.uk, robh+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Henry Zhang <henryzhang62@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============6520529255332756237==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

henryzhang62@gmail.com writes:

> From: Henry Zhang <henryzhang62@gmail.com>
>
> BCM2835 ARM Peripherals doc shows gpio pins 4, 5, 6, 12 and 13
> carry altenate function, ALT5 for ARM JTAG
>
> Fixes: 21ff843931b2 ("ARM: dts: bcm283x: Define standard pinctrl groups in the gpio node.")
>
> Signed-off-by: Henry Zhang <henryzhang62@gmail.com>
> Acked-by: Stefan Wahren <stefan.wahren@i2se.com>

Applied to bcm2835-dt-next.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlqPJCcACgkQtdYpNtH8
nuj4YQ//ZBegd1W0n/xkbdqgQJcJIbo8/OZXFr7u/lXCMcySmKYzWSjqQzObWc5S
d29nixbwLjTpgPoOc8UUc5e/6mBZMB2KLBh2mF6XJ/GsyXUHYqPSaOT5SgwOdGyt
8nXiPndjkHdHfe7OdKkHbu+RFRXem0bR8MCKyQRYAzzyAPWMo2xNXxWdw72TdDPF
eJDW9RygNMrmfCqol5E9X9QHrIaA/9KXs0A0J+R5ftzV1sxNq05t2kLJT/C1JgYj
4gOi9rxalrct1ogX4oXmx60t2TcEzekfTP0a8sUDK25EzT0KDdx3q2g1MURX0gd6
NIV64Oj3Cgaybu0RCR6f1P0LwyXkVTrSPkpmw29MdiE1KlwhUVS2A4C/VPeobUn/
gY7mOYLfyV1asFKLG3ORdSYpU6LuL2kEUD7gxeNKJALb8HqTQ6qjIPLkJ9UgTAdw
OKm5XdIaESc9oZQr/vXKGsreWgAuhBFue+tZufTJSddegIV3AsvRm+iIi72LT60S
pvykhPIFm8WEC5x0rMPv04ErgH5ic+Sv+8/BUoV95wvd6tL0R/MThFNZ3af+7pH+
+0TDZMod+wDA6ZKyi6UCCRUZVWox7gVdFAdLZIa/GuwcgVoji6HGRsnEzmdIgJl6
dqg56Oqqgae1Tek5uS/5U8fQaZpv6GyOiJiE1vloabt0LM943xI=
=2d4z
-----END PGP SIGNATURE-----
--=-=-=--


--===============6520529255332756237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6520529255332756237==--
