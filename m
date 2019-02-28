From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH net-next v4 4/4] dt-bindings: net: freescale: enetc: Add
 connection bindings for ENETC ethernet nodes
Date: Thu, 28 Feb 2019 08:30:35 -0600
Message-ID: <20190228143035.GA15928@bogus>
References: <1551188543-28867-1-git-send-email-claudiu.manoil@nxp.com>
 <1551188543-28867-5-git-send-email-claudiu.manoil@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1551188543-28867-5-git-send-email-claudiu.manoil@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: Li Yang <leoyang.li@nxp.com>, "David S . Miller" <davem@davemloft.net>, alexandru.marginean@nxp.com, Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 26 Feb 2019 15:42:23 +0200, Claudiu Manoil wrote:
> Define connection bindings (external PHY connections and internal links)
> for the ENETC on-chip ethernet controllers.
> 
> Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
> ---
> v3 - added this patch to the set
> v4 - documented strictly the enetc node bindings, changed node type
>      from "pci" to "ethernet" and added compatible string (Rob H.)
> 
>  .../devicetree/bindings/net/fsl-enetc.txt          | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/fsl-enetc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
