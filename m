From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] of: Export of_irq_count for using in modules
Date: Thu, 30 May 2013 15:49:43 +0200
Message-ID: <6aa29b1d109a46278a7f37b598defe07d6edfe60.1369921774.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8347542641284570195=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a MIME GnuPG-signed message.  If you see this text, it means that
your E-mail or Usenet software does not support MIME signed messages.
The Internet standard for MIME PGP messages, RFC 2015, was published in 1996.
To open this message correctly you will need to install E-mail or Usenet
software that supports modern Internet standards.

--===============8347542641284570195==
Content-Type: multipart/signed;
    boundary="=_mimegpg-monstr-desktop-9587-1369921783-0001";
    micalg=pgp-sha1; protocol="application/pgp-signature"

This is a MIME GnuPG-signed message.  If you see this text, it means that
your E-mail or Usenet software does not support MIME signed messages.
The Internet standard for MIME PGP messages, RFC 2015, was published in 1996.
To open this message correctly you will need to install E-mail or Usenet
software that supports modern Internet standards.

--=_mimegpg-monstr-desktop-9587-1369921783-0001

Export of_irq_count for modules.

Signed-off-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
We are using this function in remoteproc module drivers.
There is also drivers/gpio/gpio-mvebu.c in the tree
which use this function but this driver can't be compiled
as module. This could be also the reason why is not this driver as module.
---
 drivers/of/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index a3c1c5a..c918dde 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -374,6 +374,7 @@ int of_irq_count(struct device_node *dev)

 	return nr;
 }
+EXPORT_SYMBOL_GPL(of_irq_count);

 /**
  * of_irq_to_resource_table - Fill in resource table with node's IRQ info
--
1.8.2.3


--=_mimegpg-monstr-desktop-9587-1369921783-0001
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAlGnWPcACgkQykllyylKDCGXcQCfS3tTNrxzX02PzyO+iVbc9UuT
Bx8AoINF/8ZfB9Hw6Tyu+vR/xKiL66KK
=UDmo
-----END PGP SIGNATURE-----

--=_mimegpg-monstr-desktop-9587-1369921783-0001--

--===============8347542641284570195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8347542641284570195==--
