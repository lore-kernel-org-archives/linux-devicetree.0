From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 3/3] dt-bindings: spi: Document imx8mq binding
Date: Mon, 11 Feb 2019 09:59:33 +0800
Message-ID: <20190211015931.GC22487@dragon>
References: <20190130120511.11555-1-ccaione@baylibre.com>
 <20190130120511.11555-4-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190130120511.11555-4-ccaione@baylibre.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com, linux-arm-kernel@lists.infradead.org, l.stach@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Wed, Jan 30, 2019 at 12:05:11PM +0000, Carlo Caione wrote:
> Add the "fsl,imx8mq-qspi" binding to the spi-fsl-qspi documentation.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

It doesn't apply to my tree, so you may need to send via spi tree.

Shawn

> ---
>  Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt b/Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt
> index e8f1d627d288..3fd1b8baf5ca 100644
> --- a/Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt
> +++ b/Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt
> @@ -5,6 +5,8 @@ Required properties:
>  		 "fsl,imx7d-qspi", "fsl,imx6ul-qspi",
>  		 "fsl,ls1021a-qspi"
>  		 or
> +		 "fsl,imx8mq-qspi" followed by "fsl,imx7d-qspi"
> +		 or
>  		 "fsl,ls2080a-qspi" followed by "fsl,ls1021a-qspi",
>  		 "fsl,ls1043a-qspi" followed by "fsl,ls1021a-qspi"
>    - reg : the first contains the register location and length,
> -- 
> 2.19.1
> 
