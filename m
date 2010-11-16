From: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Subject: Re: [PATCH 1/7] OF: make drivers depend on CONFIG_OF instead of
	CONFIG_PPC_OF
Date: Wed, 17 Nov 2010 10:59:45 +1100
Message-ID: <20101117105945.64b3b656.sfr@canb.auug.org.au>
References: <1289939635-30742-1-git-send-email-robherring2@gmail.com>
	<1289939635-30742-2-git-send-email-robherring2@gmail.com>
	<20101116204058.GA5016@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6036175506860699955=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101116204058.GA5016-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============6036175506860699955==
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__17_Nov_2010_10_59_45_+1100_EeOF3BvhwMwPn9ke"

--Signature=_Wed__17_Nov_2010_10_59_45_+1100_EeOF3BvhwMwPn9ke
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mitch,

On Tue, 16 Nov 2010 13:40:58 -0700 Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>=
 wrote:
>
> On Tue, Nov 16, 2010 at 02:33:49PM -0600, Rob Herring wrote:
> > From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> >=20
> > Some OF drivers could likely be used on non-powerpc OF based platforms,
> > so fix the kconfig depends to be CONFIG_OF instead of CONFIG_PPC_OF
> >=20
> > Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>=20
> Which of these drivers are you actually using, or going to use in the
> near future?

And have you made sure that you haven't broken the allmodconfig builds on
other architectures that enable CONFIG_OF?

--=20
Cheers,
Stephen Rothwell                    sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__17_Nov_2010_10_59_45_+1100_EeOF3BvhwMwPn9ke
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJM4xrxAAoJEDMEi1NhKgbsvTIIAJ6FDCg5WmthKhdBH4lJjJK2
UDESR0omQ3gNf8MIrRTQW2aA+zuTWoYQvLv6jpj4E6yK1jcvKIuImiBH14pPTgQM
hbCGxCqSZJs3UDpq3XglP0eov03Bju6snOsvgmrVRczp2N6M2eNo9Fl0E9Ymj1XI
hh0jq9c05FRA2xdoarAIpeBL6NVMWcTzClB5T2YxRXmTKx9BAAkX3fGq4RmsdKyE
/d5Vg6ivzfs5eYGHcy6Knq2+PWlgNN7sjL9h4GHpp6jxe8koHZi+QtiOEXGe311P
hbwzI7rsZESFa9KncWInNg+czBe45mlHXc0lLEI6mLXNfndQ8hZtDy+yJ2NkHms=
=LlDK
-----END PGP SIGNATURE-----

--Signature=_Wed__17_Nov_2010_10_59_45_+1100_EeOF3BvhwMwPn9ke--

--===============6036175506860699955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6036175506860699955==--
