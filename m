From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCHv5 5/5] ARM: dts: imx6q-b450v3: Add switch port
 configuration
Date: Tue, 23 Jan 2018 07:34:52 -0800
Message-ID: <7a37e9a0-ec55-8a5c-3f21-f2e2a8a962f4@gmail.com>
References: <20180123150350.11031-1-sebastian.reichel@collabora.co.uk>
 <20180123150350.11031-6-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180123150350.11031-6-sebastian.reichel@collabora.co.uk>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Ian Ray <ian.ray@ge.com>, Nandor Han <nandor.han@ge.com>, Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@lists.collabora.co.uk
List-Id: devicetree@vger.kernel.org



On 01/23/2018 07:03 AM, Sebastian Reichel wrote:
> This adds support for the Marvell switch and names the network
> ports according to the labels, that can be found next to the
> connectors. The switch is connected to the host system using a
> PCI based network card.
> 
> The PCI bus configuration has been written using the following
> information:
> 
> root@b450v3# lspci -tv
> -[0000:00]---00.0-[01]----00.0  Intel Corporation I210 Gigabit Network Connection
> root@b450v3# lspci -nn
> 00:00.0 PCI bridge [0604]: Synopsys, Inc. Device [16c3:abcd] (rev 01)
> 01:00.0 Ethernet controller [0200]: Intel Corporation I210 Gigabit Network Connection [8086:1533] (rev 03)
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
