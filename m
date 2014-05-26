From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator: fixed: use of_property_read_{bool|u32}()
Date: Mon, 26 May 2014 19:12:44 +0100
Message-ID: <20140526181244.GH12304@sirena.org.uk>
References: <201405252350.40402.sergei.shtylyov@cogentembedded.com>
 <20140526151958.GU22111@sirena.org.uk>
 <53837AEE.7030400@cogentembedded.com>
 <20140526175648.GG12304@sirena.org.uk>
 <53838184.9070401@cogentembedded.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+1onGCx5z9/q54Bk"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53838184.9070401-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--+1onGCx5z9/q54Bk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 26, 2014 at 10:01:40PM +0400, Sergei Shtylyov wrote:
> On 05/26/2014 09:56 PM, Mark Brown wrote:

> >By avoiding CCing lkml you avoided CCing the list where regulator
> >patches are discussed.  When using get_maintainers.pl you need to think
> >about what it's telling you.

>    The problem with LKML is that it's always suggested, even for the very
> minor patches that should not be of interest to the wide public. I'll keep
> in mind that the regulator patches are discussed on LKML.

This is why you need to think about what get_maintainer.pl is telling
you - it'll give you some suggestions, you need to understand why they
are there and do something sensible with them.  For example if there's
no subsystem specific list then you need to include lkml.

--+1onGCx5z9/q54Bk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIbBAEBAgAGBQJTg4QYAAoJELSic+t+oim9oLkP+N67lPDPTF4kuDTrrDZezKLV
MaCK2b74nKw66DW/OxWI43awoCyafwayvS9njFaqkIXhFfRmgyxSaG4WTqVucsIC
ETaY3N7BRBVz5AQuJGW2Q6mw02bDMP78l99VJEJjWjGXZS2hPBFg0TzUZaFmeOn1
rdrM3xhKketZcVFM3uoblq6kJmD98nwAaGmK3ma1h/kHIy1ZOqdibDqgOFymX22q
1ZgDpfQzc1wjpsTDRBHuDuFn/O3JOyF2I/7ZiC4A0x/kigI53uPamGxRUY8PDt3E
Wt71gc8ATk9tG8cVA7QIeBX04LofVXXD9ZoY9qKNYXcq3C88Qe6eejFbMos4BusI
pit07wN2fdz77KAwUipz/pePKZ5gDlrnx0Ap4AF0bMDH+PVBeM10+YnvQJd/TNeu
8ucivfO/jEG1AtvudAHAExKSg1GfYNE459IPuWRwqN/veoKGu9jb8J+rGQsiHoX5
gVX5ErYEwaFV8Hs8F+f/VqVqN228G6U8HrKivgaAUdJArrr1cn5MloiuMfFemewH
ZFrl5ZYtYZH2lPbbQ57bFTGUCAq/ux6ovy0MU10sae9DuJYPh/sRUwENoupLHYjA
0EsaOvsm0AfM8+2TzuyPnGYKTa/p3N03/8JR+6jCk909LVh6S/UQPmrjun8g9dv7
KDoJmh7KhGga51F6mbU=
=T7Uo
-----END PGP SIGNATURE-----

--+1onGCx5z9/q54Bk--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
