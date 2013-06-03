From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH RFC 2/3] clk: dt: binding for basic multiplexor clock
Date: Mon, 03 Jun 2013 13:07:22 -0700
Message-ID: <20130603200722.6077.85426@quantum>
References: <1370281990-15090-1-git-send-email-mturquette@linaro.org>
 <1370281990-15090-3-git-send-email-mturquette@linaro.org>
 <201306032133.20039.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201306032133.20039.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Quoting Heiko St=C3=BCbner (2013-06-03 12:33:19)
> Hi Mike,
>=20
> I think it's a multiplexEr clock in the patch title, and see below
>=20

Doh, you are right.  But "xor" is so much cooler looking than "xer"...

>=20
> Am Montag, 3. Juni 2013, 19:53:09 schrieb Mike Turquette:
> > Device Tree binding for the basic clock multiplexor, plus the setup
> > function to register the clock.  Based on the existing fixed-clock
> > binding.
> >=20
> > Also relocate declaration of of_fixed_factor_clk_setup to keep thin=
gs
> > tidy.
> >=20
> > Signed-off-by: Mike Turquette <mturquette@linaro.org>
>=20
> [...]
>=20
> > +
> > +     reg =3D of_iomap(node, 0);
> > +     pr_err("%s: reg is 0x%p\n", __func__, reg);
> > +
> > +     if (of_property_read_u32(node, "mask", &mask)) {
> > +             pr_err("%s: missing mask property for %s\n", __func__=
, node->name);
> > +             return;
> > +     }
> > +
> > +     if (of_property_read_u32(node, "shift", &shift))
> > +             pr_debug("%s: missing shift property defaults to zero=
 for %s\n",
> > +                             __func__, node->name);
> > +
> > +     if (of_property_read_bool(node, "index_one"))
> > +             clk_mux_flags |=3D CLK_MUX_INDEX_ONE;
> > +
> > +     clk =3D clk_register_mux_table(NULL, clk_name, parent_names, =
num_parents,
> > +                     0, reg, 0, mask, clk_mux_flags,
>=20
>                       ^- should probably be shift
>=20
>=20
> Otherwise looks cool and I'm currently trying it with my Rockchip cod=
e.
>=20

Right again.  My test platform seems to not shift the mask at all so
this did not cause a visible bug for me.

Thanks for the review,
Mike

>=20
> Heiko
