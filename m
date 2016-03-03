From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 07/17] dt-bindings: Add PLX Technology Reset Controller
 bindings
Date: Thu, 03 Mar 2016 15:21:47 +0100
Message-ID: <1457014907.3425.56.camel@pengutronix.de>
References: <1457005210-18485-1-git-send-email-narmstrong@baylibre.com>
	 <1457005210-18485-8-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457005210-18485-8-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 03.03.2016, 12:40 +0100 schrieb Neil Armstrong:
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/reset/plxtech,reset.txt    | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/plxtech,reset.txt
> 
> diff --git a/Documentation/devicetree/bindings/reset/plxtech,reset.txt b/Documentation/devicetree/bindings/reset/plxtech,reset.txt
> new file mode 100644
> index 0000000..e99648d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/plxtech,reset.txt
> @@ -0,0 +1,25 @@
> +PLX Technology OXNAS SoC Family RESET Controller
> +================================================
> +
> +Please also refer to reset.txt in this directory for common reset
> +controller binding usage.
> +
> +Required properties:
> +- compatible: Should be "plxtech,nas782x-reset"
> +- #reset-cells: 1, see below
> +
> +Parent node should have the following properties :
> +- compatible: Should be "plxtech,ox810se-sys-ctrl", "syscon", "simple-mfd"
> +
> +example:
> +
> +sys: sys-ctrl@000000 {
> +	compatible = "plxtech,ox810se-sys-ctrl", "syscon", "simple-mfd";
> +	reg = <0x000000 0x100000>;
> +
> +	reset: reset-controller {
> +		compatible = "plxtech,nas782x-reset";
> +		#reset-cells = <1>;
> +
> +	};
> +};

Is there a list of the reset bits in this register?

regards
Philipp
