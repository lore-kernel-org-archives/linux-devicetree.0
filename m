From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2 07/11] Documentation: devicetree: Fix Xilinx VDMA specification
Date: Fri, 25 Jul 2014 10:46:59 +0200
Message-ID: <53D21983.8060901@suse.de>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de> <1406242820-20140-8-git-send-email-afaerber@suse.de> <53D20C19.5000306@monstr.eu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="feq67VvpRNvSenTcKrhaAtPSDUwdA1OCj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53D20C19.5000306-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>, Matteo Vit <matteo.vit-WGsyu9ztxDWovDFt+AQlJdBPR1lH4CV8@public.gmane.org>, Sean Rickerd <srickerd-IBi9RG/b67k@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srikanth T <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--feq67VvpRNvSenTcKrhaAtPSDUwdA1OCj
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Michal,

Am 25.07.2014 09:49, schrieb Michal Simek:
> On 07/25/2014 01:00 AM, Andreas F=C3=A4rber wrote:
>> The specification requires xlnx,data-width, but example and driver use=

>> xlnx,datawidth. Change the specification to match the implementation.
>>
>> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
>> ---
>>  v2: New
>> =20
>>  Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.=
txt b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
>> index 1405ed0..e4c4d47 100644
>> --- a/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
>> +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_vdma.txt
>> @@ -25,7 +25,7 @@ Required child node properties:
>>  - compatible: It should be either "xlnx,axi-vdma-mm2s-channel" or
>>  	"xlnx,axi-vdma-s2mm-channel".
>>  - interrupts: Should contain per channel VDMA interrupts.
>> -- xlnx,data-width: Should contain the stream data width, take values
>> +- xlnx,datawidth: Should contain the stream data width, take values
>>  	{32,64...1024}.

BTW I just notice that this values specification is ambiguous as to
whether 96 is a valid value or only powers of 2 like 128. Maybe you want
to clarify that in a follow-up patch?

Cheers,
Andreas

>> =20
>>  Optional child node properties:
>>
>=20
> Can you please take this patch through your tree?
>=20
> Reviewed-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
>=20
> Thanks,
> Michal

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg


--feq67VvpRNvSenTcKrhaAtPSDUwdA1OCj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJT0hmDAAoJEPou0S0+fgE/bl8QAJDptLkGwPNIxUuVhQNtCEAN
a6jgzZ8AMqBrYHTaqtWzvE+qs3N/IofSBYWRGcHFiT3xZVDXqyEIO1+Z26pV3BtL
PQiJNAubMuouP0HpmzQomlG4RGUcu09784092hdC9UVBmWdPcvCIYb04wpeco9R1
SKAUR8Ub1MKE9o0kv8rkcUE1Se3SNI/eyR0zS479cyDsHXPpmfFkVu3awexETTrV
Ebm3wfLMXHofbTp2+batTyVnz2VgNZb3prjjfBer2uKVN12S8o1azLjRLx4s/OYh
1MwyDsEaCvoLEVn/uS20oY0mqcKdgUyAgNnFmjPZNkELJQStsYmrM3/QJh4cWdmY
hLCxRSAl28jE4J/gwjWMwx0pKCAHN36NAW8lpSakLr7XOSfRW3XWOKr45JlBmz8n
ZpuqPTEbDAtMR7Uv0tgHFWcYOLED5yBbSJjrTmxwdXg+WZ0rFfnMHd7Eo+LqTL0R
qvfwZWzWNtPr1WenTVS1ZnNajM+HgqhRr+KZy8ZrPApf8Odqh/VXXecm+EUKcmM5
yiKVwf8phdarBqbeh2/lmnd58a51aj030dseMinJ3o5xaRDipQZ9mGztKcvcL9Es
H3/p5ZuGgNFKCCnPZBduNJz+5rwn375S/Fw78oNgxGIC54Gl16mcdemM1JywTj7f
iCQtGiboG3hXcHaDQDN1
=Iz7W
-----END PGP SIGNATURE-----

--feq67VvpRNvSenTcKrhaAtPSDUwdA1OCj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
