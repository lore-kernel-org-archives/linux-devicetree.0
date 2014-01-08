From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ehci-platform: Add support for clks
 and phy passed through devicetree
Date: Wed, 8 Jan 2014 19:16:32 +0100
Message-ID: <20140108181632.GG2941@lukather>
References: <1389198608-24339-1-git-send-email-hdegoede@redhat.com>
 <1389198608-24339-3-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HB4mHL4PVvkpZAgW"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBUVNW2LAKGQEQFNIZTQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389198608-24339-3-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--HB4mHL4PVvkpZAgW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2014 at 05:30:08PM +0100, Hans de Goede wrote:
> Currently ehci-platform is only used in combination with devicetree when =
used
> with some via socs. By extending it to (optionally) get clks and a phy fr=
om
> devicetree, and enabling / disabling those on power_on / off, it can be u=
sed
> more generically. Specifically after this commit it can be used for the
> ehci controller on Allwinner sunxi SoCs.
>=20
> Somehow we've ended up with 2 device-bindings documents for ehci-platform=
=2Ec,
> this patch renames and updates one to platform-ehci.txt to reflect that t=
his
> is a generic platform driver, and removes the other.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/platform-ehci.txt      |  25 ++++
>  .../devicetree/bindings/usb/via,vt8500-ehci.txt    |  15 ---
>  .../devicetree/bindings/usb/vt8500-ehci.txt        |  12 --
>  drivers/usb/host/ehci-platform.c                   | 126 +++++++++++++++=
++----
>  4 files changed, 131 insertions(+), 47 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/platform-ehci.t=
xt
>  delete mode 100644 Documentation/devicetree/bindings/usb/via,vt8500-ehci=
=2Etxt
>  delete mode 100644 Documentation/devicetree/bindings/usb/vt8500-ehci.txt
>=20
> diff --git a/Documentation/devicetree/bindings/usb/platform-ehci.txt b/Do=
cumentation/devicetree/bindings/usb/platform-ehci.txt
> new file mode 100644
> index 0000000..56c478d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/platform-ehci.txt
> @@ -0,0 +1,25 @@
> +Generic Platform EHCI controller
> +
> +Required properties:
> +- compatible : "via,vt8500-ehci" or "wm,prizm-ehci"
> +- reg : ehci controller register range (address and length)
> +- interrupts : ehci controller interrupt
> +
> +Optional properties:
> +- clocks : a list of phandle + clock specifier pairs, one for each entry
> +   in clock-names.
> +- clock-names : "clk0", "clk1", ...
> +- phys : phy
> +- phy-names : "phy0"
> +
> +Example:
> +
> +	ehci@d8007900 {
> +		compatible =3D "via,vt8500-ehci";
> +		reg =3D <0xd8007900 0x200>;
> +		interrupts =3D <43>;
> +		clocks =3D <&usb_clk 6>, <&ahb_gates 2>;
> +		clock-names =3D "clk0", "clk1";

I'm really not convinced by this either. It prevents you from doing
anything useful out of these clocks, and the only thing you can
actually do with it is calling clk_get, and that's pretty much it.

What if you some platform needs to adjust the rate of one of the two?
Or wants to cut one but not the other for any reason? You're just
screwed, and you can do anything about it, because you have no way of
telling what "clk0" is used for.

Especially, since what you really want is to access the clocks by
index, that you can do with of_clk_get.

Calling it "bus" and "phy" or whatever it's used for both provide a
way of differentiating the two, yet being rather generic. And if we
need to add a third one, I'm pretty sure we will be able to come up
with a generic name then.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--HB4mHL4PVvkpZAgW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJSzZYAAAoJEBx+YmzsjxAg2hMP/jcPpqrmNeftEXRzKnRZkOV/
/K0L73AdeK0H+b4tpBUKfmLYjB3uTDHICva26v0KxcR7vV+bphgVRU3BSLlF38/S
/Jw9tjhP9T3un70JMsdFR+RLV95ELyffX1PK29XAsf5E6HmDsaG+U/k1TlclOj50
KyqERRcClxtVk9Xg8zLAmY1nPxVc9gVWMV6qPaO2H9N4yaprH1vT+sZzYqdsPFqz
0n5dZObu1+lrMc60KJ+fiECVCW52pPGd6P1nMelqUw2BCjXHmgXb0ihxqBOp+gwD
a2+3iBDs10OKsyr6k2Qo30i3LUd23+wMlpmm8EqMaBBjt+2xgwD8qDyU6GPEOI1q
qq2wTuE237Uv6lJXfA89sQXbpUs3/g3cR6JKtXOGB4p3+w+tYb4Pe2JdNYz4ED9F
Dj6kZoeaVb99TmA8Bu/gZHX6vhn3jr5QOfJo3beU4D6g0rFNFZO99OzisUrBSD8Y
Psqk16x+viJ/3GU+e5XIG+40UxMIoSUd+e19wxD769LZ6RFPL/ltWUj7hANaD/5P
K5+Sm1gKZeTH9FKfM15GhooBeXACN1R09BRyBK4OxBTcbpP21sCCT3HaASzajpjc
LuBfen13QD4pIF+MzQO+Rh9EusL0ZiFyJWHifK3zd80IjP96SQKnE8eIq4/3gk3N
uNQq2I5zKHh8A9Lc1S22
=EAY3
-----END PGP SIGNATURE-----

--HB4mHL4PVvkpZAgW--
