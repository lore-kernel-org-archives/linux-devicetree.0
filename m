From: Matthijs Kooijman <matthijs-gZv8Wpyq0Kk@public.gmane.org>
Subject: Re: [RFC] Does PHY UTMI data width belong to DWC2 or PHY binding?
Date: Tue, 22 Oct 2013 12:48:29 +0200
Message-ID: <20131022104829.GF15425@login.drsnuggles.stderr.nl>
References: <20131018141221.GH2721@beef>
 <5264F37E.9060307@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L2Brqb15TUChFOBK"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5264F37E.9060307-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--L2Brqb15TUChFOBK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kishon,

On Mon, Oct 21, 2013 at 02:57:26PM +0530, Kishon Vijay Abraham I wrote:
> I think it makes sense to keep the data width property in the dwc2 node itself.
> I mean it describes how the dwc2 IP is configured in that particular SoC (given
> that it can be either <8> or <16>).
If I'm reading the RT3052 datasheet correctly (GHWCFG4 register), the IP
can be configured for 8, 16 or 8 _and_ 16. In the latter case, the "8
and 16 supported" would make sense as a property of dwc2 (though this
value should be autodetectable through GHWCFG4), while the actual 8 or
16 supported by the PHY would make sense as property of a phy.

Note sure if this is really useful in practice as well, or if just
setting the actual width to use on dwc2 makes more sense...

Gr.

Matthijs

--L2Brqb15TUChFOBK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAlJmV/0ACgkQz0nQ5oovr7wK2wCgn3SiRjbqky+YLRJ/40XWcUpN
n+AAn0PGfchNovg/dACI0f/vrn8YK7KB
=jIvk
-----END PGP SIGNATURE-----

--L2Brqb15TUChFOBK--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
