From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2] gpio: Add Avionic Design N-bit GPIO expander support
Date: Thu, 2 Aug 2012 08:18:37 +0200
Message-ID: <20120802061837.GF12241@avionic-0098.adnet.avionic-design.de>
References: <1343044770-6591-1-git-send-email-thierry.reding@avionic-design.de>
 <CACRpkdaZcUvcJMUZTqCEU5FQYhE3EvSSfUEnEx0dYRt-6x5Nig@mail.gmail.com>
 <20120730074714.GC15245@avionic-0098.mockup.avionic-design.de>
 <50185619.5090706@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1152887860372548181=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50185619.5090706-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--===============1152887860372548181==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UBnjLfzoMQYIXCvq"
Content-Disposition: inline


--UBnjLfzoMQYIXCvq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 31, 2012 at 05:03:05PM -0500, Rob Herring wrote:
> For nr-gpios, I think it is typically not needed. Generally, you will
> know how many gpio lines the h/w has based on the compatible string. If
> this part really is the same part but different packages with different
> numbers of gpio, then this property makes sense.

That's exactly what I need it for. The controller is synthesized in a
CPLD, so technically the part is always the same, but the configured
logic can implement any number of GPIOs.

Thierry

--UBnjLfzoMQYIXCvq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQGhu9AAoJEN0jrNd/PrOh0LQP/2JbP2YRXQEUzZh4YO05baQv
Qx1X+4/cORFs4jYYPvu4YBtonZST9fvQpWNAP+aMMb38hBXnAlOCreejlNrmq3/U
a+d6aCtWkqkbtpbvwLJLwRUAUuRHw21zXlGCRGbjhWHzunl3eHcCSRaMSZs46EkM
GlBQKWOf6YeDNne7KqUMqqI0G+7bFVZVW29SZqkiVaSFIPH6dIGUZwDR/uXLp34n
wNV3aere2Dqvffj7xQ6S9j/8Sw1W0/H6MokDkieK/lQMXJgV5Vhc/TTpiOohyCxR
L2aaogKRzLXG7wp/uvEmCK+VVw0W9rixj/Zv4wMiRXcoZBDbyimX49tEDYM6dkT9
Hb+bhKOTTaZcfcFhSThL4yUdtjaKerdxs99K5OPAL6/OzwmtlgKleCgBGXr/15gD
n5mjgRjePDyorJK/T+i5VuYjV6u+XPrOx7CweFMR4I8JrwEewOszND/Eb9uQ1H75
bphaG8G3sTUAe0O6ekClxSQiNL7UUxmAjQ3tKjPZXI5e6+CqBKRKd0ajysNNdBvZ
mUO5Fkkr6FHQuxOaB3gDLke9GZoEsJAOmanAhfV0/lO5M9Svw+q9UvprZbPsnTle
5N5DZTVJgXri5E5A1xEHtxT1btNQpREIWEEJuYrA5AcjWcWwNdMdI2nh/WKVfQZk
tg1bcGBby6Xao7Oteh8k
=5LWR
-----END PGP SIGNATURE-----

--UBnjLfzoMQYIXCvq--

--===============1152887860372548181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1152887860372548181==--
