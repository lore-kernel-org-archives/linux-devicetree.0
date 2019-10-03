From: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] media: dt-bindings: media: Fixup Allwinner A10 CSI
 binding
Date: Thu, 3 Oct 2019 13:51:54 +0200
Message-ID: <20191003115154.6f2jgj3dnqsved2y@gilmour>
References: <b47ec7088aa4b07458519ab151de92df552a9302.1570101510.git.amit.kucheria@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nmzxrjrlzz4yd5h2"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b47ec7088aa4b07458519ab151de92df552a9302.1570101510.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--nmzxrjrlzz4yd5h2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Oct 03, 2019 at 04:52:24PM +0530, Amit Kucheria wrote:
> This new binding fails dt_binding_check due to a typo. Fix it up.
>
> linux.git/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml: $id: path/filename 'arm/allwinner,sun4i-a10-csi.yaml' doesn't match actual filename
> linux.git/Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts' failed
> make[2]: *** [Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.example.dts] Error 1
> make[2]: *** Waiting for unfinished jobs....
> linux.git/Makefile:1284: recipe for target 'dt_binding_check' failed
> make[1]: *** [dt_binding_check] Error 2
>
> Fixes: c5e8f4ccd7750 ("media: dt-bindings: media: Add Allwinner A10 CSI binding")
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>

Thanks for your patch.

It has already been submitted though:
https://lore.kernel.org/linux-arm-kernel/1568808060-17516-1-git-send-email-pragnesh.patel@sifive.com/

I'm not sure why it hasn't been applied yet though :/

Maxime
>

--nmzxrjrlzz4yd5h2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXZXg2gAKCRDj7w1vZxhR
xS0OAP0SU5JvkUNzuu7h9+tNkONFA7iQwgl1sR9AZpJjgOiFJAEAoJeO4CR/ZOBa
0Vu6m/HmNJojnOFoY2ILvkflVt+Zlwg=
=RF+5
-----END PGP SIGNATURE-----

--nmzxrjrlzz4yd5h2--
