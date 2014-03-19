From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv2 4/8] Doc/DT: Add DT binding documentation for HDMI
 Connector
Date: Wed, 19 Mar 2014 10:11:30 +0200
Message-ID: <53295132.6000003@ti.com>
References: <1395130547-18633-1-git-send-email-tomi.valkeinen@ti.com>	
 <1395130547-18633-5-git-send-email-tomi.valkeinen@ti.com>	
 <1395132234.4134.1.camel@paszta.hi.pengutronix.de>	
 <1664822.t9aWz7hh4g@avalon>
 <1395216233.4300.6.camel@paszta.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5161276834994808497=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1395216233.4300.6.camel@paszta.hi.pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Philipp Zabel <p.zabel@pengutronix.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, Tomasz Figa <tomasz.figa@gmail.com>, dri-devel@lists.freedesktop.org, Archit Taneja <archit@ti.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Rob Clark <robdclark@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

--===============5161276834994808497==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="6LA0VUvm9sUVkwPPbpCgAsFwDoLcsT1i1"

--6LA0VUvm9sUVkwPPbpCgAsFwDoLcsT1i1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 19/03/14 10:03, Philipp Zabel wrote:

>>> Geert's comment also applies to all other connector types. These can =
be
>>> input connectors, too.
>>
>> We might not need to define all the properties required by input conne=
ctors=20
>> now, but we need to make sure that future extensions will be backward-=

>> compatible. I don't see a problem in making the connector DT bindings =
depend=20
>> on the direction as long as the direction is specified in the DT node,=
 either=20
>> explicitly or implicitly.
>>
>> An obvious solution would be to have separate "hdmi-input-connector" a=
nd=20
>> "hdmi-output-connector" compatible strings but I don't like that, as t=
here's=20
>> no difference in the HDMI connector itself, only in the usage.
>=20
> I don't think this is necessary, either. I just meant the wording for
> the video port should leave the direction unspecified. I imagine
> somebody somewhere will connect a HDMI connector to a mux so that it ca=
n
> be either input or output.

I don't disagree, but I think it's better to change the wording when
someone has a working setup and can try it. These bindings have been
designed only with video output in mind, and I'd rather have them
constrained to that purpose for now.

One reason for keeping them output only is that when someone wants to
use these for capture, he needs to change the binding docs, and it'll
gather more attention than just using the bindings in a board's dts.

That said, we should take care to make the bindings so that nothing
prevents their use for capture (which I think they allow in their
current form).

 Tomi



--6LA0VUvm9sUVkwPPbpCgAsFwDoLcsT1i1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTKVEyAAoJEPo9qoy8lh71neQP/0Vn30Az1qc7ZMInBhmzVtjL
fBagqNxl7nbJ3SoPSC78kdmZZ0ScbLGyq82a5qm8v9vREoT9TkbeXOsOJoy40CUF
1sAL6Unv5L9jUDO4D4WLBV15/Tz489D84mAxAWQJr+AcH8v3XX++m1SWo0hawukh
UcrkyriykJ7FOWxK2x89rG1ME35eJflSfVf85B1Jmv8pLHwvke8ExYMbW2jF16mP
aPWrR+Q6Xc3Yd7Ymvl+ZoViXwxW50wjwWBAlhECpExx1HM+zVzKCgD0RKeVeYefL
AEalOc8rBjwLPPWugoz58zF2db4p1YHnxxDPaykrI7YHe9aPLlS2eeLt3FDCwHiy
bVhgQobDmLU3eIfRLhkSX+VlW7HCmHHyo/jAkHHCNAgq9XBPwck1qd1TAT4YXkg8
YO9IzRFK/aRzsIMFawdIyRO+ZhN7hUQ4NYXUKhF/ukP9xcR85y8JfMJXfwl3kPQW
KIIhxVIHrvWpGak+EHsnrOflYWrQ1GRhRvSUGteWd6bqJiFwI3UNzXF7lz85eGEO
UzoGszooW0an51lJY8jwpZkjwGzuQNiRZ28a0wvwbWtWivKmXVFpFI/rFYdStovT
QrhFlaublhHObsnqyjU93CdRHKYTxBNn/EMBD9XzBn9+NwJ1qvMVTqQMl+5J6Mta
xnbTqMrIwbZwvwg4AVq5
=Xk2R
-----END PGP SIGNATURE-----

--6LA0VUvm9sUVkwPPbpCgAsFwDoLcsT1i1--


--===============5161276834994808497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5161276834994808497==--
