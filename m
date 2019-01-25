From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH 0/3] at803x: Add quirk to disable SmartEEE
Date: Fri, 25 Jan 2019 13:06:13 +0000
Message-ID: <20190125130612.npknjuzjmny4yohg@e5254000004ec.dyn.armlinux.org.uk>
References: <20190125125513.23656-1-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190125125513.23656-1-ccaione@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Carlo Caione <ccaione@baylibre.com>
Cc: mark.rutland@arm.com, andrew@lunn.ch, f.fainelli@gmail.com, devicetree@vger.kernel.org, s.hauer@pengutronix.de, abailon@baylibre.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, aisheng.dong@nxp.com, linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri, Jan 25, 2019 at 12:55:10PM +0000, Carlo Caione wrote:
> SmartEEE, compatible with IEEE802.3az standard, is designed to include
> legacy MAC without EEE capability into the power saving system. SmartEEE 
> is enabled by default configuration on AR8031 after power-on or hardware 
> reset.
> 
> Unfortunately this is proved causing issues for certain hw 
> configurations.  We add a quirk to optionally disable SmartEEE.

It may be a good idea to detail what "certain hw configurations" are
and/or what the "issues" are, so it's easier to find this if/when
others encounter the same issue.

> 
> PATCH 3/3 depends on https://patchwork.kernel.org/patch/10781297/
> 
> 
> Carlo Caione (3):
>   net: phy: at803x: Introduce quirk to disable SmartEEE
>   dt-bindings: net: at803x: Document at803x,smarteee-disabled property
>   arm64: dts: imx8mq-evk: Disable SmartEEE
> 
>  .../devicetree/bindings/net/at803x.txt        | 18 +++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts  |  1 +
>  drivers/net/phy/at803x.c                      | 22 +++++++++++++++++++
>  3 files changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/at803x.txt
> 
> -- 
> 2.19.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
