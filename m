From: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5 v10] dt/bindings: Add binding for the DA8xx MUSB driver
Date: Tue, 15 Mar 2016 09:52:14 +0200
Message-ID: <87mvq09o0h.fsf@intel.com>
References: <1457684989-13318-1-git-send-email-petr@barix.com> <87fuvtbl26.fsf@intel.com> <56E76E5A.5060801@lechnology.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56E76E5A.5060801-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, b-liu-l0cyMroinI0@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org> writes:
> [ text/plain ]
> On 03/14/2016 02:00 AM, Felipe Balbi wrote:
>>
>> Hi,
>>
>> Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org> writes:
>>> + - ti,usb2-phy-refclock-hz : Integer. Frequency in Hz of the USB 2.0 P=
HY reference clock,
>>> +     either provided by the internal PLL or an external source.
>>> +     The supported values are: 12MHz, 13MHz, 19.2MHz, 20MHz, 24MHz, 26=
MHz, 38.4MHz, 40MHz, 48MHz.
>>
>> why isn't this an actual clock phandle ? Driver could, then, use
>> clk_get_rate() to figure this one out. You could just use a fixed clock
>> here to satisfy the clock API.
>>
>
>
> I've actually been working on getting the da8xx ohci driver working with=
=20
> device tree. It has similar clock issues (in fact, the ohci clock is a=20
> child of the musb clock). Petr, give me a day or two and will have post=20
> some patches. It will have a clock that can be used here for clk_get_rate=
().

sounds good, cool.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJW578vAAoJEIaOsuA1yqRENHIP/AkrNJPcwHhGjKH1USSBpO/3
IDQV5733ELRj3PWgMEO1UdoZ00k/g1LlQMjPdksEnYzuwMrVxhbcKZjuyrTgcM2W
b84zN08Y40yHQdj1SprthclpOU2Mv7yqVtGJcJ2CWj52nuaghVBDODoVIJOTG3nO
v9lHZ/SmC1awsYChA32wA8G7wERW0/NiEILdjBeOSZ6yL1IC9vZlS1PB3MemakpT
LevuNCo7yYsYwbXXd/tYrF9kYo332VeYnckZHXu+y+3TfyKwkOQ5xHU1ki3Hwgpx
rxSzlO4TxoCbi802ltiqKGuxh4pH5m9KOLSDWjgB6z1/rIfm0BZKO1bUjaa87jQ3
Z5cZvoLjpW5ApZDNljqNsxAslzbvNYY7BWOpAlaZCEbvCvfv/R/Sa3fOF4fweM/2
7FWXYHSzkSj52cPRmMB3uFyFvApIXa5uJMVbW963Sz0eQ+mc/SM7LodyACFHRIr3
fyqvlNmv2NjhdYDFoZejeo0zNQxC+dZt+IIcIMgu3NdVG6qKdo8xf1CATUqseLI3
qLmkbgyxBVs49TeXyJPNicuvmbGPtXsOKcJS/VvL09UB0fYTKkBCERZdyUR2avvI
WKlH3uvCSHAzJ/yT9q/XBnfrx0SEOMTuv0TqKXcemnfOTDishYO7+0MEAijiluQ2
eD0vXgCbJIoHhcwTonhT
=ryhn
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
