From: Paul Kocialkowski <contact@paulk.fr>
Subject: Re: serial atag tag in devicetree ?
Date: Wed, 25 Mar 2015 23:35:10 +0100
Message-ID: <1427322910.26627.15.camel@collins>
References: <550EA6D8.3090702@redhat.com>
 <CAL_JsqK0VtDj_FmA8tQ5MRmGm-o2w7ia9U2_nD0aFDtTSfns2A@mail.gmail.com>
 <550FF971.407@redhat.com>
 <CAL_JsqLev+DeWCzvhF7bwYk3URxpgaQDR+6OmwWHjJ2nx=HijQ@mail.gmail.com>
 <551119F1.2060002@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1272531012=="
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <551119F1.2060002@redhat.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
To: Rob Herring <robherring2@gmail.com>
Cc: U-Boot <u-boot@lists.denx.de>, Ian Campbell <ijc@hellion.org.uk>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--===============1272531012==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-kmqLnUW5z3Y060NPrtU1"


--=-kmqLnUW5z3Y060NPrtU1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 24 mars 2015 =C3=A0 09:01 +0100, Hans de Goede a =C3=A9crit :
> Hi,
>=20
> On 24-03-15 00:12, Rob Herring wrote:
> > On Mon, Mar 23, 2015 at 6:30 AM, Hans de Goede <hdegoede@redhat.com> wr=
ote:
> >> Hi,
> >>
> >>
> >> On 22-03-15 22:01, Rob Herring wrote:
>=20
> <snip>
>=20
> >>> There is already "serial-number" (a string) which exists for
> >>> OpenFirmware. Also, "copyright" corresponds to vendor/manufacturer
> >>> string. Both of these are supported by lshw already.
> >>
> >>
> >> Ok, so if I understand you correctly then you're saying that we
> >> should set a "serial-number" string property at the dt root level
> >> and that this may contain pretty much anything, e.g. in the
> >> sunxi case the full 128 bit SID in hex.
> >
> > Right.
> >
> >> Is the use of the "serial-number" string property already documented
> >> somewhere? If not I'll submit a kernel patch to document it.
> >
> > Not that I'm aware of. It is something that predates our documentation
> > requirements. It could be in OpenFirmware specs. Documenting it in the
> > DT bindings does not hurt.
>=20
> Ok.
>=20
> >> And for older kernels we should not set any serial atag (u-boot
> >> always sets it, so this leaves it at 0) and old kernel users are
> >> out of luck wrt getting to the serial ?
> >
> > If there is sufficient reason to support this on old kernels you could.
>=20
> One problem with supporting this for older kernels is that if a non 0
> serial gets shown in /proc/cpuinfo with older atag booted kernels, we
> should really show the same number in /proc/cpuinfo which means adding
> code to the kernel to get the devicetree "serial-number" string property
> and somehow put that into the 64 bits which we have in /proc/cpuinfo,
> but given that the "serial-number" string could be hex or decimal or
> what ever and > 64 bits that will likely require a platform specific
> solution. All doable, but the question then becomes is this worth the
> effort ?

After investigating a bit more, I found out that the USB serial number
is expected to be a string of 32 bytes, so a 128 bit numeric serial
doesn't fit (it takes 32 bytes for the hex representation of 128 bits,
so there is no room left for the terminating null byte), hence it makes
sense to keep a 64 bit limitation for the serial number, if users are
going to rely on it as USB serial string. Moreover, it seems that
Android devices are mostly used 64 bit numbers for serial numbers/

I was initially going to suggest that we set it in stone that serial
must be 64 numeric bits (as it was in the ATAGs days) and that
bootloaders would pass it that way to the kernel through device tree
(with two 32 bits numeric integers), but Hans talked me out of it.
I just want to expose the situation (especially the USB and Android
thing) here to double-check that everyone still is convinced that a
string approach in device tree is best (which is fine with me).

This way, users that still want to use the serial passed through device
tree as a USB serial number will have to use a string of 32 bits,
including the null terminating byte (which is what I'll suggest for
sunxi by using only 64 bits for the serial number).

Also, I suggest that we show that serial-number string as-is in cpuinfo
as well and instead make a string out of the serial ATAG in the kernel
prior to showing it in cpuinfo (as opposed to translating the string
coming from device tree to a numeric value that cpuinfo will end up
showing as a string at the end of the day). Thus, the serial number
coming from device tree will still be shown in cpuinfo as well and no
ABI gets broken.

If you're all okay with this, I'll be sending patches to both U-Boot and
Linux to start documenting/implementing this.

--=20
Paul Kocialkowski, Replicant developer

Replicant is a fully free Android distribution running on several
devices, a free software mobile operating system putting the emphasis on
freedom and privacy/security.

Website: http://www.replicant.us/
Blog: http://blog.replicant.us/
Wiki/tracker/forums: http://redmine.replicant.us/


--=-kmqLnUW5z3Y060NPrtU1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJVEzgeAAoJEIT9weqP7pUMQOYP/1lCWMAPqcBY0o1z1YYtvXPb
HQx9TWT5S1+ACIlaTZbPlcLaercRvWacwmj5YNxfDFm4JpbCnjL2M84ok3IfVmp/
ANIb7C4sWSSB6tPbC5BZQGegs8lZFfDibe8FKHhnEpQOim6OlkBArtyWvFGlPo5T
h+0ODxUiMpkK2uUnz+drAn1oZUqWOM9sQtxAH+1NNwlKkVI5GEdHXRVELxAi1pXm
bW0br67QkzdYEV3LRqW87iz2U4TkiMXGHyFVOce8PvKHpJeeTitBePnG/aAf2qmM
8of3+OVir2kAURoHFV0wFi62hTabmsdTrRXsnyeZZIZ9+opVXmvA5Wdbek6T1ahp
pP3e4gxbiTpsi9nehd0s8TY5yzbxw43+ol3pDkiH3mvTYKsT0EvqCN29K7hH4Fe1
HJpkA58K1b/PdVI0SRarf3PtNuxY8UbNivmBrxmhdwL5hJtXqLXMXB26YA9u2UzD
RFdQkFElixfGjdYni+vx459DNZ6ViGGf6t51V00dexQn5EZTCaOq00hzEY0ACACc
TAjkH6wEEQX2dv3mW5q/gpB5CTwax43UKCATzHakRG4467uaRdsVTwGyF5wSnVFx
38Tg84C4u1xDaJT7NSfjKolotIMF4nwdQ3lM7daUBvY1zXYc74CzO3mrxzgBbh1S
il0on1WUIvNRCkW2259a
=O6Sj
-----END PGP SIGNATURE-----

--=-kmqLnUW5z3Y060NPrtU1--


--===============1272531012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============1272531012==--
