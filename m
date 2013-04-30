From: David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2] fdtput: expand fdt if value does not fit (v2).
Date: Tue, 30 Apr 2013 17:56:22 +1000
Message-ID: <20130430075622.GE20202@truffula.fritz.box>
References: <1366360596-18968-1-git-send-email-srinivas.kandagatla@st.com>
 <20130429090835.GH20202@truffula.fritz.box>
 <517F696C.3000603@st.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6161189728869880538=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <517F696C.3000603-qxv4g6HH51o@public.gmane.org>
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
To: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--===============6161189728869880538==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ijywFOGgtBfiIjQx"
Content-Disposition: inline

--ijywFOGgtBfiIjQx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2013 at 07:49:16AM +0100, Srinivas KANDAGATLA wrote:
> On 29/04/13 10:08, David Gibson wrote:
> > On Fri, Apr 19, 2013 at 09:36:36AM +0100, Srinivas KANDAGATLA wrote:
> >> From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
[snip]
> >
> >> +		delta =3D sizeof(struct fdt_node_header) +
> >> +				ALIGN(newlen + 1) + FDT_TAGSIZE;
> > struct fdt_node_header already includes the FDT_BEGIN_NODE tag, so
> > you've allocated space for the tag twice.
> Here am allocating space for FDT_BEGIN_NODE + node name in off_struct +
> FDT_END_NODE.
> So am not allocating space for the tag twice.
> Am I missing something?

Oh, yes, sorry.  Maybe put /* FDT_END_NODE */ next to the extra
FDT_TAGSIZE to stop someone else missing this the way I did.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ijywFOGgtBfiIjQx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlF/eSYACgkQaILKxv3ab8bJMQCfdwUCO0RL0KnYjsmg7Fb+B3ol
XhYAn1RnfocTgUt4ZsQghKpgZxwEenJD
=HzR3
-----END PGP SIGNATURE-----

--ijywFOGgtBfiIjQx--


--===============6161189728869880538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6161189728869880538==--
