From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: [PATCH v2 1/2] MIPS: Add device tree support to MIPS
Date: Tue, 17 Aug 2010 13:40:39 +1000
Message-ID: <20100817134039.fc1108c7.sfr@canb.auug.org.au>
References: <AANLkTi=74zoQziQTmAGo-cNtF9FAT77h+KZagsNEFjEf@mail.gmail.com>
	<7A9214B0DEB2074FBCA688B30B04400D013FA46D@XMB-RCD-208.cisco.com>
	<20100816204211.GA17571@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2552970631445058662=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20100816204211.GA17571-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, "David VomLehn (dvomlehn)" <dvomlehn-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============2552970631445058662==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Aug_2010_13_40_39_+1000_loXQi+2twtQLFo7/"

--Signature=_Tue__17_Aug_2010_13_40_39_+1000_loXQi+2twtQLFo7/
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

On Mon, 16 Aug 2010 14:42:11 -0600 Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>=
 wrote:
>
> I'll also make sure to start build testing on MIPS.  Ralf, any suggestion=
s on defconfigs I should use?

Linux-next does defconfig, allnoconfig, allmodconfig (which has failed
for a long time) and ip32_defconfig for mips and mipsel.  I am not sure
if all these are still relevant.

(http://kisskb.ellerman.id.au/kisskb/branch/9/)
--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__17_Aug_2010_13_40_39_+1000_loXQi+2twtQLFo7/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMagS3AAoJEDMEi1NhKgbsNZsH/A5oh++2w0Bdc0dp0+XzlFXI
5grlYLJ5CKPuCxd1VQ2BBLopeuzUR9YzvdyMkILLTONReWu7KJiUoTnNiZC95V/Z
/THxQuHo6gpMxketzgRU+VjfOSe4oVq8Ttk7tzKygIh/2WXbTqbBqI1IHFvWD10+
56hCEiQHyow0n1ME03urhBwlB5Wq0pHFAvnGKQ/HUmcSlVEzjvkNyP+kM6U1xHry
NDUkXk5NEARTWL8VqOT3HR77rg/0bNISmSnIIu6tpDcU4uMz4CkZVG/vgf1Fp75Z
lbJBs/DVWqvmGFbaW54FcYUaiuNMs0yCqgrmRUh2M/pJTHtVHBtBp85m9g8emBE=
=pXMp
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Aug_2010_13_40_39_+1000_loXQi+2twtQLFo7/--

--===============2552970631445058662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2552970631445058662==--
