From: Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: RE: [PATCH net-next 6/6] net/mssc/ocelot: Add basic Felix switch
 driver
Date: Mon, 24 Jun 2019 13:19:46 +0000
Message-ID: <VI1PR04MB48805E585FF56E111E84430896E00@VI1PR04MB4880.eurprd04.prod.outlook.com>
References: <1561131532-14860-1-git-send-email-claudiu.manoil@nxp.com>
 <1561131532-14860-7-git-send-email-claudiu.manoil@nxp.com>
 <20190622205720.GK8497@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190622205720.GK8497@lunn.ch>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Alexandru Marginean <alexandru.marginean@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>, Allan Nielsen <Allan.Nielsen@microsemi.com>, Rob Herring <robh+dt@kernel.org>, Catalin Horghidan <catalin.horghidan@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

>-----Original Message-----
>From: Andrew Lunn <andrew@lunn.ch>
>Sent: Saturday, June 22, 2019 11:57 PM
>To: Claudiu Manoil <claudiu.manoil@nxp.com>

[...]

Ok for all, I can work more on refactoring if we agree on the basics.=20
For instance I can change the driver to use reg-names, same as=20
mscc-ocelot, and factor out the common code.
So far my intention was to change the ocelot part as little as possible,=20
only where necessary.

Thanks,
Claudiu
