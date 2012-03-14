From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 2/7] of: add clock providers
Date: Wed, 14 Mar 2012 08:07:28 +0100
Message-ID: <20120314070728.GC2659@avionic-0098.mockup.avionic-design.de>
References: <1331680947-29861-1-git-send-email-robherring2@gmail.com>
 <1331680947-29861-3-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7251872851859870872=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1331680947-29861-3-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============7251872851859870872==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Content-Disposition: inline


--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Rob Herring wrote:
> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
[...]
> +clock-output-names: Recommended to be a list of strings of clock output signal
> +		    names indexed by the first cell in the clock specifier.
> +		    However, the meaning of clock-output-name is domain

"clock-output-names"?

> +		    specific to the clock provider, and is only provided to
> +		    encourage using the same meaning for the majority of clock
> +		    providers.  This format may not work for clock providers
> +		    using a complex clock specifier format.  In those cases it
> +		    is recommended to omit this property and create a binding
> +		    specific names property.
> +
> +		    Clock consumer nodes must never directly reference
> +		    the provider's clock-output-name property.

Ditto.

[...]
> diff --git a/Documentation/devicetree/bindings/clock/fixed-clock.txt b/Documentation/devicetree/bindings/clock/fixed-clock.txt
> new file mode 100644
> index 0000000..9a75342
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/fixed-clock.txt
> @@ -0,0 +1,21 @@
> +Binding for simple fixed-rate clock sources.
> +
> +This binding uses the common clock binding[1].
> +
> +[1] Documentation/devicetree/bindings/clock/fixed-clock.txt

This document references itself.

Thierry

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9gQ7AACgkQZ+BJyKLjJp8bUACeJBTnXhnd2KszWXZSjJO8GcE8
BHcAn15rlgTDFWmbD0TwZoRrEFt7567L
=PZ8n
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--

--===============7251872851859870872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7251872851859870872==--
