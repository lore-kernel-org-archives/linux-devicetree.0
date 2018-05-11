From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 2/3] ARM: dts: imx28: Remove unit-address from pinctrl
Date: Fri, 11 May 2018 02:45:30 +0200 (CEST)
Message-ID: <435135292.243569.1525999530960@email.1und1.de>
References: <1525997810-10964-1-git-send-email-festevam@gmail.com>
 <1525997810-10964-2-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1525997810-10964-2-git-send-email-festevam@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Fabio,

> Fabio Estevam <festevam@gmail.com> hat am 11. Mai 2018 um 02:16 geschrieben:
> 
> 
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> Remove unit-address and reg property from pinctrl subnodes to fix
> the following DTC warnings with W=1:
> 
> arch/arm/boot/dts/imx28-apf28dev.dtb: Warning (unique_unit_address): /apb@80000000/apbh@80000000/pinctrl@80018000/hog@0: duplicate unit-address (also used in node /apb@80000000/apbh@80000000
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  arch/arm/boot/dts/imx28-apf28dev.dts           |   9 +-
>  arch/arm/boot/dts/imx28-apx4devkit.dts         |  12 +-
>  arch/arm/boot/dts/imx28-cfa10036.dts           |  12 +-
>  arch/arm/boot/dts/imx28-cfa10037.dts           |   6 +-
>  arch/arm/boot/dts/imx28-cfa10049.dts           |  36 ++---
>  arch/arm/boot/dts/imx28-cfa10055.dts           |  12 +-
>  arch/arm/boot/dts/imx28-cfa10056.dts           |   9 +-
>  arch/arm/boot/dts/imx28-cfa10057.dts           |   9 +-
>  arch/arm/boot/dts/imx28-cfa10058.dts           |   6 +-
>  arch/arm/boot/dts/imx28-duckbill-2-485.dts     |  12 +-
>  arch/arm/boot/dts/imx28-duckbill-2-enocean.dts |  15 +-
>  arch/arm/boot/dts/imx28-duckbill-2-spi.dts     |  15 +-
>  arch/arm/boot/dts/imx28-duckbill-2.dts         |  12 +-
>  arch/arm/boot/dts/imx28-duckbill.dts           |   9 +-
>  arch/arm/boot/dts/imx28-eukrea-mbmx283lc.dts   |   3 +-
>  arch/arm/boot/dts/imx28-eukrea-mbmx287lc.dts   |   3 +-
>  arch/arm/boot/dts/imx28-eukrea-mbmx28lc.dtsi   |  24 ++--
>  arch/arm/boot/dts/imx28-evk.dts                |  12 +-
>  arch/arm/boot/dts/imx28-m28cu3.dts             |   9 +-
>  arch/arm/boot/dts/imx28-m28evk.dts             |   6 +-
>  arch/arm/boot/dts/imx28-sps1.dts               |   3 +-
>  arch/arm/boot/dts/imx28-ts4600.dts             |   3 +-
>  arch/arm/boot/dts/imx28-tx28.dts               |  33 ++---
>  arch/arm/boot/dts/imx28.dtsi                   | 191 ++++++++-----------------
>  24 files changed, 153 insertions(+), 308 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx28-apf28dev.dts b/arch/arm/boot/dts/imx28-apf28dev.dts
> index c4fadbc..53ed2e2 100644
> ...
> diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
> index 9ad8d35..8f46b1f 100644
> --- a/arch/arm/boot/dts/imx28.dtsi
> +++ b/arch/arm/boot/dts/imx28.dtsi
> @@ -169,14 +169,11 @@
>  			};
>  
>  			pinctrl: pinctrl@80018000 {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
>  				compatible = "fsl,imx28-pinctrl", "simple-bus";
>  				reg = <0x80018000 0x2000>;
>  
> -				gpio0: gpio@0 {
> +				gpio0: gpio0 {
>  					compatible = "fsl,imx28-gpio", "fsl,mxs-gpio";
> -					reg = <0>;
>  					interrupts = <127>;
>  					gpio-controller;
>  					#gpio-cells = <2>;
> @@ -184,9 +181,8 @@
>  					#interrupt-cells = <2>;
>  				};

i'm not sure, but it looked to me like a proper way to address the gpio banks before.

Regards
Stefan

>  
> -				gpio1: gpio@1 {
> +				gpio1: gpio1 {
>  					compatible = "fsl,imx28-gpio", "fsl,mxs-gpio";
> -					reg = <1>;
>  					interrupts = <126>;
>  					gpio-controller;
>  					#gpio-cells = <2>;
> @@ -194,9 +190,8 @@
>  					#interrupt-cells = <2>;
>  				};
>
