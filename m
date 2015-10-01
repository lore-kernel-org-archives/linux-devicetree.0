From: Eric Blake <eblake-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Qemu-devel] QEMU fw_cfg DMA interface
Date: Thu, 1 Oct 2015 10:21:53 -0600
Message-ID: <560D5DA1.90607@redhat.com>
References: <1443701677-13629-1-git-send-email-markmb@redhat.com>
 <560D5945.5050700@redhat.com> <560D5C7E.8080900@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tIRQ79gjTSlrHj0Q2pnjsKowv4kg7smiK"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <560D5C7E.8080900-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?Marc_Mar=c3=ad?= <markmb-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, seabios-VcxPKcuBGKdAfugRpC6u6w@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Drew <drjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Hajnoczi <stefanha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, Kevin O'Connor <kevin-BG7uPxbsK//k1uMJSBkQmQ@public.gmane.org>, Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tIRQ79gjTSlrHj0Q2pnjsKowv4kg7smiK
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/01/2015 10:17 AM, Laszlo Ersek wrote:
> On 10/01/15 18:03, Eric Blake wrote:
>> [meta-comment]
>>
>> On 10/01/2015 06:14 AM, Marc Mar=C3=AD wrote:
>>> Implementation of the FW CFG DMA interface.
>>
>> The subject line is missing "v4" and "0/7". Also, the cover letter is
>> missing a diffstat.  That makes it harder to see from the cover letter=

>> what the rest of the series is about.  'git format-patch/send-email
>> --cover-letter' does what you want; you can even 'git config
>> format.coverletter=3Dauto' to always include a decent cover letter on =
any
>> multi-patch series.
>>
>=20
> This posting follows a little bit different pattern, one that I myself
> follow when posting patches for two (or more) components that must work=

> in sync.

Ok, makes sense. Maybe the only additional suggestions would be to make
it more obvious in the subject line (put the text 'cross-post'
somewhere?) or have the first paragraph of the meta-cover be more
explicit that there are going to be multiple sub-threads, one per
project, where all subthreads must be applied to their corresponding
project for the overall feature to be complete?

[And maybe I should wait a few minutes for the full thread to appear in
my inbox, rather than immediately replying to the first mail while the
series is still incomplete due to mail delays...]

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--tIRQ79gjTSlrHj0Q2pnjsKowv4kg7smiK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJWDV2hAAoJEKeha0olJ0Nq0/MIAIxKIcNd/na0Pnxm2O6c8hny
/j4/M2eC7lOfSDc74RTmkSBhA5yYJIphlgXYxYDWRi25qtb5+WHpdZRGjNKNzNfk
q4DE2i1G9BZqKAklqQDsNmyFXgWiZlZalUPUQG/JCm/qpZnoyr2HCNWwv2actMwS
CH/OvjivorrMKbCOx5FRoejOOroaDY9V/DtDg8aLtFVsoxEyaTv16BXvis6TnZox
McUagStYKjw7/2icRkNbScwS44Kk678yYiG1jbuTbmtHReMKGmNVaVlbZuL4MxUM
MRZpW7r5hWu2ngjQAsJrebJDNRbV9AYpV9eaCG7ytxPjsTsRZ9J/zylU60rzJDw=
=2MBY
-----END PGP SIGNATURE-----

--tIRQ79gjTSlrHj0Q2pnjsKowv4kg7smiK--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
