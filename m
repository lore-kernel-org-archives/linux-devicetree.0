From: Adriana Kobylak <anoo@linux.ibm.com>
Subject: Re: [PATCH] ARM: dts: aspeed: swift: Add eMMC device
Date: Wed, 21 Aug 2019 10:10:06 -0500
Message-ID: <202dcd112f41044162465d8a724b66d0@linux.vnet.ibm.com>
References: <20190821045655.21752-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190821045655.21752-1-joel@jms.id.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joel Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, Adriana Kobylak <anoo@us.ibm.com>, Linux-aspeed <linux-aspeed-bounces+anoo=linux.ibm.com@lists.ozlabs.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 2019-08-20 23:56, Joel Stanley wrote:
> Swift contains an eMMC device attached to the second SDHCI controller.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Adriana Kobylak <anoo@us.ibm.com>

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-swift.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> index f14f745b34ca..25bc0e1bbced 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
> @@ -963,4 +963,15 @@
>  	status = "okay";
>  };
> 
> +&sdmmc {
> +       status = "okay";
> +};
> +
> +&sdhci1 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_sd2_default>;
> +};
> +
>  #include "ibm-power9-dual.dtsi"
