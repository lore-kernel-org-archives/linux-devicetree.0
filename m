From: Jeremy Linton <jlinton-WMdfZNuR64nqlBn2x/YWAg@public.gmane.org>
Subject: Re: pSeries boot failure due to wrong interrupt controller
Date: Fri, 26 Jun 2015 17:35:52 -0500
Message-ID: <558DD3C8.6000800@tributary.com>
References: <CAEFTgiyHkf8ooYdWW0nTLcdraJ_L9FpLSVZa4KS3CcdpGWJxew@mail.gmail.com>	 <CAL_JsqJqkUL8XyqR6yjg+-thj4YOQ6cUohGHHid71tdRFft7vw@mail.gmail.com>	 <558D91C1.6030004@tributary.com> <1435355687.26815.8.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435355687.26815.8.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jeremy Linton <lintonrjeremy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


On 6/26/2015 4:54 PM, Benjamin Herrenschmidt wrote:
> Ah I missed that completely. From your discussion, it looks correct, I'll
> see if I can find a machine to test, however I think we dropped support for
> POWER3 so it might be non-trivial to do so.

	Thanks, the problem originally cropped up on a power4+, I was going to test
it on power5 too, but I don't have access anymore. I do have a power3 as well,
but I think that machine has other issues (the BUG_ON in the platform table
for starters).


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (MingW32)

iQEcBAEBAgAGBQJVjdPIAAoJEL5i86xrzcy7KA0H+QHVe3IFy12DlgxP0kbbaDtr
D5JLqh9OHBxZohotRzQz5errCIBYGxIYy93P6S2NvQSKS1gqZFFrvdyIs0f3UYo0
izzRVh/Gf10p0d3MJDI0EYC7OlxlP4hJ8lZKU2PNFQvhLT4eE1i/XJAySJLJsSpG
WD9CiP5Flixm/ECBPbyeg9nnc5c+EM4xPhE6J3Zp5pX7gU0cieJb2rzhz/7/TsI1
6AYMOPC4JpL3aK5z4eKuVgzvuJ/MyCjHdwii0TpNBhhhyidq8PEDoH3Y61CIOszq
Uu5HAQoToqBZdKM7siiZY0LJVQVpJaze4zhjexqhGa/Ll0iquj3V13xZ5qjj1eA=
=oeSx
-----END PGP SIGNATURE-----
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
