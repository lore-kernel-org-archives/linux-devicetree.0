From: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 06/10] fdtdump: add a --scan option
Date: Thu, 11 Apr 2013 18:44:20 -0400
Message-ID: <201304111844.21667.vapier@gentoo.org>
References: <1365618555-5893-1-git-send-email-vapier@gentoo.org>
 <1365618555-5893-7-git-send-email-vapier@gentoo.org>
 <20130411041130.GB8165@truffula.fritz.box>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7031806435206454006=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130411041130.GB8165-W9XWwYn+TF0XU02nzanrWNbf9cGiqdzd@public.gmane.org>
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
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============7031806435206454006==
Content-Type: multipart/signed;
  boundary="nextPart3010116.3bgGIvlaMV";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3010116.3bgGIvlaMV
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 11 April 2013 00:11:30 David Gibson wrote:
> On Wed, Apr 10, 2013 at 02:29:11PM -0400, Mike Frysinger wrote:
> > Often times, fdts get embedded in other larger files.  Rather than force
> > people to `dd` the blob out themselves, make the fdtdump file smarter.
> >=20
> > It can now scan the blob looking for the fdt magic.  Once locate, it do=
es
> > a little validation on the main struct to make sure we didn't hit random
> > binary data.
>=20
> Hrm.  I have mixed feelings about this.  The scanning functionality is
> certainly useful.  But on the other hand, fdtdump is not supposed to
> be a general use tool.  It's basically a debugging aid: a quick and
> dirty independent implementation of a dtb dump, for checking that dtc
> is producing sane output.  The preferred way to dump dtbs "for real"
> is to use dtc -I dtb -O dts
>=20
> I think the way I'd prefer to see this functionality would be to add a
> new input format to dtc which is a little wrapper around the dtb input
> format which does the scan.

that seems reasonable, but really my use case was: scan a big blob, find th=
e=20
dtb embedded in there, then both decode and dump the offsets.  this was so =
i=20
could easily hack said big blob with a hexeditor and tweak a few keys.

adding a new input format would satisfy the first part (locating the dtb), =
and=20
the fact that dtc already supports "-O dtb" is good as it'd allow me to run=
 it=20
through fdtdump after the fact.  i can probably even chain them in a pipeli=
ne.

i'd still want the --debug option in fdtdump, but it sounds like that would=
n't=20
be against your desired goal for this utility ?

if that sounds good to you, i can rework things so that dtc gets a new "sca=
n"=20
input format (guessing i don't need to name it "scan-dtb").  then we both=20
should be happy.

on a related note, is there a reason these tools malloc & read in the whole=
=20
file into memory instead of just doing mmap() when possible ?
=2Dmike

--nextPart3010116.3bgGIvlaMV
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRZzzFAAoJEEFjO5/oN/WBo5cP/0gFOHAsbXf/i+kC5aK9iD7U
GorkkyMqWxsTVgGIm6AcIqbzZYpvJfz9WF+SbGP1nmA5nQxz4uywSBDORCDSuFC6
eQL0WmYAhQZskrQDepDQpasbFYLumznroTQl+hBAda7Ww8WcRvIosk7WfRKTjkDS
wikoz4Pgjj0mOiv0d7rcXtLl1LdC1KRb5k709jX1yOBxjbCW/BB7lu7OWnJnYvWE
9ieqlPHna7NyqFBAlJ2OcDiDJXqi0Ra4tEaS70tHtc+tF45XFE5UOb/9FcGN1MpV
dpW5xx08JwVpsET+MPJEpVuvoklAJNhiMoSLibAzBlHeSZ1XnDR4zvKZB2Tq0at4
kJVv837fCa8SRFEkjza1SVXv5AcUdoZaPSaTrOQiFA8bdKYGjZ+C8y1Wn1Xgx8bS
mAP0oAigtlDGHTtuGOmWx7pNPsxNV2hhDjtjVLNNs2JHGn7qLmdYin9iJ2i/B7fT
Ah/xmv6olV5m08+aCmAFk4Qe9SJnuOhHmf4Ewl9y1q6aLzBiXwTpfFJUtmryhkWN
7m4WJGNyZFZ5E8yUk/KYFQopbmIN3hoTlrhMXjqY97nqRqjmrGGMG+66f7WKo31w
800VDMSGYiobJszz+CpaeUBJu+11U2uEBF+y1XAV3Yq87/kPRGeBAjgiXN0Dn08r
yzyrR4QNzS9HkgvS9kzG
=4iaX
-----END PGP SIGNATURE-----

--nextPart3010116.3bgGIvlaMV--

--===============7031806435206454006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7031806435206454006==--
