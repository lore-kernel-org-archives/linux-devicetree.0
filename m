From: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 3/6] Documentation: devicetree: dwc3: Add interrupt moderation
Date: Fri, 28 Oct 2016 13:09:08 +0300
Message-ID: <87shrgss3f.fsf@linux.intel.com>
References: <cover.1477424426.git.johnyoun@synopsys.com> <e7a864e5a2af12d5a8d97f2591065f4aa85f86cb.1477424426.git.johnyoun@synopsys.com> <87eg32t6fn.fsf@linux.intel.com> <911fcadd-b852-d9db-c733-2df7c106c8d1@synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <911fcadd-b852-d9db-c733-2df7c106c8d1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:
> On 10/27/2016 3:47 AM, Felipe Balbi wrote:
>>=20
>> Hi,
>>=20
>> John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:
>>> Add interrupt moderation interval binding for dwc3.
>>>
>>> Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>>> ---
>>>  Documentation/devicetree/bindings/usb/dwc3.txt | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documenta=
tion/devicetree/bindings/usb/dwc3.txt
>>> index e3e6983..17de9fc 100644
>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>>> @@ -53,6 +53,7 @@ Optional properties:
>>>   - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of=
 GFLADJ
>>>  	register for post-silicon frame length adjustment when the
>>>  	fladj_30mhz_sdbnd signal is invalid or incorrect.
>>> + - snps,imod_interval: the interrupt moderation interval.
>>=20
>> on top of all other comments, what's the unit here? nanoseconds? clock c=
ycles?
>>=20
>
> Number of 250 ns intervals. I'll update the description to clarify.

it's probably better to add it in nanoseconds itself, then let driver
compute register value with DIV_ROUND_UP()

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYEyPEAAoJEMy+uJnhGpkGvoUQAIFpH3noFCzywIydc+UiY0K2
7V0WIw/uBO0/S7+N1hrG3VI6IG4/tiwMAPBShDlFfjir6QFei456G/OniOe4w2xo
FPGiD104M6UgpRJClXh123Q3ofuGFgFELjbrMnjVsKaoDN6E98MhR/Ew2nF7PtDA
WefICrdVm+zs4uqY1dpWmXBGdu29THVPf9SqeAsaO/8n2zpPbTU309OhA52/ksHb
4RJFoZy7ihpSljJl9MHwUwaj9MbFGpSqrUvHRCDRN+ebIM8sovJp8eSkC3V3z03f
n9sfGFek/OSYJv1H8ls6MYqYv3PuquV2i97Tnc/y+r0jT2AuI3ptcneUhjVW90rj
lP3/fKG2Ojn7ue9BUFAwSGmCkF26tvFT1dYvJ9KdwNkBmsF/8jH5Q4rVwcxy4D2U
udb2TgbXDvda3Kj1mkt1siuRX0m8XOFZfZsW8BwcgiSDkSzEziNR8Wg1U5F7aDnn
Gk5Pmem+cy+AdBF4AIeAQ2CGmRAI0lAWSj1sWlNsPJoLw8nRaJAzW0N2N/dYE/bT
E9xH39dG6ZpE2E/V17fhvtqT4Ublk6wIRsvPM0rN0WHrsqUACklL0YxPQbmsICDT
dimOmBGxo3jU+xjtKlRybDY19q75s15/eqgTIyHftDvJnhve5u3qeLsK89R0MwVC
kVr102lmB4pU7LOqWi/h
=Eqqb
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
