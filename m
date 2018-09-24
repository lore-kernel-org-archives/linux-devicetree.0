From: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
Subject: Re: [PATCH] arm64: amd: seattle: Use "spi" as name for SPI controllers
Date: Mon, 24 Sep 2018 13:09:16 +0000
Message-ID: <b0721afb-ff52-f348-a481-bc4e8ee0f4a7@amd.com>
References: <20180924094648.20797-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180924094648.20797-1-thierry.reding@gmail.com>
Content-Language: en-US
Content-ID: <DF341537742B224990C88FE85190868B@namprd12.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, "Singh, Brijesh" <brijesh.singh@amd.com>, "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 09/24/2018 04:46 AM, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Recent versions of DTC contain additional checks for SPI busses and warn
> about certain common mistakes, such as when an SPI controller has a name
> other than "spi".
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Looks like the same patch was already submitted:

http://lists.infradead.org/pipermail/linux-arm-kernel/2018-September/601706.html

Thanks,
Tom

> ---
>  arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
> index 125f4deb52fe..b664e7af74eb 100644
> --- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
> +++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
> @@ -107,7 +107,7 @@
>  			clock-names = "uartclk", "apb_pclk";
>  		};
>  
> -		spi0: ssp@e1020000 {
> +		spi0: spi@e1020000 {
>  			status = "disabled";
>  			compatible = "arm,pl022", "arm,primecell";
>  			reg = <0 0xe1020000 0 0x1000>;
> @@ -117,7 +117,7 @@
>  			clock-names = "apb_pclk";
>  		};
>  
> -		spi1: ssp@e1030000 {
> +		spi1: spi@e1030000 {
>  			status = "disabled";
>  			compatible = "arm,pl022", "arm,primecell";
>  			reg = <0 0xe1030000 0 0x1000>;
> 
