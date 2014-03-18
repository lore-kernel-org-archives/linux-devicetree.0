From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 5/9] Doc/DT: Add DT binding documentation for MIPI DPI
 Panel
Date: Tue, 18 Mar 2014 09:06:16 +0200
Message-ID: <5327F068.7010100@ti.com>
References: <1393590016-9361-1-git-send-email-tomi.valkeinen@ti.com>
 <1393590016-9361-6-git-send-email-tomi.valkeinen@ti.com>
 <3721050.m43feCICLQ@avalon> <5327EAB3.8080405@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8232105112622697795=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5327EAB3.8080405@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, Tomasz Figa <tomasz.figa@gmail.com>, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Rob Clark <robdclark@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

--===============8232105112622697795==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="e2lmthRX2peGv5gJFecsMSCJFNR8KJ98E"

--e2lmthRX2peGv5gJFecsMSCJFNR8KJ98E
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 18/03/14 08:41, Tomi Valkeinen wrote:
> On 17/03/14 16:19, Laurent Pinchart wrote:
>=20
>>> +Generic MIPI DPI Panel
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +Required properties:
>>> +- compatible: "panel-dpi"
>>> +
>>> +Optional properties:
>>> +- label: a symbolic name for the panel
>>> +- gpios: panel enable gpio and backlight enable gpio
>>
>> While integrated in the panel module, the backlight is a separate piec=
e of=20
>> hardware, which could be controlled through other means (I2C for insta=
nce).=20
>> Wouldn't it be better to add an explicit DT node for the backlight dev=
ice and=20
>> reference that node from the panel node ?
>=20
> Yes, I agree, but do we have the infrastructure or bindings for that?
>=20
> Ah, I see we now do have a gpio-backlight driver, but it doesn't have D=
T
> bindings.

Seems there's a patch from Denis Carikli for this, which will probably
be merged for 3.15.

I realized I don't actually use panel-dpi at the moment in my OMAP DSS
DT series, as I dropped the board changes that used panel-dpi. So I'll
drop panel-dpi bindings from my series, and the backlight for panel-dpi
can then be fixed for 3.16.

 Tomi



--e2lmthRX2peGv5gJFecsMSCJFNR8KJ98E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTJ/BoAAoJEPo9qoy8lh71lHMQAKpLuDMvq0XbZ5igX2V+DnJ7
rrUOBNbRBIhnxFvUuxzd27fVBgDMA4wW8cwowygosjegCrS/Yc8xLeQINhxcAI+e
4tjRsUUNFf3ZbyDxLMX7wcyAig+R0AV8SDKQa/eanuRKa5i7MzOIVONz4tOvKlsQ
jCz9GgSR88h5XILiu5DoLXsli+x8XwhwJ545w31YKF2OYIKV5bghCnTb8L5iJpOG
h4NLc1HwUx8uIzoK8vqIjdOlkgm5skZlwlp/EMseSfo0gtmAf9exQ3ITN1M5LVDw
puxDAiav2EN3513GPch9fSzpc6hwruvVM6ULnu6pp9vrvGywQoZ3AQC7sOp/BwlU
PYSIofGgFWLoJ0q+LoXzquCDe13OFsbTy7KJS9wgL6kpnT41AQG5BB/IGGl9ElPu
rJzJ89P7nk/QoA+7JhqtWSDrJyUsU+lKrxrU+9HsGwSRxZWCNBDlEJJXS778WCdm
qbjxARIsckUAqfFUgqSHey0XelrLnyoiaULvhFeFn7NuNshI+GWxQpg5Lycqy0Pt
IkC2XjA3C93fPm7L8lLqTlpqQKMP9zFY0/X0BEJdBpfYEl0HN87IpdaHPupRPqmW
XUXgkUoy8b54NRR1TK77psv71DvN0r+kbDcmjaT+++EGbajD0YpitNP2rhs9NC56
cz1tKqVtDQFu2rAG8jOh
=h/3y
-----END PGP SIGNATURE-----

--e2lmthRX2peGv5gJFecsMSCJFNR8KJ98E--


--===============8232105112622697795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8232105112622697795==--
