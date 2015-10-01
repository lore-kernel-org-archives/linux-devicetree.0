From: Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-devel] QEMU fw_cfg DMA interface
Date: Thu, 1 Oct 2015 10:03:17 -0600
Message-ID: <560D5945.5050700@redhat.com>
References: <1443701677-13629-1-git-send-email-markmb@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QxtUBwC9fW9Sn5KK6v0mh6IH6RhB7dCFe"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443701677-13629-1-git-send-email-markmb@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Marc_Mar=c3=ad?= <markmb@redhat.com>, linux-kernel@vger.kernel.org, qemu-devel@nongnu.org, seabios@seabios.org
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <rob.herring@linaro.org>, Drew <drjones@redhat.com>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Stefan Hajnoczi <stefanha@gmail.com>, Alexander Graf <agraf@suse.de>, Kevin O'Connor <kevin@koconnor.net>, Gerd Hoffmann <kraxel@redhat.com>, Laszlo <lersek@redhat.com>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QxtUBwC9fW9Sn5KK6v0mh6IH6RhB7dCFe
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

[meta-comment]

On 10/01/2015 06:14 AM, Marc Mar=C3=AD wrote:
> Implementation of the FW CFG DMA interface.

The subject line is missing "v4" and "0/7". Also, the cover letter is
missing a diffstat.  That makes it harder to see from the cover letter
what the rest of the series is about.  'git format-patch/send-email
--cover-letter' does what you want; you can even 'git config
format.coverletter=3Dauto' to always include a decent cover letter on any=

multi-patch series.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--QxtUBwC9fW9Sn5KK6v0mh6IH6RhB7dCFe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWDVlFAAoJEKeha0olJ0NqD+8IAKL01vHWDPno/NYltdHSAKPk
fQ18iKbe6NhWbT1RSlWna7gxDTXb+2FrqLHFc+gZLo5g9q8UYzfWTfwJCc7AeRK3
OH01nrR8OslEYWqqOfaiQaa7zVHiUV1FFWo4eVvbeKx/acCDjPOTNRaTU0wIz0x2
0Rhg6HYJBl90i25c6q/WF2FlqWDmhNnXVPCgaG2dywGjUIjzawmRZiokQqKFG3Qy
/8PzRXx/HhQ3mxIcfuF8yYyQiAJq2IUFhSqvyq1K/W687owKX9rsLtfyd/LZQh2A
xIT9e+ZizuNueOw6NhutVkaPTbQ4zk7aSjLGbgGRh/PqBJgf+JPiywaCUaEhYWk=
=qhVP
-----END PGP SIGNATURE-----

--QxtUBwC9fW9Sn5KK6v0mh6IH6RhB7dCFe--
