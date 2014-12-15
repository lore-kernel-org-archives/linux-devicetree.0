From: Nikolaus Schulz <nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 2/2] iio: add driver for the TI DAC8554
Date: Mon, 15 Dec 2014 11:22:23 +0100
Message-ID: <20141215102223.GB6159@avionic-0071.adnet.avionic-design.de>
References: <1416858614-32265-1-git-send-email-nikolaus.schulz@avionic-design.de>
 <1416858614-32265-2-git-send-email-nikolaus.schulz@avionic-design.de>
 <548C2335.7080301@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <548C2335.7080301-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Welling <mwelling-EkmVulN54Sk@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Dec 13, 2014 at 12:29:57PM +0100, Lars-Peter Clausen wrote:
> On 11/24/2014 08:50 PM, Nikolaus Schulz wrote:
> [...]
> >+const struct iio_chan_spec dac8554_channels[] =3D {
>=20
> static
>=20
> [...]
> >+	ret =3D of_property_read_u32(spi->dev.of_node, "address", &addr);
>=20
> This should probably have vendor prefix.

Both fixed in v3, thanks!

--=20
Avionic Design GmbH
Nikolaus Schulz
Wragekamp 10
D-22397 Hamburg
Germany

Tel.:  +49 40 88187-163
=46ax:   +49 40 88187-150
Email: nikolaus.schulz-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org

Avionic Design GmbH
Amtsgericht Hamburg HRB 82598
Gesch=E4ftsf=FChrung: Cornelis Broers
Ust.-Ident-Nr.: DE813378254
