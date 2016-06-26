From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 00/15] clk: sunxi: introduce "modern" clock support
Date: Sun, 26 Jun 2016 18:24:31 +0200
Message-ID: <20160626162431.GL4000@lukather>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
 <20160621014816.GT1521@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ai3I8gwHc37+ASRI"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160621014816.GT1521@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Jean-Francois Moine <moinejf@free.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--ai3I8gwHc37+ASRI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Mon, Jun 20, 2016 at 06:48:16PM -0700, Stephen Boyd wrote:
> On 06/07, Maxime Ripard wrote:
> >=20
> > The current code has been tested on the H3 and an Orange Pi PC,
> > including making sure that MMC still works, so the general approach
> > seems ok.
> >=20
> > Let me know what you think,
>=20
> Overall this looks pretty good. Thanks for taking the time to
> rework the driver.
>=20
> The macro nesting is sort of concerning, but if you're willing to
> live with a maze of macros I'm not too worried. Also, I don't see
> why we have to use the ccu_common structure everywhere even when
> we're not gaining from it, but it's not a huge problem either
> way. The non-mmio clks could be split off from the mmio list and
> then registered in two lists, or there could be mmio list that
> sets up the base address and then a larger list of clk_hw
> pointers that we just run through and register.

Ok, I'll move the fixed factor clocks out of the ccu_common list.

> It would be great if we could squeeze some more code reuse out of
> the basic types too, but I'm not sure if there's much more that
> can be done. Sometimes I'm seeing the same code multiple times
> for handling muxes with parents and dividers or muxes without
> dividers, etc. But that seems like future work that isn't going
> to block anything here.

I tried my best already to move the common code, but it's not clear at
this point what can be factorised and what will only be used by a
single clock driver. Obviously, as we will support more SoCs, that
will become clearer and we will be able to factor out the code that
needs to be.

> Finally, can you please use the clk_hw_register() APIs that we've
> recently added. That will save us some time converting a new
> driver over to use the new style of registering clks.

Ack, consider it done.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ai3I8gwHc37+ASRI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXcAG/AAoJEBx+YmzsjxAgwaEQAK3kdKftZXsegDhB7jnkHgkZ
O3RnOLpmRzy7Hyld7Vjg6sa18LQdeyqW7T9DZVqGpf/MYllaB3vKDi9tqysL43kK
YLDFWgKcQ/aZ9Bet4qok+0a6zsH+WvsCx+aSISg5X8Q0FKYij2FQz0LBIDskujce
cUmg5NVJfDSg9ssAWhoP5cvDVZ4nph0dL72Np0AhE3mePBLL4a0E7TviX22iKDmu
mIWt7MfQaywPLTqa8gJLOLR1hBTwcXx8n5V04z1gclEXwYx64gfPmtOV7d8wwiMG
TAYeRSyIPcHoIytQyKDsL15I2bpHAm6IN4/2MB6lpLtg9gI6LH23eoFz0I1LhVzh
AN0TDkzWbwVwr1QxTfWME12v07TXcVK7GIuhpzUqPmqmNzd4TmpOSDNLpmDx19uE
9Uax82cA5tzAJ0bTNmtuZdtZ+h9bO66e2dmgBMse+1dPkqP3jdfMT4+9+GxGLRa3
+f0N4i+4ottmkCqEd/GdhCYCHhM/lx/oK0Oq1uQH4u/c0yWjK+kBZYqAfn1+2fWR
iQzcuidOgJobMyBa7fj4utOGDRTZGageKk7lRwinmTgIc3jIY/1i4i6CFyL60qQ8
xjxSVySFTkVI8CSyH/qyCAJsepu1Rgms6w3lBh10tSonLo5cBEpCygsByaAAxv/J
o+7nXpXqAgGxr+7mK0lL
=jVlh
-----END PGP SIGNATURE-----

--ai3I8gwHc37+ASRI--
