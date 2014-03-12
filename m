From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/5] mfd: add bcm590xx pmu driver
Date: Wed, 12 Mar 2014 00:40:30 +0000
Message-ID: <20140312004030.GH28112@sirena.org.uk>
References: <1394552775-31264-1-git-send-email-mporter@linaro.org>
 <1394552775-31264-3-git-send-email-mporter@linaro.org>
 <20140311160837.GP21216@lee--X1>
 <20140311221938.GO25092@beef>
 <20140311224517.GA5672@lee--X1>
 <20140311232545.GP25092@beef>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UU+P6sd7srm6fAXi"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140311232545.GP25092@beef>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--UU+P6sd7srm6fAXi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 11, 2014 at 07:25:45PM -0400, Matt Porter wrote:
> On Tue, Mar 11, 2014 at 10:45:17PM +0000, Lee Jones wrote:

> > Are there any inter-patch dependencies in the set? If so, we should
> > know about them so we can coordinate a sensible solution.

> Yes, the regulator driver (3/5) that Mark applied is dependent on this
> patch...the regulator driver includes include/linux/mfd/bcm590xx.h.

There's no actual dependency though - the regulator driver can only be
built if the MFD is enabled in Kconfig since it depends on it so until
the MFD is present in the tree it won't get built.

--UU+P6sd7srm6fAXi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTH6z7AAoJELSic+t+oim9/k0P/jx0GxmDS7i+kPAtBYWDAwnD
CSrOzMd63UfJdzXyQ+nt2zfC8FV+g8TGegQjgN3179LuX52zKPo9louXw/YrTTgi
i+XXh8nr+jCEcktX/wnBcpEcLBma/rWIUa3DWjlXKDXFIhfoPyKVcT5oEoG/sHJj
RV7PT+7QIk25zAnWo/mMv33l8M3qMwV4j/aeWlFnn5IPEaI3rtU18n/TFl3HnchI
yKGYyPgFhI7R0gFualm39QNYjGw/xm7u/f3aaP8V1o950H90P43XfgLfSHyCX4j/
A8F4JTR5q8pQDcfXLA9/GBvDgVkKHgYMQ8GBoLEYOYHyxZPFZ0mwwxoZhxj10ByT
+kujpqTdbI13QOUtMGz1edMSRRSNsEgSRz0b4qmqma8YYm5OW1z7mUuvhJXY1+V4
hT/eeP9LIjs0hH+1GgxwvqoVOHRxk+bQrQgIlKbdVAZJCP1+Wgj+Mg+/ZXi3D0k8
kUvvi1w8NfaCzYydTAHA/XLl/J2RinReS2rSyaV6marlo3epzPo981OYvf9fL1sa
nhMN7TIzQMke/RjSzEJA1iBoG1q+zg3/QSJR+spZ4lVtQLE/RsFJPRmHKZICjN3V
JE9I1cJkNgTD6Y23D5fVqkmHNf1IY0Nyq30OVxJsAUkCOvi2juYn1Wpc1tEfNrYz
HCqWOCo0YgXBtD7MTYSd
=c9RH
-----END PGP SIGNATURE-----

--UU+P6sd7srm6fAXi--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
