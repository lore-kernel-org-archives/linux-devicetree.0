From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] pci: Provide support for parsing PCI DT ranges property
Date: Thu, 20 Dec 2012 09:25:00 +0100
Message-ID: <20121220082500.GA32617@avionic-0098.adnet.avionic-design.de>
References: <20121212163749.GA17371@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5449620084133535103=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20121212163749.GA17371-5wv7dgnIgG8@public.gmane.org>
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
To: Andrew Murray <Andrew.Murray-5wv7dgnIgG8@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============5449620084133535103==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 12, 2012 at 04:37:50PM +0000, Andrew Murray wrote:
[...]
> diff --git a/drivers/of/address.c b/drivers/of/address.c
[...]
> +	start = of_get_property(node, "ranges", &rlen);
> +	if (start == NULL)
> +		return NULL;
> +
> +	end = start + rlen;

I'm currently rewriting large parts of the Tegra PCIe controller driver
and I'm trying to use this new API. This seems to work fine, except that
I think this line needs to be:

	end = start + rlen / sizeof(__be32);

Otherwise we'll try to process 4 times as many ranges as there are.

Thierry

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ0stcAAoJEN0jrNd/PrOhJ3wP/RTl+yPFBH6p5AxEnuzCbT+d
aB6m7CEG++kw9kkXUAnSw+jIWwRdgmLY5qdcXJaxUyMlx/1qTQESey0mFpSsu0g1
8u+6ITQ4+q/HzXbfCtRJpERZHxTTJwdY9EijpSTMEC4Whq4sG9m97uTBmfuKs1Gf
Ot1Hs4z3bUDNCLUje/QqON/emqW/ZqM+bcsHQRGe/O/2Py+0/xuWlRw3+WRE+QuS
w4uABEyWLLqjWjLqG+oT+xpwwE3SlDVbejH5i9FYEL7OjAsFTpx4h0Kjqr/S4eHD
8FMBGnX6IlrQOcrpYXlYGKDGd9k6EKIu36P2LxSOfa/JcqNuPacut4MlS7yEJ39z
Qd8xufL23KkuL+3dzAju9tCaeS7K4EUMWr2uF02PwFeVYsQtSAsVdZtHh9DlnfiG
ghAtxN/E90ZLNg7uEgM5pFA5eizZ6/yuEY2MPs4NqG9oe24ykR77ZIu4DwJC3p+R
0rtURMQKVadncw3beSIxRqU/67Ru+xF+J3wiJNL6g9CiSLcOKDAH+gVcPh9qk19/
0scfxkfTYOE81hG+O58Aw0Ikl6jkwVnCWKvtnAPgDOjRnI+41+7toHlTCsTi6XG1
hYB0deO3jviEgInQrdO4CUVPdORyvEACrEPgt4rIwVDzk7TZKkbSlHULRgy66yyj
xqMOHqFgoNTGbyK+s816
=SKrO
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--

--===============5449620084133535103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5449620084133535103==--
