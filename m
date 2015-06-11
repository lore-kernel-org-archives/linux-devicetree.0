From: Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH v4 2/2] arch: arm: Show the serial number from
 devicetree in cpuinfo
Date: Thu, 11 Jun 2015 09:06:58 +0200
Message-ID: <1434006418.2669.18.camel@collins>
References: <1430206196-3483-1-git-send-email-contact@paulk.fr>
 <1430206196-3483-2-git-send-email-contact@paulk.fr>
 <20150607170306.376FBC40580@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8856227523571036807=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20150607170306.376FBC40580@trevor.secretlab.ca>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stefan Agner <stefan@agner.ch>, Hans De Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============8856227523571036807==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-Cm8auSW5H7gzCSCPAC29"


--=-Cm8auSW5H7gzCSCPAC29
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 07 juin 2015 =C3=A0 18:03 +0100, Grant Likely a =C3=A9crit :
> On Tue, 28 Apr 2015 09:29:56 +0200
> , Paul Kocialkowski <contact@paulk.fr>
>  wrote:
> > This grabs the serial number shown in cpuinfo from the serial-number de=
vicetree
> > property in priority. When booting with ATAGs (and without device-tree)=
, the
> > provided number is still shown instead.
> >=20
> > Signed-off-by: Paul Kocialkowski <contact@paulk.fr>
>=20
> One comment below, but otherwise:
>=20
> Acked-by: Grant Likely <grant.likely@linaro.org>

I'm afraid this was merged in Russell's tree already:
http://ftp.arm.linux.org.uk/cgit/linux-arm.git/commit/?h=3Dfor-next&id=3D3f=
599875e5202986b350618a617527ab441bf206

Still, it might be useful to make another patch on top with your
comments!

> > ---
> >  arch/arm/include/asm/system_info.h |  1 +
> >  arch/arm/kernel/setup.c            | 23 +++++++++++++++++++++--
> >  2 files changed, 22 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/arm/include/asm/system_info.h b/arch/arm/include/asm/=
system_info.h
> > index 720ea03..3860cbd40 100644
> > --- a/arch/arm/include/asm/system_info.h
> > +++ b/arch/arm/include/asm/system_info.h
> > @@ -17,6 +17,7 @@
> > =20
> >  /* information about the system we're running on */
> >  extern unsigned int system_rev;
> > +extern const char *system_serial;
> >  extern unsigned int system_serial_low;
> >  extern unsigned int system_serial_high;
> >  extern unsigned int mem_fclk_21285;
> > diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
> > index 1d60beb..b501754 100644
> > --- a/arch/arm/kernel/setup.c
> > +++ b/arch/arm/kernel/setup.c
> > @@ -93,6 +93,9 @@ unsigned int __atags_pointer __initdata;
> >  unsigned int system_rev;
> >  EXPORT_SYMBOL(system_rev);
> > =20
> > +const char *system_serial;
> > +EXPORT_SYMBOL(system_serial);
> > +
>=20
> Is there any need to export this symbol? It's only used by built-in
> code. Not by modules.

I agree, but I thought it would be consistent with the way
system_serial_high/low are exported. I'm not sure this was ever needed
either, but generally, I guess it makes sense to export parameters that
are passed to the kernel (it was through ATAGs before, now it's through
device-tree, but the logic remains the same).

> >  unsigned int system_serial_low;
> >  EXPORT_SYMBOL(system_serial_low);
> > =20
> > @@ -821,8 +824,25 @@ arch_initcall(customize_machine);
> > =20
> >  static int __init init_machine_late(void)
> >  {
> > +	struct device_node *root;
> > +	int ret;
> > +
> >  	if (machine_desc->init_late)
> >  		machine_desc->init_late();
> > +
> > +	root =3D of_find_node_by_path("/");
> > +	if (root) {
> > +		ret =3D of_property_read_string(root, "serial-number",
> > +					      &system_serial);
>=20
> of_property_read_string() will not modify the argument on failure. If
> system_serial is initialized to NULL, then the failure path is
> unnecessary.

Makes sense.

> > +		if (ret)
> > +			system_serial =3D NULL;
> > +	}
>=20
> Calls to of_find_node* functions increment the refcount for the node.
> Need an of_node_put() here, or just use the of_root pointer directly. It
> is safe to call of_property_read_string() with a NULL node pointer too,
> it will fail gracefully.
>=20
> So, the whole thing can safely boil down to:
>=20
> 	of_property_read_string(of_root, "serial-number", &system_serial);
> 	if (!system_serial)
> 		system_serial =3D kasprintf(GFP_KERNEL, "%08x%08x",
> 					  system_serial_high, system_serial_low);

Looks good to me, feel free to commit this change, on top of:
http://ftp.arm.linux.org.uk/cgit/linux-arm.git/commit/?h=3Dfor-next&id=3D3f=
599875e5202986b350618a617527ab441bf206

--=-Cm8auSW5H7gzCSCPAC29
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJVeTOSAAoJEIT9weqP7pUM//YP/RGs7emjjGuEoxS5kTFVQdZ2
f7IlKYU3Autq01WTWn96L/yiTatsMO5NiVskMS3wL6EdsQ/MB1EPfv5AYq1NhDgi
O20IoTtHUjx9MjuEAtCodqVJe1EqSD4/YPtGzyuukoVohsdyETTKAGD3rxPnTWeE
4SE/NBS6IgAFP9VzPv12IAknVYyfAQrDFZMNShklmzD4WtesRWQbBMMRT++aJHjG
szJtvkNU4HLBWKUHcNBoIHLaGpIa0tE2S2GYVtaF1YDtruKMS+0ZndCszTgbUrQ9
B82DT6+A4h8YfTRt/ACnixjvT8kEDq+TLt0yuBXCFYE+AzU1nKe3U5ny6KzJuYmw
BMrcJc76Et06Z7TGlu7EE7+pXdplAtu9UD4keFYse++4BUb09Wus9rfhtb5wtx4w
lKE2wK4eWgMATSjy2WaSXBzyB+C2DI6EIjsEZ6vg+Tha+12iW5fea6b9J0ufd0ef
Yp4ZQEWZj2+2DxtZ2GlHTSgRRH8pqGqzBj7Zm9c172O8OZCpfyB3nd9qeAlC9bHw
H8reZyjLlVSWwd+GUudh84MwvUMCeElDCpZ4CmUXw9OG9wTb2XBpFxqdspxCcgcb
5tS94UjJg6rM+mZQFrGFuHG2wRIAZ26hucxgf077xU9oWJh+lIH9IAg893mIqpsj
ELIOFt8kBpFaoVJM97q6
=kJBR
-----END PGP SIGNATURE-----

--=-Cm8auSW5H7gzCSCPAC29--



--===============8856227523571036807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8856227523571036807==--
