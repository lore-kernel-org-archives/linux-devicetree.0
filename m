From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] soc: imx: gpcv2: handle reset clocks
Date: Thu, 20 Dec 2018 15:43:19 -0600
Message-ID: <20181220214319.GA16103@bogus>
References: <20181217153152.21135-1-l.stach@pengutronix.de>
 <20181217153152.21135-2-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20181217153152.21135-2-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: devicetree@vger.kernel.org, patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 17, 2018 at 04:31:52PM +0100, Lucas Stach wrote:
> Some power domains handled by the GPCv2 driver need to enable the clocks
> for devies inside the domain, so that the reset propagation and proper
> power-up sequencing happens. Handle them in the same way as on GPCv1.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../bindings/power/fsl,imx-gpcv2.txt          |  3 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/soc/imx/gpcv2.c                       | 60 ++++++++++++++++++-
>  2 files changed, 62 insertions(+), 1 deletion(-)
