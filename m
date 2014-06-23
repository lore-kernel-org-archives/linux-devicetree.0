From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 4/4] ARM: sun8i: dt: Add Ippo-q8h v5 support
Date: Mon, 23 Jun 2014 20:56:31 +0200
Message-ID: <20140623185631.GK19730@lukather>
References: <1403275973-24259-1-git-send-email-wens@csie.org>
 <1403275973-24259-5-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HUNbJr+8XKUS5qN7"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBOXSUGOQKGQE6UK66YY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403275973-24259-5-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--HUNbJr+8XKUS5qN7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2014 at 10:52:53PM +0800, Chen-Yu Tsai wrote:
> The Ippo-q8h is a tablet circuit board commonly found in cheap Android
> tablets with A23 SoCs. There are at least 2 versions of the board, with
> different peripherals, such as WiFi chips.
>=20
> Common features among these tablets include 512 MB DRAM, NAND, MMC, LCD,
> capacitive touchscreen, accelerometer, 1 or 2 camera sensors, USB OTG,
> microphone and speaker.
>=20
> v5 of these board designs has a ESP8089 WiFi chip (not supported)
> connected to mmc1. This patch adds very basic support.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Fixed the whitespace warning and applied.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--HUNbJr+8XKUS5qN7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTqHhfAAoJEBx+YmzsjxAgnoMQAK7eZs8AhCllm6htRDHaviTG
7csqMo3CGnc0ttZvevXbYDe9RigZrFeZlpjc37OsUGZSFu/2QTqooCcIGV1QqqtR
LYdmRL7XxUK0IjFgYQMO+t9V7KZtYnzSOeG2Ylubx/b7eq0dhkIG/g7394LZdegB
9OFH61BzErXP4uIp4pYk861GK30kCedhTQA33073+7E3zjASgwnreThCpYYGKLV9
GeNhTAj+ifYWtClz+4UWh86kWfzKMY4YAYnHsbOCYQeYLS64gjvEQfJwrzmz6V4l
1C+XVpV9rN7DIkohCAFMuH7smqM+PdUzd51Z6IF3JuTaa0Kx7P3EomHvFzyy05A4
I99geTQsXC31/y4dOpQ7d8rWKcvCbGHtitAOEoeQxYYFyHoAFjSGab6hALQ5SpiZ
l9FQJCjf+9WK8vLagLuAPsi0Vv7K7A26PUz5X5f7/XeY/gvG4nk89WjLAaDfHPw9
U6KHI3VizKdzm67thpnlUI3U9l+eBrWajoYtMkmc9BFXKoNL3vYg0hk40kTaOJwO
+wflC6Vedvyd0ElyoHZFmW8y8I/SBjveNECjEgyAvgaMzf5gW9sOlHENBJGb5b+b
RYIr0IKUJIfCgwF/o+VwntwUl6XuU5xBgIQdxy2+Q5D19KndXS4MUQ2airCzrUPP
NMYbkzt5OqnXTA1vj8kp
=fkPf
-----END PGP SIGNATURE-----

--HUNbJr+8XKUS5qN7--
