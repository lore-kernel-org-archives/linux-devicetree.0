From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5] mfd: arizona: Add device tree bindings for MICBIAS
 generators
Date: Mon, 23 Sep 2013 23:27:44 +0100
Message-ID: <20130923222744.GK21013@sirena.org.uk>
References: <1379961043-23762-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1379961043-23762-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7dLEKQsGm0Z6zEmU"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1379961043-23762-5-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--7dLEKQsGm0Z6zEmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 23, 2013 at 07:30:43PM +0100, Charles Keepax wrote:

> +  - wlf,micbias1 : Configuration for the micbias regulator, should include 5
> +    cells.
> +    The first cell is the output voltage in millivolts
> +    The second cell a non-zero value indicates an external capacitor is fitted
> +    The third cell a non-zero value indicates the micbias should be actively
> +    discharged
> +    The four cell a non-zero value indicates that the micbias should be
> +    brought up slowly to reduce pops

I would suggest defining a subnode with boolean properties for these,
it's not massively legible to have this many random numbers.  Consider
using the regulator binding, microphone biases are after all regulators.

> +    The fifth cell a non-zero value indicates the micbias should be bypassed
> +    and simply output MICVDD

This is something that should be being varied at runtime in detection
scenarios, the meaning ought to be being tightened up here.

--7dLEKQsGm0Z6zEmU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSQMBcAAoJELSic+t+oim99G0P/1AsCAN1FIKAjbeToHPzlZ5d
FsoRN/Mi+ESx8KOub/ffLJg8uoM7It3TwVHaY66b9wQ9dn4MtGA1zKNIfaafSZeN
aydOCPhuV39zmsskhXdAZjd+WbrqtVi4NcmjvtPnAPjEAptj3yyzFRzCi1jNK0KP
gnVadiirZuO5j/QkGYX8YO0xoo4j68cdCezyMHAwEP5Y8EU2Hrnf6LFLzcdV6gbP
caJtYe1lplzNWY7RWEZJK76F/Mqy1TYO9x6udSoDMV50G4QyWIJGmVQ7pOG0G+bT
Zg3fYK1/30SHBymPAsgpGdlMnU47H94rIY5ugvNgCNVvcxzYnpehcCF12vE/cDx8
JbSgb5eySZJq2zCgG5Y5QUqD/xOOl2cWafWi0rFVnadsgSLWcy/gSrTOWq1ESjji
fIRWudpRQp5IW0v1qsbwRviHC4FlqBv9jlYIx6mKZlcMZ5Soob+hMdmbiXffakP0
4azBMIqOvjaWnUn/AGZSYqhZAgLxcGWPiemiI5jITjwLgSGSNLc9Don4QsnPjIT9
xLOCb+rE2WH1OVeiDvJSk4ynxo/MFmkbhBtPx6WJ9FiKRPrW1/mcntYh4NIuMrmR
/taugeF5NnpKceaht6mkMFubq9/VfApXCZgrympCy/TT7ygDxKq5pLNPRQdbGDWS
CBuKu6AjwE5WmJ0h+yIk
=qxhc
-----END PGP SIGNATURE-----

--7dLEKQsGm0Z6zEmU--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
