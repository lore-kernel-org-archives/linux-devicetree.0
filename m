From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 2/3] drm/bridge: Add ti-ftp410 HDMI transmitter driver
Date: Thu, 10 Nov 2016 14:16:44 +0200
Message-ID: <cdc69812-84d0-39e4-1b4e-fef42c5b9059@ti.com>
References: <cover.1478103726.git.jsarha@ti.com>
 <9b6a6a4405de344cb9fbea735fea37adee1d726e.1478103726.git.jsarha@ti.com>
 <12424154.kJqhEf2pOz@avalon> <ad052b0f-0ece-4241-3e06-87905a9cf2c7@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0841965486=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <ad052b0f-0ece-4241-3e06-87905a9cf2c7@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jyri Sarha <jsarha@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, bcousson@baylibre.com, khilman@baylibre.com, dri-devel@lists.freedesktop.org, bgolaszewski@baylibre.com
List-Id: devicetree@vger.kernel.org

--===============0841965486==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="ftVcTmF8l25BgexJ4Lv1oCuBTI40nmKHX"

--ftVcTmF8l25BgexJ4Lv1oCuBTI40nmKHX
Content-Type: multipart/mixed; boundary="LVAVNbtcosMeLR1NaP6sQHq2jomWgpMu4";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Jyri Sarha <jsarha@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 airlied@linux.ie, daniel@ffwll.ch, robdclark@gmail.com,
 bgolaszewski@baylibre.com, khilman@baylibre.com, bcousson@baylibre.com
Message-ID: <cdc69812-84d0-39e4-1b4e-fef42c5b9059@ti.com>
Subject: Re: [PATCH 2/3] drm/bridge: Add ti-ftp410 HDMI transmitter driver
References: <cover.1478103726.git.jsarha@ti.com>
 <9b6a6a4405de344cb9fbea735fea37adee1d726e.1478103726.git.jsarha@ti.com>
 <12424154.kJqhEf2pOz@avalon> <ad052b0f-0ece-4241-3e06-87905a9cf2c7@ti.com>
In-Reply-To: <ad052b0f-0ece-4241-3e06-87905a9cf2c7@ti.com>

--LVAVNbtcosMeLR1NaP6sQHq2jomWgpMu4
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/11/16 11:16, Jyri Sarha wrote:
> On 11/03/16 19:46, Laurent Pinchart wrote:
>> Hi Jyri,
>>
>> Thank you for the patch.
>>
>> On Wednesday 02 Nov 2016 18:32:16 Jyri Sarha wrote:
>>> Add very basic ti-ftp410 HDMI transmitter driver. The only feature
>>> separating this from a completely dummy bridge is the DDC i2c
>>> support. However, other HW specific features may be added later when
>>> needed. For instance there is a set of registers behind i2c if it is
>>> connected. The implementations is tested against my new tilcdc bridge=

>>> support and works with BeagleBone DVI-D Cape Rev A3. A DT binding
>>> document is also added.
>>>
>>> Signed-off-by: Jyri Sarha <jsarha@ti.com>
>>> ---
>>>  .../bindings/display/bridge/ti,tfp410.txt          |  30 ++++
>>>  drivers/gpu/drm/bridge/Kconfig                     |   7 +
>>>  drivers/gpu/drm/bridge/Makefile                    |   1 +
>>>  drivers/gpu/drm/bridge/ti-tfp410.c                 | 199 +++++++++++=
+++++++
>>>  4 files changed, 237 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt create=
 mode
>>> 100644 drivers/gpu/drm/bridge/ti-tfp410.c
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tfp4=
10.txt
>>> b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt new =
file
>>> mode 100644
>>> index 0000000..dc93713
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt
>>> @@ -0,0 +1,30 @@
>>> +TFP410 HDMI/DVI bridge bindings
>>
>> I'd name the document "TI TFP410 DVI Transmitter". DVI bridge doesn't =
tell=20
>> whether the device is a receiver or transmitter.
>>
>>> +Required properties:
>>> +	- compatible: "ti,tfp410"
>>
>> The device is an I2C slave, it should have a reg property. Given that =
the chip=20
>> can be used without being controlled through I2C, the reg property sho=
uld be=20
>> optional. You should document this clearly, and explain how the DT nod=
e can be=20
>> instantiated as a child of an I2C controller when the I2C interface is=
 used,=20
>> or in other parts of the device tree otherwise.
>>
>>> +Optional properties:
>>> +	- ddc-i2c: phandle of an I2C controller used for DDC EDID probing
>>
>> The TFP410 doesn't handle DDC, this property should be part of the con=
nector=20
>> node.
>>
>>> +Optional subnodes:
>>> +	- video input: this subnode can contain a video input port node
>>> +	  to connect the bridge to a display controller output (See this
>>> +	  documentation [1]).
>>
>> You also need an output port for the DVI output. Those two ports shoul=
d be=20
>> required, not optional.
>>
>=20
> Ok. So I need another device node. Should I create some specific
> compatible string for connectors behind tfp410, or a generic DVI/HDMI
> connector with optional ddc-i2c phandle?

omapdrm uses connector nodes. See, for example, pandaboard's dts files.
It has TFP410 and a connector node. With omap specific drivers, for now,
but that's another matter.

 Tomi


--LVAVNbtcosMeLR1NaP6sQHq2jomWgpMu4--

--ftVcTmF8l25BgexJ4Lv1oCuBTI40nmKHX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYJGUsAAoJEPo9qoy8lh71dmMP/2vD5NGtt9FZjU955Ao2I80c
oajUXww7K3JMnX1NVbySLCuMUwDGyBZF6HlLQ2iiXdZCNfnbzPoNrxYBjAYzjfqK
We9MIC1RkiO80lREBbIA2oFtVQthIySv1SKIpjmIEBYPdMUp8d1621kkg01atnAa
mJ0cCESg0e7YO/oqUsdxgJfF4/wapAn3hih2F61CVnZW7+fDGZEEZJ5tta301uwQ
bzaJqvuvAYiacq93N+tgU5MWq9cbG8KAFY13R2zm+8aM6KBJRNhAZhDwtIBkqxsk
x5C8k6vuoGj5uSdlPSgnocilxCYCkM/7vF9slMsVgD5dDo+wdzatStH+EWvM2z/p
TWxjGmxndy0+Q9Xn+no9YQwCAcVMytXlVDhYRUKVabBcKsVLkpafSzTs8nlPScZa
dSb6dcs33dOPDkgXqmky6MJOI+h/i49mw1knJUtYlFnkJ5H0Y5jvA1R8Vx+qas0n
MapGCrAB4G8eZQ4bKYlznGzRj5lc4gw2lMzF5oFzNsW7MAcQxDL68rkjJQowLMbU
LTN3Q4QpxN1dzO9AbPgcxOrf3t7/FzXoki3sRpbkg1xker9sca4xDLCtlNNcVQ0W
hpgvmzpD0xFmh/7itus188U6IXo8a/UlpdbtnYJmqAdJEDK/AebJAuF0dtz346aY
I4zDJb1t6DB25L7PPRaG
=g50h
-----END PGP SIGNATURE-----

--ftVcTmF8l25BgexJ4Lv1oCuBTI40nmKHX--

--===============0841965486==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0841965486==--
