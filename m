From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v3 4/4] arm64: dts: fsl: ls1028a: Enable eth
 port1 on the ls1028a QDS board
Date: Mon, 29 Jul 2019 17:37:45 +0200
Message-ID: <20190729153745.GI4110@lunn.ch>
References: <1564394627-3810-1-git-send-email-claudiu.manoil@nxp.com>
 <1564394627-3810-5-git-send-email-claudiu.manoil@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1564394627-3810-5-git-send-email-claudiu.manoil@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, alexandru.marginean@nxp.com, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 29, 2019 at 01:03:47PM +0300, Claudiu Manoil wrote:
> LS1028a has one Ethernet management interface. On the QDS board, the
> MDIO signals are multiplexed to either on-board AR8035 PHY device or
> to 4 PCIe slots allowing for SGMII cards.
> To enable the Ethernet ENETC Port 1, which can only be connected to a
> RGMII PHY, the multiplexer needs to be configured to route the MDIO to
> the AR8035 PHY.  The MDIO/MDC routing is controlled by bits 7:4 of FPGA
> board config register 0x54, and value 0 selects the on-board RGMII PHY.
> The FPGA board config registers are accessible on the i2c bus, at address
> 0x66.
> 
> The PF3 MDIO PCIe integrated endpoint device allows for centralized access
> to the MDIO bus.  Add the corresponding devicetree node and set it to be
> the MDIO bus parent.
> 
> Signed-off-by: Alex Marginean <alexandru.marginean@nxp.com>
> Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
