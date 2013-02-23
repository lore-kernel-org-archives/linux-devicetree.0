From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/2] Drivers: w1: mxc_w1, Add support for DT
Date: Sun, 24 Feb 2013 01:18:38 +0400
Message-ID: <5129322E.9030400@cogentembedded.com>
References: <1361640958-1876-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1361640958-1876-1-git-send-email-mpa@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Markus Pargmann <mpa@pengutronix.de>
Cc: fabio.estevam@freescale.com, gregkh@linuxfoundation.org, s.hauer@pengutronix.de, rob.herring@calxeda.com, grant.likely@secretlab.ca, kernel@pengutronix.de, zbr@ioremap.net, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello.

On 23-02-2013 21:35, Markus Pargmann wrote:

> Add devicetree support for mxc_w1 driver.

> Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
> ---
>   Documentation/devicetree/bindings/w1/fsl,mxc-w1.txt | 13 +++++++++++++
>   drivers/w1/masters/mxc_w1.c                         |  7 +++++++
>   2 files changed, 20 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/w1/fsl,mxc-w1.txt

> diff --git a/Documentation/devicetree/bindings/w1/fsl,mxc-w1.txt b/Documentation/devicetree/bindings/w1/fsl,mxc-w1.txt
> new file mode 100644
> index 0000000..686ced4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/w1/fsl,mxc-w1.txt
> @@ -0,0 +1,13 @@
> +Freescale driver for Dalla's 1-wire bus master on imx chips

    You meant "Dallas'".

WBR, Sergei
