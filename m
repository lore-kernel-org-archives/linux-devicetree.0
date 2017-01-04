From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH resend v4 2/3] ARM: dts: imx6: Support Savageboard dual
Date: Wed, 4 Jan 2017 08:38:52 -0600
Message-ID: <20170104143852.dkc2pfcighl7p3la@rob-hp-laptop>
References: <20170104070436.3425-1-woogyom.kim@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170104070436.3425-1-woogyom.kim@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Milo Kim <woogyom.kim@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 04, 2017 at 04:04:36PM +0900, Milo Kim wrote:
> Common savageboard DT file is used for board support.
> Add the vendor name and specify the dtb file for i.MX6Q build.
> 
> Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
> Signed-off-by: Milo Kim <woogyom.kim@gmail.com>
> ---
>  .../devicetree/bindings/vendor-prefixes.txt        |  1 +
>  arch/arm/boot/dts/Makefile                         |  1 +
>  arch/arm/boot/dts/imx6dl-savageboard.dts           | 51 ++++++++++++++++++++++
>  3 files changed, 53 insertions(+)
>  create mode 100644 arch/arm/boot/dts/imx6dl-savageboard.dts

Acked-by: Rob Herring <robh@kernel.org>
