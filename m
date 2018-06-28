From: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [RFC PATCH 1/5] arm: dts: zynq: Set correct manufacturer for
 ZedBoard and MicroZed boards
Date: Thu, 28 Jun 2018 08:36:52 +0200
Message-ID: <d43b1758-cc0c-3a19-0d7d-f4773fe5caac@xilinx.com>
References: <20180628054205.17737-1-luaraneda@gmail.com>
 <20180628054205.17737-2-luaraneda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180628054205.17737-2-luaraneda@gmail.com>
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
To: Luis Araneda <luaraneda@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 28.6.2018 07:42, Luis Araneda wrote:
> Both boards are made by Avnet, Inc.
> 
> Signed-off-by: Luis Araneda <luaraneda@gmail.com>
> ---
>  arch/arm/boot/dts/zynq-microzed.dts | 2 +-
>  arch/arm/boot/dts/zynq-zed.dts      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/zynq-microzed.dts b/arch/arm/boot/dts/zynq-microzed.dts
> index aa4a0b6de..e40f40a7f 100644
> --- a/arch/arm/boot/dts/zynq-microzed.dts
> +++ b/arch/arm/boot/dts/zynq-microzed.dts
> @@ -8,7 +8,7 @@
>  
>  / {
>  	model = "Zynq MicroZED Development Board";
> -	compatible = "xlnx,zynq-microzed", "xlnx,zynq-7000";
> +	compatible = "avnet,zynq-microzed", "xlnx,zynq-7000";
>  
>  	aliases {
>  		ethernet0 = &gem0;
> diff --git a/arch/arm/boot/dts/zynq-zed.dts b/arch/arm/boot/dts/zynq-zed.dts
> index 53c6883ce..98381cc85 100644
> --- a/arch/arm/boot/dts/zynq-zed.dts
> +++ b/arch/arm/boot/dts/zynq-zed.dts
> @@ -8,7 +8,7 @@
>  
>  / {
>  	model = "Zynq Zed Development Board";
> -	compatible = "xlnx,zynq-zed", "xlnx,zynq-7000";
> +	compatible = "avnet,zynq-zed", "xlnx,zynq-7000";
>  
>  	aliases {
>  		ethernet0 = &gem0;
> 

Unfortunately we don't know who is parsing this string. It means please
keep that origin compatible string there.

I have no problem with this.
compatible = "avnet,zynq-zed", "xlnx,zynq-zed", "xlnx,zynq-7000";

Thanks,
Michal
