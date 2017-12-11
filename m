From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v4 0/4] Teach phylib hard-resetting devices
Date: Mon, 11 Dec 2017 08:04:48 +0100
Message-ID: <20171211070447.kyipuoygofhuggye@verge.net.au>
References: <1512383692-14009-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1512383692-14009-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "David S . Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Richard Leitner <richard.leitner@skidata.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 04, 2017 at 11:34:48AM +0100, Geert Uytterhoeven wrote:
> 	Hi David, Andrew, Florian, Simon, Magnus,
> 
> This patch series adds optional PHY reset support to phylib.
> 
> The first two patches are destined for David's net-next tree. They add
> core PHY reset code, and update a driver that currently uses its own
> reset code.
> 
> The last two patches are destined for Simon's renesas tree.  They add
> properties to describe the EthernetAVB PHY reset topology to the common
> Salvator-X/XS and ULCB DTS files, which solves two issues:
>   1. On Salvator-XS, the enable pin of the regulator providing PHY power
>      is connected to PRESETn, and PSCI powers down the SoC during system
>      suspend.  Hence a PHY reset is needed to restore network
>      functionality after system resume.
>   2. Linux should not rely on the boot loader having reset the PHY, but
>      should reset the PHY during driver probe.

Thanks, I have applied patches 3/4 and 4/4 for v4.16.
