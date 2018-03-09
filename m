From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/2] ARM: dts: imx: Add basic dts support for imx6sll
 EVK board
Date: Fri, 9 Mar 2018 17:44:29 -0600
Message-ID: <20180309234429.3su6cnwxkmgaw7fh@rob-hp-laptop>
References: <1520503424-22985-1-git-send-email-ping.bai@nxp.com>
 <1520503424-22985-2-git-send-email-ping.bai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1520503424-22985-2-git-send-email-ping.bai@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bai Ping <ping.bai@nxp.com>
Cc: aisheng.dong@nxp.com, devicetree@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, jacky.baip@gmail.com, fabio.estevam@nxp.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 08, 2018 at 06:03:44PM +0800, Bai Ping wrote:
> Add dts file support for imx6sll EVK board.
> 
> Signed-off-by: Bai Ping <ping.bai@nxp.com>
> ---
>  change v3->v4
>  - update the license indentifier
>  - remove leading zero of node
>  - remove unused pin from hog group
> ---
>  Documentation/devicetree/bindings/arm/fsl.txt |   4 +
>  arch/arm/boot/dts/Makefile                    |   2 +
>  arch/arm/boot/dts/imx6sll-evk.dts             | 372 ++++++++++++++++++++++++++
>  3 files changed, 378 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6sll-evk.dts

One nit, otherwise:

Reviewed-by: Rob Herring <robh@kernel.org>

> +&i2c1 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c1>;
> +	status = "okay";
> +
> +	pmic: pfuze100@8 {

pmic@...

> +		compatible = "fsl,pfuze100";
> +		reg = <0x08>;
