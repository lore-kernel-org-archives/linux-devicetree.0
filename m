From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCHv5 2/5] ARM: dts: imx6q-bx50v3: Add internal switch
Date: Tue, 23 Jan 2018 07:34:01 -0800
Message-ID: <c9a57fd3-c7d8-e92a-3721-0bfddabb7bde@gmail.com>
References: <20180123150350.11031-1-sebastian.reichel@collabora.co.uk>
 <20180123150350.11031-3-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180123150350.11031-3-sebastian.reichel@collabora.co.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Ian Ray <ian.ray@ge.com>, Nandor Han <nandor.han@ge.com>, Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@lists.collabora.co.uk
List-Id: devicetree@vger.kernel.org



On 01/23/2018 07:03 AM, Sebastian Reichel wrote:
> B850v3, B650v3 and B450v3 all have a GPIO bit banged MDIO bus to
> communicate with a Marvell switch. On all devices the switch is
> connected to a PCI based network card, which needs to be referenced
> by DT, so this also adds the common PCI root node.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
