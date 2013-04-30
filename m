From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH V2] video: implement a simple framebuffer driver
Date: Tue, 30 Apr 2013 10:28:35 +0300
Message-ID: <517F72A3.6010009@ti.com>
References: <1365043183-28905-1-git-send-email-swarren@wwwdotorg.org>
 <20130408171637.98b5ad1f867bcbda883af68b@linux-foundation.org>
 <2569832.XQDrhUGNaI@avalon> <2863648.BDvrAG5uPk@flatron>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0156136424708990695=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <2863648.BDvrAG5uPk@flatron>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Stephen Warren <swarren@wwwdotorg.org>, devicetree-discuss@lists.ozlabs.org, Rob Clark <robclark@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Olof Johansson <olof@lixom.net>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============0156136424708990695==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="----enig2UHKKHCHSTVEIUVTHVASA"

------enig2UHKKHCHSTVEIUVTHVASA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 04/30/2013 12:15 AM, Tomasz Figa wrote:

> Well, there is also at least one legitimate use case for this driver.
>=20
> I believe there exist embedded devices on which there is no need to=20
> dynamically control the framebuffer. It needs one time initialization, =

> usually in bootloader, and then it is used as is, using constant=20
> parameters as long as the system is running.
>=20
> I doubt there is a need for any KMS (or any other control) driver for s=
uch=20
> devices - dumb framebuffer driver would be everything needed in such ca=
se.

Isn't there usually the need to power off the hardware when
blanking/suspending?

 Tomi



------enig2UHKKHCHSTVEIUVTHVASA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJRf3KjAAoJEPo9qoy8lh71W4AP+wfd4jG+Gmk3CFBu+XdV9xpV
hmmbNpN+PLeKVU/+tPZYq/eswVlnwvuEOuOpftstcGqlURP9MUxRKyrnKGvWJjQ+
zoAvM7oIOHzQmKNW39OJQbJdmCXb0si44lJXSvD/4qa311E107eHCOKGTgG0DU5v
r7pVkTaiZ7aft8ZReGyFWvE5W4LV2OXVroXVSM5kdfjDOvPT7VBk72cpb0PI3zH7
FA05XmEzNSDcOBrzTfIpwY/2zuQ2fd6KXU6NX64wSkEjasBLIAuooW/8wrqmDM+O
p/wuL8uFf8M/hgV9H8JOpyLyMHc0n8j8vLyupO2cpSm23mdtqT0F8zjVAKx1MOsG
3RKp6rXwI7Yapfe79tPny9n9n1N6t4hkp6aLWowpLxOSDcEQHmIgqJKMd93IuchF
Hy29nwG5HZlus7AoNeqlGjtDj002Ii14wE5ihJKoodHcxq9lcckrNW/0L6N8OgCa
aTSD69HUtoeKIw4yJqrfPyi5qgmg/QhOEM+JGSn6GfDmWPJa9LeyBaUgnb3kWtDn
vsb4ZTNUNXl3O4vUJM+xRllP6w3rbjcMDhn4f4wtuxkALrSAy1mNR1G2LorXo3Mb
ATku6/uBykIcegF9QhFo4GZ+JzV5EAHeAd0lk98o5nRmEmum/wmVVRCyUOTTwFAa
3MKmm20xNQeKNYLNkI+m
=n47N
-----END PGP SIGNATURE-----

------enig2UHKKHCHSTVEIUVTHVASA--


--===============0156136424708990695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0156136424708990695==--
