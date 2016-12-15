From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 00/26] drm/omap: Convert to use videomode from
 omap_video_timings
Date: Thu, 15 Dec 2016 09:56:28 +0200
Message-ID: <69c8e84f-d615-c0a7-a089-aadc42ba6fd9@ti.com>
References: <20160901112320.15246-1-peter.ujfalusi@ti.com>
 <3115831.KSyLVyBdAU@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0998696433=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <3115831.KSyLVyBdAU@avalon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>
List-Id: devicetree@vger.kernel.org

--===============0998696433==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="5VvmAbKJp2Ig75mqxOOkDJ8bxwJ8bRsK0"

--5VvmAbKJp2Ig75mqxOOkDJ8bxwJ8bRsK0
Content-Type: multipart/mixed; boundary="L9soOHTVTXs0wmPABiQBVNoOipD1qvVwB";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, thierry.reding@gmail.com,
 airlied@linux.ie, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Message-ID: <69c8e84f-d615-c0a7-a089-aadc42ba6fd9@ti.com>
Subject: Re: [PATCH 00/26] drm/omap: Convert to use videomode from
 omap_video_timings
References: <20160901112320.15246-1-peter.ujfalusi@ti.com>
 <3115831.KSyLVyBdAU@avalon>
In-Reply-To: <3115831.KSyLVyBdAU@avalon>

--L9soOHTVTXs0wmPABiQBVNoOipD1qvVwB
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 14/12/16 23:32, Laurent Pinchart wrote:
> Hi Peter,
>=20
> On Thursday 01 Sep 2016 14:22:54 Peter Ujfalusi wrote:
>> Hi,
>>
>> The following series will convert the omapdrm stack to use the generic=

>> videmode instead of the private omap_video_timings struct for the pane=
l
>> information.
>>
>> Since we have several panels under omapdrm/displays/ where the data dr=
ive
>> edge is set to be different then the sync drive edge, the first three =
patch
>> will add support to select the sync drive edge via DT.
>> I was not able to locate the datasheet for all the panels and because =
the
>> different edge was used in omapdrm and omapfb for a long time without
>> complains from users - and they were written this way - I think it is =
a
>> valid that we can have panels requiring different edge for data and sy=
nc to
>> be driven.
>=20
> That's very peculiar. Have you been able to locate at least one panel=20
> datasheet that documents this requirement ?

I think I remember seeing some panel or encoder asking for different
edges. But it's rather vague memory =3D).

Interestingly, the default behavior of OMAP DSS is to have data and sync
at different edges. I don't know what was the rationale for that design.

Another, slightly related, interesting thing is that only from OMAP4
forward we have had the possibility to have hsync and vsync happen at
the same time. Earlier hsync came first, followed by vsync. This old
behavior caused problems at least on one encoder I worked on.

 Tomi


--L9soOHTVTXs0wmPABiQBVNoOipD1qvVwB--

--5VvmAbKJp2Ig75mqxOOkDJ8bxwJ8bRsK0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYUkywAAoJEPo9qoy8lh71tisP/iwIezkXFhIY3jKKR+XQens+
hV30ineOrS71LUGA/VLTV52pYOBwUEW3YGtIOEwOWR+UxH1baWFdmVuamX/llWQ0
aFR8CGckgoutOYKkEbv4Dbo0pLNKbpkSvvneUYAA3OY7tmR0ovE8mpYKXivHCiA0
iytIzF+Bj3hgNNd5Rn+sEtGiYumTptq/qxl4bZTG4KD2j4uumRA3r840QDHTmO0r
SD8nhamem6c4wnAeWNaY918SDNFGv/1y2D0A/PUmYnFI9WTgoQS8ERwmN3+32B/t
F2p8/qa+AqanAOe9hEALP79g5xl9OjQBJNhZGEXlSdPv5jILF+2yhmTSSP+aBcWI
TdTRY8rYNFCVgbaK5XxBEsyvbjqPs8nLdZCFhQIxTHXlIZofyjaQJaImh2oMKg1u
mXoc2gSHkmhiY8BXMTImfzhs0JVdmWCdFTXDfQW/sUvG9q2V2YVPZftNhf7wOb90
se4IBYlZP/RhtFUlz6l+UjPZB7qL63ZsOARqhN8i0eJM88VuinudHBlUbu1Foj7Y
wJDA9YZYSEE82mUzrTFWK365xAaNAU0XT70kba2qS6JDi/L8fycYrH4AXp3bYmw2
Hzu7XmwD9FhhJK8bFYQPIp8a8BaMzuP39B60eoHE+e1OasaBNimXdUZAXIncdxQ+
W5GeFqj3uUo01HdIX5SJ
=YO9v
-----END PGP SIGNATURE-----

--5VvmAbKJp2Ig75mqxOOkDJ8bxwJ8bRsK0--

--===============0998696433==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0998696433==--
