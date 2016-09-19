From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4 2/2] ARM: dts: sun8i: enable UART1 for iNet D978 Rev2
 board
Date: Mon, 19 Sep 2016 10:18:48 +0200
Message-ID: <20160919081848.GC8719@lukather>
References: <20160916151642.27907-1-icenowy@aosc.xyz>
 <20160916151642.27907-2-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6442338777032072036=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160916151642.27907-2-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============6442338777032072036==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vEao7xgI/oilGqZ+"
Content-Disposition: inline


--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2016 at 11:16:42PM +0800, Icenowy Zheng wrote:
> UART1 is connected to the bluetooth part of RTL8723BS WiFi/BT combo card
> on iNet D978 Rev2 board.
>=20
> Enable the UART1 to make it possible to use the modified hciattach by
> Realtek to drive the BT part of RTL8723BS.
>=20
> On the board no r_uart pins are found now (the onboard RX/TX pins are
> wired to PF2/PF4, which is muxed with mmc0), so also disabled it.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--vEao7xgI/oilGqZ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX359nAAoJEBx+YmzsjxAg1scP/R6nyNjffYIqEk/y6Pd0QphD
W8Lb4YU5Za6e2fU/dt3rKH+ZwMSkHs6JWU62PsLaSVWrQtWVcorkU2vu6H0IQRve
3yGBZHZ1cUBPTwlqN0k7tvJ2DqogHX+k1eOL3ew0aKAHoKptbA5ejuZ532sumh5l
nL/eFjVe3tw7z7NGSd8ygBSbXT7MM0d2mIWmvGTCtVSQaBYr7FMKvoeSzX0zd1qX
cLPf3pSpMpqqWVT/t4mfExym1zC0dpcguZrgi4I7oLTfCVD0iW1rTXN0ntDp7L6a
8yC8YJLMg2HZsBd6HJAs5wvkXb++DkOzNOgkTH8iaBNYgDT2gtfHLGlIFOpG4AaB
BOSPkApDySJCAsRUNkwYf7rl0p8jmtp9CUa1S/wKw/Ie0I4LTw+qZrVGTZ2urc6B
kw5ZkEknlXqpZb56g4f1J9AWpIOHYnQh4Nzw+9bQv3MniLsb6YZHXCUDRPIQN9sj
2nL70DgIKpiRUvTudA5/MYD0aZLP2HLNSXG1E4UOTEle58GgUU8Z2V1i2LpFVjG1
eYnGVHQr2JSN8Hq5L8uLlWYqSxxPpAazdKm7JX1OMgUn0+7Y6uvIRXH6VVDxoCS1
SeK3hb47PG+0H+eaA94wi+Lr0Ps2FzNuwN7K9MC/l2CV8Etwb1oODNJKsPQ7SuHv
cg08Mo06DyNqScNt7Lt2
=HG5T
-----END PGP SIGNATURE-----

--vEao7xgI/oilGqZ+--


--===============6442338777032072036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6442338777032072036==--
