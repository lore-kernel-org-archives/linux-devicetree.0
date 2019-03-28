From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 2/2] dt-bindings: iio: add Bosch BMG160 gyroscope sensor
Date: Thu, 28 Mar 2019 17:29:15 +0100
Message-ID: <55464EC0-7031-42BD-A6E0-6E04E3A45FE8@goldelico.com>
References: <cover.1552922054.git.hns@goldelico.com> <1664da2e7a9cb687eece1f27501d275219bcc4ed.1552922054.git.hns@goldelico.com> <20190324180654.44289894@archlinux>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190324180654.44289894@archlinux>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org


> Am 24.03.2019 um 19:06 schrieb Jonathan Cameron <jic23@kernel.org>:
>=20
> On Mon, 18 Mar 2019 16:14:15 +0100
> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>=20
>> Define bindings for "bosch,bmg160" and "bosch,bmi055_gyro".
>>=20
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Simple binding so applied to the togreg branch of iio.git and pushed =
out as
> testing. Still time for a devicetree ack (or to pull it ;) if anyone =
has
> time to look.

It is more or less an adapation of the bma180 bindings.

>=20
> Thanks,
>=20
> Jonathan
>=20
>> ---
>> .../bindings/iio/gyroscope/bmg160.txt         | 20 =
+++++++++++++++++++
>> 1 file changed, 20 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/iio/gyroscope/bmg160.txt
>>=20
>> diff --git =
a/Documentation/devicetree/bindings/iio/gyroscope/bmg160.txt =
b/Documentation/devicetree/bindings/iio/gyroscope/bmg160.txt
>> new file mode 100644
>> index 000000000000..78e18a1e9c1d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/gyroscope/bmg160.txt
>> @@ -0,0 +1,20 @@
>> +* Bosch BMG160 triaxial rotation sensor (gyroscope)
>> +
>> +Required properties:
>> +
>> +  - compatible : should be "bosch,bmg160" or "bosch,bmi055_gyro"
>> +  - reg : the I2C address of the sensor (0x69)
>> +
>> +Optional properties:
>> +
>> +  - interrupts : interrupt mapping for GPIO IRQ, it should by =
configured with
>> +		flags IRQ_TYPE_EDGE_RISING
>> +
>> +Example:
>> +
>> +bmg160@69 {
>> +	compatible =3D "bosch,bmg160";
>> +	reg =3D <0x69>;
>> +	interrupt-parent =3D <&gpio6>;
>> +	interrupts =3D <18 (IRQ_TYPE_EDGE_RISING)>;
>> +};
>=20
