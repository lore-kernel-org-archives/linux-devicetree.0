From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: regulator: tps65023 : Adding support for DT
Date: Mon, 15 Dec 2014 16:56:27 +0000
Message-ID: <20141215165627.GF11764@sirena.org.uk>
References: <CAL8zT=jo2AsK9p_r_C+od_QEovOQNmo7MnNu9JtUHoA=KtsxGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="N/O9EBh0K7980Yi6"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL8zT=jo2AsK9p_r_C+od_QEovOQNmo7MnNu9JtUHoA=KtsxGw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Michel Hautbois <jean-michel.hautbois-B+Q8N6RmIDZBDgjK7y7TUQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--N/O9EBh0K7980Yi6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 11, 2014 at 09:36:26AM +0100, Jean-Michel Hautbois wrote:

> I started to add support for DT in this regulator, but I can't get a
> booting kernel with it. I know it lacks regulator init in the parse_dt
> function, but I don't really know what is the best way to do it. I
> have used tps6507x as an example until know...

Well, the best thing to do would be to backport the changes to add
support for DT parsing in the core and use that.  See "regulator: of:
Provide simplified DT parsing method" and preceeding commits in
mainline.  Otherwise what you've got looks basically OK from a quick
scan through.

> I don't know for instance if a tps_board is needed (it would contain
> only a struct regulator_init_data * so probably not very useful) ?

Probably not, no.

> Below is my current status (I also have created a tps65023.dtsi in
> arch/arm/boot/dts which is only a copy of tps6507x.dtsi so didn't copy
> it here).

If you need to create a .dsti file for a regulator that's a warning sign
- it should be empty.  You'll want things in the particular board but
that ought to be board specific things rather than something that
applies to all boards using the regulator.

--N/O9EBh0K7980Yi6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUjxK6AAoJECTWi3JdVIfQNMwH/1pACLvHtOmlqL17pbtgneZV
vYzufWsSJdh6zx5URgKSF0mjjt9bDs7Ru8dxXsKcVo1t3KI6r0/Xm8Uxov5cO5b+
6NZwBTa1/C16tqVlQGO/SNiNj4KuZezX77gGElWfRxV6geK+cJYo6VQFJWxUcwK2
9oOdt/4c3xtuTBUfHot8LLt9x6X+zk2WsWBAJOMYPyiAk6r5vkGC62Jm2rx9sOZE
CK2PBwH/vlGSAkXScIL8eZBW9wsZNWIaEf+MOjMhJeixf9BV0YJZQTRH2si2RbWF
S7JvPmVoENjmm0l8cWu4/XnHe7laE6VoPIkXy+39SbLUZj66cJuarVlKXOH59ew=
=YQZS
-----END PGP SIGNATURE-----

--N/O9EBh0K7980Yi6--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
