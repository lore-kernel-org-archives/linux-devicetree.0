From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v8 2/4] dt-bindings: mailbox: imx-mu: add generic MU
 channel support
Date: Tue, 31 Jul 2018 13:09:11 -0600
Message-ID: <20180731190911.GA23014@rob-hp-laptop>
References: <20180731141146.10788-1-o.rempel@pengutronix.de>
 <20180731141146.10788-3-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180731141146.10788-3-o.rempel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 31, 2018 at 04:11:44PM +0200, Oleksij Rempel wrote:
> Each MU has four pairs of rx/tx data register with four rx/tx interrupts
> which can also be used as a separate channel.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/mailbox/fsl,mu.txt    | 28 +++++++++++++++++--
>  1 file changed, 25 insertions(+), 3 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
