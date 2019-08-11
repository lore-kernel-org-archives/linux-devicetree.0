Return-Path: <SRS0=fOPh=WH=us.ibm.com=miltonm@kernel.org>
In-Reply-To: <20190810095325.5333-1-wangzqbj@inspur.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
Date: Sun, 11 Aug 2019 22:06:45 +0000
MIME-Version: 1.0
References: <20190810095325.5333-1-wangzqbj@inspur.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Message-Id: <OF3B0A1F81.64227A30-ON00258453.007977BA-00258453.007977C8@notes.na.collabserv.com>
Subject: Re:  [PATCH v2 1/2] dt-bindings: Add ipsps1 as a trivial device
To: John Wang <wangzqbj@inspur.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, trivial@kernel.org, linux@roeck-us.net, venture@google.com, jgebben@sweptlaser.com, anson.huang@nxp.com, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, duanzhijia01@inspur.com, mine260309@gmail.com
List-ID: <devicetree@vger.kernel.org>

Around 08/10/2019 04:54AM in some timezone, John Wang wrote:
>The ipsps1 is an Inspur Power System power supply unit
>
>Signed-off-by: John Wang <wangzqbj@inspur.com>
>---
>v2:
>    - No changes.
>---
> Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml
>b/Documentation/devicetree/bindings/trivial-devices.yaml
>index 747fd3f689dc..63960c7d949a 100644
>--- a/Documentation/devicetree/bindings/trivial-devices.yaml
>+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
>@@ -101,6 +101,8 @@ properties:
>             # Infineon TLV493D-A1B6 I2C 3D Magnetic Sensor
>           - infineon,tlv493d-a1b6
>             # Intersil ISL29028 Ambient Light and Proximity Sensor
>+          - inspur,ipsps1
>+            # Inspur Power System power supply unit version 1
>           - isil,isl29028

The comment describing your entry should go abvoe your entry, and=20
your new entry (starting with the comment) should be before the=20
Intersil entry comment line.


>             # Intersil ISL29030 Ambient Light and Proximity Sensor
>           - isil,isl29030
>--=20
>2.17.1
>
>

Milton
