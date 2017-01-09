From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 9/9] ARM: sunxi: Convert pinctrl nodes to generic
 bindings
Date: Mon, 9 Jan 2017 12:16:30 +0100
Message-ID: <20170109111630.pcsjmc5l4v7vi2rm@lukather>
References: <cover.7edc6c25be8a5e2efdda6a82e102dbf7ece6aa64.1476200742.git-series.maxime.ripard@free-electrons.com>
 <e32d044d2d967f24f12d83eea50e7f14f2ae1073.1476200742.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v67_4iriM2WS33hUWzNZY8R2WvGjqzntGBPGmNkr1Ryr_w@mail.gmail.com>
 <58723369-50ad-1792-9be1-c277eb719044@arm.com>
 <20170105153556.pzec5jjuz7pmvsmn@lukather>
 <dfd7242d-6b16-6091-979f-0bff85a20806@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6029996112825697044=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <dfd7242d-6b16-6091-979f-0bff85a20806@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara@arm.com>
Cc: devicetree <devicetree@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============6029996112825697044==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mercdybaxeeevdn3"
Content-Disposition: inline


--mercdybaxeeevdn3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 06, 2017 at 01:17:21AM +0000, Andr=E9 Przywara wrote:
> > On Wed, Jan 04, 2017 at 02:16:23AM +0000, Andr=E9 Przywara wrote:
> >> So can I ask that we start taking this seriously and stop doing things
> >> which prevent Allwinner boards from being supported properly?
> >> Which would first involve dropping this very patch?
> >=20
> > The driver still supports the old binding.
>=20
> Yes, a _current_ version of the driver supports both bindings, but older
> versions *require* the older binding and bail out if various
> allwinner,xxx properties are missing - as in those proposed new DTs:
>=20
> 4.9 kernel with sunxi/for-next .dtb:
> sun8i-h3-pinctrl 1c20800.pinctrl: missing allwinner,function property in
> node uart0
> sun8i-h3-pinctrl 1c20800.pinctrl: missing allwinner,function property in
> node mmc0
> sunxi-mmc: probe of 1c0f000.mmc failed with error -22

This is seriously getting out of control. We already come to great
length (and sometimes a painful amount of hacks) to satisfy a few
individuals with a theorical interest in backward compatibility (and
apparently, we're even the only one doing so, even more platforms
choosing to not support that as we speak), there's seriously no reason
to support forward compatibility as well. This has *never* been a
thing, never has been documented nor advertised, I don't know why it
should be one more thing to carry on our shoulders.

Only maybe to slow us even more in the process, and effectively
prevent us from doing any actual work.

> >> Having done breakage in the past (with "allwinner,sun7i-a20-mmc", for
> >> instance) is no excuse for doing it again.
> >=20
> > I'm not sure which breakage we introduced with a new compatible: the
> > old compatible is working just like it used to, and the new one is
> > working like we need it to.
>=20
> But the new compatible is not recognized with older kernels, preventing
> people from using the newest DT with older kernels as well.

When do you draw the line exactly? You could have the same argument
for any feature that will be supported in the future... Do you also
want to backport any given driver for any kernel version?

This is ridiculous. 4.9 didn't have MMC support. Who cares about
whether MMC (or any other driver) works? This was never supposed to!

> I proposed to simply work around this by using the old compatible as a
> fallback: compatible=3D"sun7i-a20-mmc", "sun5i-a13-mmc";
> Unfortunately this suggestion was not followed.
> So now we can't boot a 4.8 (or earlier) kernel with a .dtb from a 4.9 or
> later tree. Adding the extra string would fix this.
>=20
> Actually the recommended approach to avoid this situation in the first
> place is to always use compatible strings with the SoC-specific name as
> the first string, followed by the compatible string the driver works
> with. And this should be done upon introducing a new DT to the tree -
> even if at this point the driver doesn't deal with the new string.
> Unknown strings will just be skipped.
> So for instance the H5 DT should read: "sun50i-h5-mmc",
> "sun50i-a64-mmc", "sun5i-a13-mmc"; (with the last string possibly being
> optional). The current kernel driver will not match the h5 string, so it
> falls back to the a64 string and works. If we learn about a neat eMMC
> 5.1 feature (or any quirk the H5 can benefit from) somewhere in the
> future, we can add the code together with this h5 string to the driver
> and don't need to change the DT at all.

And what about the situation that you encountered last week too? IE
the compatibility was introduced because it was convenient, and it
turns out it's not working as expected?

We remove the bogus compatible from the list? But then, we can't boot
anymore on older kernels...

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mercdybaxeeevdn3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYc3EKAAoJEBx+YmzsjxAgp9UQAJKmEz3sYF39mdTEFlH5iZz4
0c9SvvFlwmPN8tgc4TSnNh5nEDvjBAuvPmLevhD9pKXLuheH4seyG9v6C9JDLqej
PCgybx5U9U7WMkxQHx8RmoaIuH6HYTcWWOgrQKfE3SBzzfnVRen8W94B6qD2adWp
NU4ibs8HsvMWPfFL0Mv48d/e2uP+gU9dTHjp6m7QMoWKq8nHImrnMJCTGyZMMOwO
AT+vSGigeckqHYYtshosOKixF0uEnv/ZIgIqlwrntQC3wg6HgKFciEyWHe4Gk0eu
9sHTciZQP6yQ31ny3YzxNXFy6KFg+tqFrm1AZet1naqtwdfjCEDUaqn5LWnfQRxS
1eeIVxYSFKk75sUORgmmmfhJrdbw5XAaEP1JsNbXfCfl9X0t2b75IpIzX+f/q/Sk
dBvJjbWtGz+2nsJdWYhb0LfdRKNZsy9jzQxUCGmuPxs8xBrqUV3twvBxkigtEasR
7yTy62IvriewalMTnJ6YSDKBlPEHJtdyv7iIq8eEIkcBenAnfyj7XD9KX4nSelHZ
NUJGgwiFR5DYGGX/zLoaMcXnc+fSH3Gtfp9p60lwIRcc8AhLeHGwG+4iIPFcCL2d
W1Ud7UIhz345iDjudbNgV4jkvXqWGPJYNYIdV75mEWhjyhIRhwEWX8S1OMGUQNph
RMzGov16xhtknNwszyw7
=ahxw
-----END PGP SIGNATURE-----

--mercdybaxeeevdn3--


--===============6029996112825697044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6029996112825697044==--
