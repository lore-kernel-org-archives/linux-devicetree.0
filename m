From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 2/3] drm/bridge: Add ti-ftp410 HDMI transmitter driver
Date: Mon, 14 Nov 2016 13:16:49 +0200
Message-ID: <ac8e0f72-fac2-45e5-0004-d6028ddeb221@ti.com>
References: <cover.1478103726.git.jsarha@ti.com> <12424154.kJqhEf2pOz@avalon>
 <d035c76e-ca7f-0503-87da-7e93783d1cd0@ti.com>
 <1740464.TP0bE1PYbC@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2066562112=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1740464.TP0bE1PYbC@avalon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jyri Sarha <jsarha@ti.com>
Cc: devicetree@vger.kernel.org, bcousson@baylibre.com, khilman@baylibre.com, dri-devel@lists.freedesktop.org, bgolaszewski@baylibre.com
List-Id: devicetree@vger.kernel.org

--===============2066562112==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="W4H0DS1P243r1e1cOrGIlnR56go3sHR1e"

--W4H0DS1P243r1e1cOrGIlnR56go3sHR1e
Content-Type: multipart/mixed; boundary="inABmvpK59qHnEiDpJ9VhN3ROgtTWAJpf";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jyri Sarha <jsarha@ti.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 airlied@linux.ie, daniel@ffwll.ch, robdclark@gmail.com,
 bgolaszewski@baylibre.com, khilman@baylibre.com, bcousson@baylibre.com
Message-ID: <ac8e0f72-fac2-45e5-0004-d6028ddeb221@ti.com>
Subject: Re: [PATCH 2/3] drm/bridge: Add ti-ftp410 HDMI transmitter driver
References: <cover.1478103726.git.jsarha@ti.com> <12424154.kJqhEf2pOz@avalon>
 <d035c76e-ca7f-0503-87da-7e93783d1cd0@ti.com> <1740464.TP0bE1PYbC@avalon>
In-Reply-To: <1740464.TP0bE1PYbC@avalon>

--inABmvpK59qHnEiDpJ9VhN3ROgtTWAJpf
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 14/11/16 13:10, Laurent Pinchart wrote:
> Hi Jyri,
>=20
> On Monday 14 Nov 2016 10:49:43 Jyri Sarha wrote:
>> On 11/03/16 19:46, Laurent Pinchart wrote:
>>>> +Required properties:
>>>>> +	- compatible: "ti,tfp410"
>>>
>>> The device is an I2C slave, it should have a reg property. Given that=
 the
>>> chip can be used without being controlled through I2C, the reg proper=
ty
>>> should be optional. You should document this clearly, and explain how=
 the
>>> DT node can be instantiated as a child of an I2C controller when the =
I2C
>>> interface is used, or in other parts of the device tree otherwise.
>>
>> Shouldn't I have two different compatible strings if want to make both=

>> platform driver probe and i2c client probe to work?
>=20
> I don't think so, it's still the same chip.
>=20
>> Or can it be done with single compatible string? Would you know of an
>> example of such a driver?
>=20
> You will need to register both a i2c_driver and a platform_driver in th=
e=20
> tfp410 driver. Both will advertise the same compatible string. As you'l=
l have=20
> two probe functions, it should be easy to handle the differences betwee=
n the=20

If you have the same compatible string, won't both probes trigger? If
so, how does, e.g., the platform driver know this is actually i2c case,
and bail out? And if both probes don't trigger, why not? How does the
device probing machinery know that this DT node is actually an i2c node,
not a platform device node?

 Tomi


--inABmvpK59qHnEiDpJ9VhN3ROgtTWAJpf--

--W4H0DS1P243r1e1cOrGIlnR56go3sHR1e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYKZ0hAAoJEPo9qoy8lh71wwIP/AopMQ8AR0mXr+VZ2kWo0AC7
TVT/PcLWy3+OTQuHgb9/VQYY1XWwB/3gThYX3THPIorJmBd6mCa4OHMdDrYyz/T6
E58vxhoDm5jNNzOPA4KiK2pLM4aZGsaGzUabCrFm7btmSVFd/Uo6QkKsFsulzbsZ
vNIArBmqti6cmNcvwBJjnAf9izDAspdeVIN2woZbesnlCabjUtcA4JurXsNEs3Zy
nitv3r70q7gBRZRyUlRG1S52OFAwNzQESUu3t5pYyghhngo0u0NUp8X0bBE5LCx/
0VpwS7PlbfNl9V+M2aJL9OKNMBw5wlfZygcvS0qZ7PUeb1i/48+bdYCgMrwVd7sf
n0JCbpX3ldUq+RRnZvPxbho6FAX3ViDWIkJoquGI/EsSP4z8KFkjVCtCRl17oN8I
125fXzesqX35K/fJrCcWCA9Z+xf2c7VuJ8DnjLKI269JBuH8al0HJQW9sa8CQHgQ
lbcDrRyhmSp6UpCuvrOz+Q3IETPXaY/2lPwMzZRTp2asFKhe01mlzdDZyhCutrqU
QCv/0oItxtIK/8JTt7iDTSOSunBNoVZUjSIuL+OntCMBEOe4McDkB9Sr5eGwsQts
EZafJ5RauPHeOvCUf5jsTvFFPh3XwLCzhcJndEulcVsNazhTElrzpIKM/Ih1XBdQ
KcSyaQzwpGTHqtM6/CW1
=wRoN
-----END PGP SIGNATURE-----

--W4H0DS1P243r1e1cOrGIlnR56go3sHR1e--

--===============2066562112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2066562112==--
