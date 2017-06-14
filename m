From: Guy Shapiro <guy.shapiro@mobi-wize.com>
Subject: Re: [PATCH v5 1/3] nvmem: dt: document SNVS LPGPR binding
Date: Wed, 14 Jun 2017 10:35:12 +0300
Message-ID: <442e0336-fbd3-f92c-ab6a-0622c710e232@mobi-wize.com>
References: <20170609125730.25502-1-o.rempel@pengutronix.de>
 <20170609125730.25502-2-o.rempel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170609125730.25502-2-o.rempel@pengutronix.de>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Oleksij Rempel <o.rempel@pengutronix.de>, devicetree@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: guy.shapiro@mobi-wize.com
List-Id: devicetree@vger.kernel.org

On 09/06/2017 15:57, Oleksij Rempel wrote:

> Documentation bindings for the Low Power General Purpose Register
> available on i.MX6 SoCs in the Secure Non-Volatile Storage.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/nvmem/snvs-lpgpr.txt          | 19
> +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
>
> diff --git a/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
> b/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
> new file mode 100644
> index 000000000000..21910fb3159f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
> @@ -0,0 +1,19 @@
> +Device tree bindings for Low Power General Purpose Register found in
> i.MX6Q/D
> +Secure Non-Volatile Storage.
> +
> +This DT node should be represented as a sub-node of a "syscon",
> +"simple-mfd" node.
> +
> +Required properties:
> +- compatible: should be:
> +	"fsl,imx6q-snvs-lpgpr" for Freescale i.MX6Q/D/DL/S

I've tested the basic functionality on i.MX6UL. It seems to work as is.
Please add "/UL" on the next version.

Regards,
Guy

> +
> +Example:
> +snvs: snvs@020cc000 {
> +	compatible = "fsl,sec-v4.0-mon", "syscon", "simple-mfd";
> +	reg = <0x020cc000 0x4000>;
> +
> +	snvs_lpgpr: snvs-lpgpr {
> +		compatible = "fsl,imx6q-snvs-lpgpr";
> +	};
> +};
