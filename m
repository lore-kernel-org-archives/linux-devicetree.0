From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 7/9] Doc/DT: Add DT binding documentation for Sony acx565akm
 panel
Date: Fri, 28 Feb 2014 15:47:07 +0200
Message-ID: <5310935B.1070605@ti.com>
References: <1393590016-9361-1-git-send-email-tomi.valkeinen@ti.com>	 <1393590016-9361-8-git-send-email-tomi.valkeinen@ti.com> <1393594707.3802.31.camel@paszta.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="bKxAoMHM3OKHtFSMMrQ8ITRfjihNpKnXe"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393594707.3802.31.camel-+qGW7pzALmz7o/J7KWpOmN53zsg1cpMQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--bKxAoMHM3OKHtFSMMrQ8ITRfjihNpKnXe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 28/02/14 15:38, Philipp Zabel wrote:
> Hi Tomi,
>=20
> Am Freitag, den 28.02.2014, 14:20 +0200 schrieb Tomi Valkeinen:
>> Add DT binding documentation for Sony acx565akm panel
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
>> Reviewed-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
>> Reviewed-by: Archit Taneja <archit-l0cyMroinI0@public.gmane.org>
>> ---
>>  .../devicetree/bindings/video/sony,acx565akm.txt   | 28 +++++++++++++=
+++++++++
>>  1 file changed, 28 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/video/sony,acx56=
5akm.txt
>>
>> diff --git a/Documentation/devicetree/bindings/video/sony,acx565akm.tx=
t b/Documentation/devicetree/bindings/video/sony,acx565akm.txt
>> new file mode 100644
>> index 000000000000..cd9cfdf7e3fe
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/video/sony,acx565akm.txt
>> @@ -0,0 +1,28 @@
>> +Sony ACX565AKM SDI Panel
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>> +
>> +Required properties:
>> +- compatible: "sony,acx565akm"
>> +
>> +Optional properties:
>> +- label: a symbolic name for the panel
>> +- gpios: panel reset gpio
>=20
> please let's call this reset-gpios.

Yes, I'll change this and the tfp410 one.

 Tomi



--bKxAoMHM3OKHtFSMMrQ8ITRfjihNpKnXe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTEJNbAAoJEPo9qoy8lh71n0AP/i90S2vnKeZp2NmP5vUtqk+6
Y64Bjpl1t/En1Xa7LzuGsx4/jz+KYs/z7jRcD2BeiQ8kjVNOvXTVP5YYRYEEktqP
BJM0yWKfU6vqrv+Mx6uQKIJ8j0J66vBpmY9Yi2NNYeW9D0I/BF4XFeP+GqyOWEhf
BrWn38+WkkhOr0tHj0kwGurFMZInMxwCtx2h4Zrb+Cva9d91o9aU54Y6YTicBjJx
1g8CmFcAtodv5tZWE3LB8oUJa1gUCGq6vNZlf4j5BZp6apI1Cu55C3CjZFMYGl6M
RpgUezPH3cmsyWHVa+Wmxgwis9L1DEV6e0jPKOaI10usis3BCMnadDJsDho6C611
yAhebyGGhZvSCcuygWq/pQLmXDOj8lF0NWXxY1Wfe/Ur+BboTn2KsLA1eCYvleYp
qUdcNKpYvV/Y9hyXhcpZuiCIGnPWgxM5yS1VcV1c8hadg+Shm1Rgmm3afYWjJx3e
mMO4XgbjUjAqadSETjruP5Z4WMogz0BDjGka/RCQVaEuDAZPuUGvJ6ho0h7uflTZ
RlKOEIQgtTWp+bAsz+D9fa6xGpMIR9A6pdVedoA+EOTag4jG2Q9GgljvXbgXkYTe
hIJ02EZrEiqOkNOj6fdf4xtx/KnBl51aqK756zzP5sImtSgmRsgQRCTmvghfOrMC
g2uInWitLxCNAOZ4d86C
=EjGF
-----END PGP SIGNATURE-----

--bKxAoMHM3OKHtFSMMrQ8ITRfjihNpKnXe--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
