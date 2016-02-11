From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM64: zynqmp: Use 64bit size cell format
Date: Thu, 11 Feb 2016 19:58:19 +0100
Message-ID: <56BCD9CB.9030803@monstr.eu>
References: <2f160e012080d5d6de11238ade239bb0bb224f64.1455193571.git.michal.simek@xilinx.com>
 <36fb9c4c9b2019b854e84dc0a9a01252a6de2337.1455193571.git.michal.simek@xilinx.com>
 <CAL_JsqK0=LaXqJyr_rGKCzGgt5kFy79-4ARocTGpKved3JU-Ug@mail.gmail.com>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="FXv5r0qmMunHb9j5mggGcHEXN4Hj0rkSI"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqK0=LaXqJyr_rGKCzGgt5kFy79-4ARocTGpKved3JU-Ug-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Suneel Garapati <suneel.garapati-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Shubhrajyoti Datta <shubhraj-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FXv5r0qmMunHb9j5mggGcHEXN4Hj0rkSI
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On 11.2.2016 17:13, Rob Herring wrote:
> On Thu, Feb 11, 2016 at 6:26 AM, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>=
 wrote:
>> Use 64bit size cell format instead of 32bit for memory
>> description. Change 64bit sizes also for all others IPs.
>=20
> Why? As is, this change is completely pointless because nothing needs
> a >4GB size. Do you have peripherals with >4GB size?

The change I need to do is to support more than 4GB memory. Memory space
is divided to some parts. 2GB connected to hard part below 4GB. There
there is 1GB connected to PL part below. Then 32GB hard part above of
4GB and a lot of space for PL part (~230GB).

PCIe can also address more than 256GB.

That's why I stand before decision. Change size-cell for all IPs which
are currently listed. Or just change it for memory node which is listed
in mainline.
I am not quite sure how PCIe description will look like and if there is
any other IP which will required on current buses use sizes more that
4GB. That's why I have change all sizes to support more than 4GB.

But definitely current need is to support more than 4GB memory size and
I have no problem to use not empty ranges property and keep there
#size-cells =3D <1>;

Both solution works for me. Definitely thank you for your comments.

Thanks,
Michal



--FXv5r0qmMunHb9j5mggGcHEXN4Hj0rkSI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAla82c4ACgkQykllyylKDCG+fQCgktEdt72JOLQcliasqL8ph51X
vz4AoIy5JeUl6JtF0o1G62WS0/CKejnb
=4gLS
-----END PGP SIGNATURE-----

--FXv5r0qmMunHb9j5mggGcHEXN4Hj0rkSI--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
