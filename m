From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 3/6] reset: imx7: Add PCIE_CTRL_APPS_TURNOFF
Date: Wed, 15 Aug 2018 14:24:55 -0600
Message-ID: <20180815202455.GA15583@rob-hp-laptop>
References: <cover.1534264292.git.leonard.crestez@nxp.com>
 <88a5997e37d048cfc2dabb44cc13dce89c93d5eb.1534264292.git.leonard.crestez@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <88a5997e37d048cfc2dabb44cc13dce89c93d5eb.1534264292.git.leonard.crestez@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leonard Crestez <leonard.crestez@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Richard Zhu <hongxing.zhu@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>, linux-pci@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 14, 2018 at 07:50:17PM +0300, Leonard Crestez wrote:
> This is required for the imx pci driver to send the PME_Turn_Off TLP.
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> ---
>  drivers/reset/reset-imx7.c             | 1 +

>  include/dt-bindings/reset/imx7-reset.h | 4 +++-

Acked-by: Rob Herring <robh@kernel.org>

>  2 files changed, 4 insertions(+), 1 deletion(-)
