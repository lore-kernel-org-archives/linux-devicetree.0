From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH linux v7 6/6] hwmon: occ: Add callbacks for parsing P9
 OCC datastructures
Date: Mon, 13 Feb 2017 11:59:30 +1030
Message-ID: <1486949370.3661.5.camel@aj.id.au>
References: <1486509056-25838-1-git-send-email-eajames@linux.vnet.ibm.com>
         <1486509056-25838-7-git-send-email-eajames@linux.vnet.ibm.com>
         <CACPK8XeX12cQgJ2HqHFqvZmFh7TNWMJq3ysaOOmnh-kp02D+YA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-IHV915ZTm41NOKvdHaxf"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACPK8XeX12cQgJ2HqHFqvZmFh7TNWMJq3ysaOOmnh-kp02D+YA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, eajames <eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-IHV915ZTm41NOKvdHaxf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-02-10 at 16:01 +1030, Joel Stanley wrote:
> > +
> > +#ifndef __OCC_P9_H__
> > +#define __OCC_P9_H__
> > +
> > +#include "scom.h"
> > +
> > +struct device;
>=20
> Include the header for struct device instead.
>=20
> Did you consider the one header file for all of your shared functions?
> I don't think there's much value in having a whole heap of small ones.

My bias is against monolithic headers. While it would be no
linux/sched.h[1] so the impact won't be great, I prefer keeping headers
to only describing the abstract data type at hand. A collection of
small, relevant headers makes it easier for me to understand the
abstraction boundaries.

Andrew

[1] https://lwn.net/Articles/713712/
--=-IHV915ZTm41NOKvdHaxf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYoQv6AAoJEJ0dnzgO5LT5l4MP/RMFcsg2r/dBcRl7sT2uKdyS
uJ+wHBSnQaS72BVdIWmmiALTObJ3leUiWHe5S+9ZQ/AfmKOJXgTQTbwxNoUPFncJ
3h5/TJJjHZJV3hPlQJga50MOis40QfhOoxUbGOBfh1qVhhTkn4a+D0qF6cJqxdK3
NfF4HELEgSoNYAY1Kam3MbZTMHgoXcKEChlRhNhFZsjvtzmCMqv4de9sXOxXiKmV
sCujqSBHEkB7jc/wEgAbf1/0CgEdmq3ifRzPHhs0w3cUnz+QFNNtS89zLP2rCJp3
tuKLCdQ0eLGyunUZ597xhPn6dQJ0fM9NSUhMqKSA+927Y2aeuPunnyYBUX+BHPjx
/0atdL9MxBLoRn+dPcD4BIAYEJ8aNMTLApsZsaaFpkjYvl1h1/h8rzQ+0Mi/hhpQ
2JUdMvS4tiwBW3WomXn0Dk3OGIzxuKaaFXbtqrR/3RKKW25U3El+/L8IqwUp6x8F
fP1gL8LW1N9Bvy+SaQ2EmXSFoN5w4BJhw1X2xUEZILtMpdWbrE8Y+3pnR+lXSjvD
3cPxtpJwQJBER7Anhb9RTDUJFZVIYv/USfn+WQh4mNNPwSrliHQ9QVJi9S0RRuN0
76JN5uVpOzGlCk1MIloP7QxFfAlnFQpCKOPIEKxesDI6GBqWnQts2RIJYNawAcn+
Wr9p63TXB2w3eTVgF9WO
=F21f
-----END PGP SIGNATURE-----

--=-IHV915ZTm41NOKvdHaxf--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
