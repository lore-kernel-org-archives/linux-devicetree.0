From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: add document of mediatek efuse driver
Date: Fri, 20 Nov 2015 09:40:29 -0600
Message-ID: <20151120154029.GA10692@rob-hp-laptop>
References: <1447930014-19579-1-git-send-email-andrew-ct.chen@mediatek.com>
 <1447930014-19579-2-git-send-email-andrew-ct.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447930014-19579-2-git-send-email-andrew-ct.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Thu, Nov 19, 2015 at 06:46:52PM +0800, Andrew-CT Chen wrote:
> Add Mediatek MT8173 EFUSE Devicetree binding file
> 
> Signed-off-by: Andrew-CT Chen <andrew-ct.chen@mediatek.com>

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  .../devicetree/bindings/nvmem/mtk-efuse.txt        | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> new file mode 100644
> index 0000000..74cf529
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> @@ -0,0 +1,36 @@
> += Mediatek MTK-EFUSE device tree bindings =
> +
> +This binding is intended to represent MTK-EFUSE which is found in most Mediatek SOCs.
> +
> +Required properties:
> +- compatible: should be "mediatek,mt8173-efuse" or "mediatek,efuse"
> +- reg: Should contain registers location and length
> +
> += Data cells =
> +Are child nodes of MTK-EFUSE, bindings of which as described in
> +bindings/nvmem/nvmem.txt
> +
> +Example:
> +
> +	efuse: efuse@10206000 {
> +		compatible = "mediatek,mt8173-efuse";
> +		reg	   = <0 0x10206000 0 0x1000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		/* Data cells */
> +		thermal_calibration: calib@528 {
> +			reg = <0x528 0xc>;
> +		};
> +	};
> +
> += Data consumers =
> +Are device nodes which consume nvmem data cells.
> +
> +For example:
> +
> +	thermal {
> +		...
> +		nvmem-cells = <&thermal_calibration>;
> +		nvmem-cell-names = "calibration";
> +	};
> -- 
> 1.9.1
> 
