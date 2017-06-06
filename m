From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: drm/bridge: Document Cadence DSI
 bridge bindings
Date: Tue, 6 Jun 2017 15:40:25 +0300
Message-ID: <902ba6cf-4125-fac6-62dd-6b6198f541f3@ti.com>
References: <1496405096-18275-1-git-send-email-boris.brezillon@free-electrons.com>
 <1496405096-18275-2-git-send-email-boris.brezillon@free-electrons.com>
 <60f8b8ec-c83b-0609-c5e5-44b3f9302808@codeaurora.org>
 <20170606113545.3a9ab2d0@bbrezillon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0399268851=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170606113545.3a9ab2d0@bbrezillon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja <architt@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Cyprian Wronka <cwronka@cadence.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Simon Hatliff <hatliff@cadence.com>, dri-devel@lists.freedesktop.org, Richard Sproul <sproul@cadence.com>, Alan Douglas <adouglas@cadence.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Neil Webb <neilw@cadence.com>
List-Id: devicetree@vger.kernel.org

--===============0399268851==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="oLuXkkUNJNG8BMjOtRaVFQ9QhOn9LpXqM"

--oLuXkkUNJNG8BMjOtRaVFQ9QhOn9LpXqM
Content-Type: multipart/mixed; boundary="VeWjGNlx5u59wwiif3KiGAsXDHmBr6Ehr";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Archit Taneja <architt@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Cyprian Wronka <cwronka@cadence.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell
 <ijc+devicetree@hellion.org.uk>, Simon Hatliff <hatliff@cadence.com>,
 dri-devel@lists.freedesktop.org, Alan Douglas <adouglas@cadence.com>,
 Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Richard Sproul <sproul@cadence.com>, Neil Webb <neilw@cadence.com>
Message-ID: <902ba6cf-4125-fac6-62dd-6b6198f541f3@ti.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: drm/bridge: Document Cadence DSI
 bridge bindings
References: <1496405096-18275-1-git-send-email-boris.brezillon@free-electrons.com>
 <1496405096-18275-2-git-send-email-boris.brezillon@free-electrons.com>
 <60f8b8ec-c83b-0609-c5e5-44b3f9302808@codeaurora.org>
 <20170606113545.3a9ab2d0@bbrezillon>
In-Reply-To: <20170606113545.3a9ab2d0@bbrezillon>

--VeWjGNlx5u59wwiif3KiGAsXDHmBr6Ehr
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06/06/17 12:35, Boris Brezillon wrote:
> On Sat, 3 Jun 2017 23:43:17 +0530
> Archit Taneja <architt@codeaurora.org> wrote:
>=20
>> Hi,
>>
>> On 06/02/2017 05:34 PM, Boris Brezillon wrote:
>>> Document the bindings used for the Cadence DSI bridge.
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>>> ---
>>>  .../bindings/display/bridge/cdns,dsi.txt           | 55 ++++++++++++=
++++++++++
>>>  1 file changed, 55 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/display/bridge/=
cdns,dsi.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,ds=
i.txt b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
>>> new file mode 100644
>>> index 000000000000..770c5c5b1e93
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
>>> @@ -0,0 +1,55 @@
>>> +Cadence DSI bridge
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +The Cadence DSI bridge is a DPI to DSI bridge supporting up to 4 DSI=
 lanes. =20
>>
>> Is this a separate chip, or an IP integrated into SoCs?
>=20
> It's supposed to be integrated into SoCs.
>=20
>> If it's the=20
>> latter, I don't think DPI on the its input side is the right term to=20
>> use. Maybe RGB would be more appropriate here.
>=20
> Well, the datasheet explicitly mentions DPI, and you can also send
> pixels in YUV422 and YUV420 format on this bus, so I don't think RGB is=

> appropriate, but if you really want me to use RGB I can change that.
>=20
> BTW, can you detail why DPI is not appropriate for internal parallel
> busses. I don't understand why it makes a difference when the bus is ex=
posed
> through external pins.

I think MIPI DPI is fine, if it is indeed MIPI DPI. But mot all parallel
video busses are MIPI DPI.

>>> +Required subnodes:
>>> +- ports: Ports as described in Documentation/devicetree/bindings/gra=
ph.txt.
>>> +  Currently contains a single input port at address 0 representing t=
he DPI
>>> +  input. Other ports will be added later to support the SDI inputs.
>>> +  Port 0 should be connected to a DPI encoder output. =20
>>
>> The output of the DSI bridge may be another bridge, which could be i2c=

>> controlled. In that case, it won't be a child of the DSI bridge. For
>> such scenarios, we might want to define an output port for the bridge.=

>=20
> Hm, okay. IIRC, this is something you mentioned when I asked how to
> describe input/output ports for a DSI bridge a while ago.
>=20
> I'm still not sure how the links between input and output endpoint are
> supposed to be described.
>=20
> For example, if you take the case where you have the DSI device
> directly described under the DSI host controller, should I create
> another node for this output port? Something like the following?
>=20
> 	dsi@xxx {
> 		#address-cells =3D <1>;
> 		#size-cells =3D <0>;
>=20
> 		ports {
> 			#address-cells =3D <1>;
> 			#size-cells =3D <0>;
> 			dpi_in: port@0 {
> 				reg =3D <0>;
> 				#address-cells =3D <1>;
> 				#size-cells =3D <0>;
>=20
> 				endpoint@0 {
> 					remote-endpoint =3D <&dpi_out>;
> 				};
> 			};
>=20
> 			dsi_out0: port@1 {
> 				reg =3D <1>;
> 				#address-cells =3D <1>;
> 				#size-cells =3D <0>;
>=20
> 				dsi_out0: endpoint@0 {
> 					remote-endpoint =3D <&dsi_panel0_in>;
> 				};
> 			};
>=20
> 			dsi_out0: port@2 {
> 				reg =3D <2>;
> 				#address-cells =3D <1>;
> 				#size-cells =3D <0>;
>=20
> 				dsi_out1: endpoint@0 {
> 					remote-endpoint =3D <&dsi_panel1_in>;
> 				};
> 			};
> 		};
>=20
> 		panel@0 {
> 			compatible =3D "...";
> 			reg =3D <0>;
> 			#address-cells =3D <1>;
> 			#size-cells =3D <0>;
>=20
> 			port@0 {
> 				#address-cells =3D <1>;
> 		                #size-cells =3D <0>;
> 				reg =3D <0>;
>=20
> 				dsi_panel0_in: endpoint@0 {
> 					remote-endpoint =3D <&dsi_out0>;
> 				};
> 			};
> 		};
>=20
> 		panel@1 {
> 			compatible =3D "...";
> 			reg =3D <1>;
> 			#address-cells =3D <1>;
> 			#size-cells =3D <0>;
>=20
> 			port@0 {
> 				#address-cells =3D <1>;
> 		                #size-cells =3D <0>;
> 				reg =3D <0>;
>=20
> 				dsi_panel1_in: endpoint@0 {
> 					remote-endpoint =3D <&dsi_out1>;
> 				};
> 			};
> 		};
> 	};
>=20

The ports & endpoints describe the video path, and the node child-parent
relationship describe the control path. And "port" is a physical
connector of some sort, and endpoint is a virtual channel or such.

So, you can have DSI peripherals which are either children of the DSI
bridge, and can be controlled with DSI commands. Or, you can have, say,
i2c peripherals, defined under an i2c node, which just take the video
stream from the DSI bridge. Both would have similar ports & endpoints,
but the DT nodes would be located under different parents.

Also, you can't have two output ports unless the DSI bridge has actually
multiple output pins. If the two panels are connected to the same DSI
pins, and the DSI virtual channel is used to direct the output to the
correct panel, then these should be endpoints.

 Tomi


--VeWjGNlx5u59wwiif3KiGAsXDHmBr6Ehr--

--oLuXkkUNJNG8BMjOtRaVFQ9QhOn9LpXqM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZNqK5AAoJEPo9qoy8lh71jMwQAJfYHR2VG7wyx5hgQ9zUfp2O
29NZnTg7lbITUy21dNgvGYrvNZmFtGWWf5ri71EygaU5n5/kY3/SejJqD1a1UmuA
rL+qrVS+DfN7m4kD1/mIfKEB1yQSZebxe1n+IxnCC5c4MECkPeCR0TrX+v8h9Bst
pYf/dvWzxlxSOiwo6XGS/rBgMHtXlYjE9hHmxLVZIIFOnEnBt3yABBHi6mPn+w9M
9XE2IahV3bDzH+VOHk61LpewOaUzkRqi6YoywAFifiPZQzl2b3vEPIVJHIQOFrr/
G9optsiWLnRgdY/GIoNT0ep3lt6DNhfd+uQxQ140+ok20SEpsn/rP3YBMjt0KaSJ
WWHSer+ytU9xq9vhe5UfuNmqYGuGvQDNLMQB1HyKaosrOC5wKNiXlZtRu0MnAs+0
FVUw7/qvERKsUhLEZLqHWqauPUYU7CtQI+C3a8q6zrguKM46HMdXASv8HSob+e0o
0olLfplY972I4sQYXmCcDPkwmccsPGfCLTgG9FayoK0hErzZ3E0MgPayVqrcQrcQ
xKFRKZR0Zm9c3xkB0y5rpDZ4dmzXod5sduZNcf+HTr7XEp7mWt6veBogp7hVeHmu
aIdAndUUzPLn1vgvKmEap78l3VPASE54gqAGIhRgwkfBiy+32P99znobg8J0iVid
KfGJ1VCe6WmNJmuDQAwj
=lEam
-----END PGP SIGNATURE-----

--oLuXkkUNJNG8BMjOtRaVFQ9QhOn9LpXqM--

--===============0399268851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0399268851==--
