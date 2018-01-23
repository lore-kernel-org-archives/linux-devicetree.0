From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCHv5 3/5] ARM: dts: imx6q-b850v3: Add switch port
 configuration
Date: Tue, 23 Jan 2018 07:34:15 -0800
Message-ID: <2657f8cb-34cc-ed8c-0d0b-69e18180e5bf@gmail.com>
References: <20180123150350.11031-1-sebastian.reichel@collabora.co.uk>
 <20180123150350.11031-4-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180123150350.11031-4-sebastian.reichel@collabora.co.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Ian Ray <ian.ray@ge.com>, Nandor Han <nandor.han@ge.com>, Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@lists.collabora.co.uk
List-Id: devicetree@vger.kernel.org



On 01/23/2018 07:03 AM, Sebastian Reichel wrote:
> This adds support for the Marvell switch and names the network
> ports according to the labels, that can be found next to the
> connectors ("ID", "IX", "ePort 1", "ePort 2"). The switch is
> connected to the host system using a PCI based network card.
> 
> The PCI bus configuration has been written using the following
> information:
> 
> root@b850v3# lspci -tv
> -[0000:00]---00.0-[01]----00.0-[02-05]--+-01.0-[03]----00.0  Intel Corporation I210 Gigabit Network Connection
>                                         +-02.0-[04]----00.0  Intel Corporation I210 Gigabit Network Connection
>                                         \-03.0-[05]--
> root@b850v3# lspci -nn
> 00:00.0 PCI bridge [0604]: Synopsys, Inc. Device [16c3:abcd] (rev 01)
> 01:00.0 PCI bridge [0604]: PLX Technology, Inc. PEX 8605 PCI Express 4-port Gen2 Switch [10b5:8605] (rev ab)
> 02:01.0 PCI bridge [0604]: PLX Technology, Inc. PEX 8605 PCI Express 4-port Gen2 Switch [10b5:8605] (rev ab)
> 02:02.0 PCI bridge [0604]: PLX Technology, Inc. PEX 8605 PCI Express 4-port Gen2 Switch [10b5:8605] (rev ab)
> 02:03.0 PCI bridge [0604]: PLX Technology, Inc. PEX 8605 PCI Express 4-port Gen2 Switch [10b5:8605] (rev ab)
> 03:00.0 Ethernet controller [0200]: Intel Corporation I210 Gigabit Network Connection [8086:1533] (rev 03)
> 04:00.0 Ethernet controller [0200]: Intel Corporation I210 Gigabit Network Connection [8086:1533] (rev 03)
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
