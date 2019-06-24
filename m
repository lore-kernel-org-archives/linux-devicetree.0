From: Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: RE: [PATCH net-next 4/6] arm64: dts: fsl: ls1028a: Add Felix switch
 port DT node
Date: Mon, 24 Jun 2019 11:45:37 +0000
Message-ID: <VI1PR04MB4880D8F90BBCD30BF8A69C9696E00@VI1PR04MB4880.eurprd04.prod.outlook.com>
References: <1561131532-14860-1-git-send-email-claudiu.manoil@nxp.com>
 <1561131532-14860-5-git-send-email-claudiu.manoil@nxp.com>
 <20190621164940.GL31306@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190621164940.GL31306@lunn.ch>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Alexandru Marginean <alexandru.marginean@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>, Allan Nielsen <Allan.Nielsen@microsemi.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Andrew,

>-----Original Message-----
>From: Andrew Lunn <andrew@lunn.ch>
>Sent: Friday, June 21, 2019 7:50 PM
>To: Claudiu Manoil <claudiu.manoil@nxp.com>
>Cc: David S . Miller <davem@davemloft.net>; devicetree@vger.kernel.org;
>Alexandre Belloni <alexandre.belloni@bootlin.com>; netdev@vger.kernel.org;
>Alexandru Marginean <alexandru.marginean@nxp.com>; linux-
>kernel@vger.kernel.org; UNGLinuxDriver@microchip.com; Allan Nielsen
><Allan.Nielsen@microsemi.com>; Rob Herring <robh+dt@kernel.org>; linux-
>arm-kernel@lists.infradead.org
>Subject: Re: [PATCH net-next 4/6] arm64: dts: fsl: ls1028a: Add Felix swit=
ch port
>DT node
>
>On Fri, Jun 21, 2019 at 06:38:50PM +0300, Claudiu Manoil wrote:
>> The switch device features 6 ports, 4 with external links
>> and 2 internally facing to the ls1028a SoC and connected via
>> fixed links to 2 internal enetc ethernet controller ports.
>
>Hi Claudiu
>
>> +			switch@0,5 {
>> +				compatible =3D "mscc,felix-switch";
>> +				reg =3D <0x000500 0 0 0 0>;
>> +
>> +				ethernet-ports {
>> +					#address-cells =3D <1>;
>> +					#size-cells =3D <0>;
>> +
>> +					/* external ports */
>> +					switch_port0: port@0 {
>> +						reg =3D <0>;
>> +					};
>> +					switch_port1: port@1 {
>> +						reg =3D <1>;
>> +					};
>> +					switch_port2: port@2 {
>> +						reg =3D <2>;
>> +					};
>> +					switch_port3: port@3 {
>> +						reg =3D <3>;
>> +					};
>> +					/* internal to-cpu ports */
>> +					port@4 {
>> +						reg =3D <4>;
>> +						fixed-link {
>> +							speed =3D <1000>;
>> +							full-duplex;
>> +						};
>> +					};
>> +					port@5 {
>> +						reg =3D <5>;
>> +						fixed-link {
>> +							speed =3D <1000>;
>> +							full-duplex;
>> +						};
>> +					};
>> +				};
>> +			};
>
>This sounds like a DSA setup, where you have SoC ports connected to
>the switch. With DSA, the CPU ports of the switch are special. We
>don't create netdev's for them, the binding explicitly list which SoC
>interface they are bound to, etc.
>
>What model are you using here? I'm just trying to understand the setup
>to ensure it is consistent with the swichdev model.
>

Yeah, there are 2 ethernet controller ports (managed by the enetc driver)=20
connected inside the SoC via SGMII links to 2 of the switch ports, one of
these switch ports can be configured as CPU port (with follow-up patches).

This configuration may look prettier on DSA, but the main restriction here
is that the entire functionality is provided by the ocelot driver which is =
a
switchdev driver.  I don't think it would be a good idea to copy-paste code
from ocelot to a separate dsa driver.

Thanks for the review.
Claudiu
