From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v3 3/4] dt-bindings: net: fsl: enetc: Add
 bindings for the central MDIO PCIe endpoint
Date: Mon, 29 Jul 2019 17:36:32 +0200
Message-ID: <20190729153632.GH4110@lunn.ch>
References: <1564394627-3810-1-git-send-email-claudiu.manoil@nxp.com>
 <1564394627-3810-4-git-send-email-claudiu.manoil@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1564394627-3810-4-git-send-email-claudiu.manoil@nxp.com>
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

On Mon, Jul 29, 2019 at 01:03:46PM +0300, Claudiu Manoil wrote:
> The on-chip PCIe root complex that integrates the ENETC ethernet
> controllers also integrates a PCIe endpoint for the MDIO controller
> providing for centralized control of the ENETC mdio bus.
> Add bindings for this "central" MDIO Integrated PCIe Endpoint.
> 
> Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
