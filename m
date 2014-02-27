From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v4 3/3] Documentation: of: Document graph bindings
Date: Thu, 27 Feb 2014 10:08:52 +0200
Message-ID: <530EF294.7070801@ti.com>
References: <1393340304-19005-1-git-send-email-p.zabel@pengutronix.de>		 <1393340304-19005-4-git-send-email-p.zabel@pengutronix.de>		 <530DE8A9.9050809@ti.com>	 <1393426623.3248.70.camel@paszta.hi.pengutronix.de>	 <530DFF4C.8080807@ti.com> <1393429676.3248.110.camel@paszta.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="GNinQAo0stj3og6uRVkcSDVT8AM0eh3CT"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393429676.3248.110.camel-+qGW7pzALmz7o/J7KWpOmN53zsg1cpMQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--GNinQAo0stj3og6uRVkcSDVT8AM0eh3CT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 26/02/14 17:47, Philipp Zabel wrote:

> Ok, that looks compact enough. I still don't see the need to change mak=
e
> the remote-endpoint property required to achieve this, though. On the
> other hand, I wouldn't object to making it mandatory either.

Sure, having remote-endpoint as required doesn't achieve anything
particular as such. I just feel it's cleaner. If you have an endpoint,
it must point to somewhere. Maybe it makes the code a tiny bit simpler.

If we do already have users for this that do not have the
remote-endpoint, then we're stuck with having it as optional. If we
don't, I'd rather have it as mandatory.

In any case, it's not a very important thing either way.

>> Of course, it's up to the developer how his dts looks like. But to me =
it
>> makes sense to require the remote-endpoint property, as the endpoint, =
or
>> even the port, doesn't make much sense if there's nothing to connect t=
o.
>=20
> Please let's not make it mandatory for a port node to contain an
> endpoint. For any device with multiple ports we can't use the simplifie=
d
> form above, and only adding the (correctly numbered) port in all the
> board device trees would be a pain.

That's true. I went with having the ports in the board file, for example
on omap3 the dss has two ports, and N900 board uses the second one:

&dss {
	status =3D "ok";

	pinctrl-names =3D "default";
	pinctrl-0 =3D <&dss_sdi_pins>;

	vdds_sdi-supply =3D <&vaux1>;

	ports {
		#address-cells =3D <1>;
		#size-cells =3D <0>;

		port@1 {
			reg =3D <1>;

			sdi_out: endpoint {
				remote-endpoint =3D <&lcd_in>;
				datapairs =3D <2>;
			};
		};
	};
};

Here I guess I could have:

&dss {
	status =3D "ok";

	pinctrl-names =3D "default";
	pinctrl-0 =3D <&dss_sdi_pins>;

	vdds_sdi-supply =3D <&vaux1>;
};

&dss_sdi_port {
	sdi_out: endpoint {
		remote-endpoint =3D <&lcd_in>;
		datapairs =3D <2>;
	};
};

But I didn't like that as it splits the pincontrol and regulator supply
from the port/endpoint, which are functionally linked together.

Actually, somewhat aside the subject, I'd like to have the pinctrl and
maybe regulator supply also per endpoint, but I didn't see how that
would be possible with the current framework. If a board would need to
endpoints for the same port, most likely it would also need to different
sets of pinctrls.

 Tomi



--GNinQAo0stj3og6uRVkcSDVT8AM0eh3CT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTDvKUAAoJEPo9qoy8lh71XYIP/1U19BoW8JwnS2UYYS0d6/ZA
ZnkuNwoxZKJ43qMAsagZ8XTsgtTl+N/4vyifC6ZqeaM7D0MWDO9Vw732+STVvUV3
+7AOah4B16SQeuhcLfPYpwxkFlQ8+6t3v3C9OtfCif6+UKtJ0UOKEeHKlqbLBal3
0WZSTjZmT53oGe0WCUPYPEK/S1CVQ+Dgyj+oAk1fqVP33AvzfyA1UvTkl+MyNiFf
JJBNkvvDwIbbrhHiqMa90o+yLtcyK2xqHprMxHnP+WO1tPUW2lzqO7rqWpcTZZDR
ptVLjNftCaT+4BL1kUU8bRDOtij+3/aXkLCwo18hAQjm8mPE3t7ZHI7T6iKMICiA
s4Q0/fAm9/ZjLxqOyo1XArkjwTw+tSLYqeFHdU0PbT/mgwtgOHtWS7Dd6mbNLebg
FAVDQk++I2735Q+u/ni+S10c4rQdhVcbah0H+KVb03z6Ry2Ca5bf/QsEbM632QoA
pLWrdvMNSZUXj12r2bZywuyuh4035ogFdTSg/x0XqQyJfh/05YwlVk4rBzLKVLMv
v6ZbUWdItzlEsFmVqCQr3Fi0AlE59s5U/ZXgZ9izd3S+I9f5DlHj2LZ4lBhPe8po
JY0x1WXGtbKWe89z+6JS+q5DdlC7Hcd98tO54tFG97VIUg6LUoWoZVsscJXxd92r
nLM2WwNiNMJSKKfgFS0/
=Wx3W
-----END PGP SIGNATURE-----

--GNinQAo0stj3og6uRVkcSDVT8AM0eh3CT--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
