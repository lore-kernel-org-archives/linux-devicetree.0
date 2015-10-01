From: Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Qemu-devel] QEMU fw_cfg DMA interface
Date: Thu, 1 Oct 2015 10:11:07 -0600
Message-ID: <560D5B1B.10104@redhat.com>
References: <1443701677-13629-1-git-send-email-markmb@redhat.com>
 <560D5945.5050700@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="R0ltJd8H8qVfPRbIXrQ3tDlQf3lGuIruC"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <560D5945.5050700-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Marc_Mar=c3=ad?= <markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, seabios-VcxPKcuBGKdAfugRpC6u6w@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Drew <drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, Kevin O'Connor <kevin-BG7uPxbsK//k1uMJSBkQmQ@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Laszlo <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--R0ltJd8H8qVfPRbIXrQ3tDlQf3lGuIruC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/01/2015 10:03 AM, Eric Blake wrote:
> [meta-comment]
>=20
> On 10/01/2015 06:14 AM, Marc Mar=C3=AD wrote:
>> Implementation of the FW CFG DMA interface.
>=20
> The subject line is missing "v4" and "0/7". Also, the cover letter is
> missing a diffstat.  That makes it harder to see from the cover letter
> what the rest of the series is about.  'git format-patch/send-email
> --cover-letter' does what you want; you can even 'git config
> format.coverletter=3Dauto' to always include a decent cover letter on a=
ny
> multi-patch series.

Oh, I see - you sent a meta-cover letter (the one I replied to in this
subthread), and then a patch series including a cover letter (the real
0/7, then 1/7 and friends in-reply-to the 0/7) as a child of the
meta-cover.  It's still a bit awkward for tools that expect the 0/7 as
the start of the thread, and part of my confusion was caused by
out-of-order mail delivery due to the nongnu.org mail server still
recovering from its mail delays.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--R0ltJd8H8qVfPRbIXrQ3tDlQf3lGuIruC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWDVscAAoJEKeha0olJ0Nq288H/A3b9MJiRAu+blnbTajSM4rv
xzryT+7YG1oUjjWkWSvOjtdMtnOiKh0+8+iQwmwHMr+z/DxjAtpmrIFaxO5qywfL
07+frd/Sxw8sJkZKC1Pno8VEYnufvYj3i9xEKeEml0Ac7CvgOHbE5Yw3h8gD5o5S
9O6UKyybNPYDE+OySj56L/XfBNuCl48UHt0X/362zpegm+/2vxYMZMhawxNeTFie
0wXUtT+ZyutcgRJkJKtGme7JUWxY6t7QD6sIbsqG8srK7kLJjjUcRuBkivEyHGas
6nuYP6e0ckLhAgUBAdf6XkF6rHdvmSTYf96aIm1lBk4sc9svbGravcMsSz3eE+E=
=Gujz
-----END PGP SIGNATURE-----

--R0ltJd8H8qVfPRbIXrQ3tDlQf3lGuIruC--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
