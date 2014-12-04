From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v17 06/12] dt-bindings: add document for dw_hdmi
Date: Thu, 04 Dec 2014 12:30:37 +0100
Message-ID: <1417692637.3744.5.camel@pengutronix.de>
References: <1417686826-12687-1-git-send-email-andy.yan@rock-chips.com>
 <1417687565-13206-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1417687565-13206-1-git-send-email-andy.yan@rock-chips.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, heiko@sntech.de, airlied@linux.ie, dri-devel@lists.freedesktop.org, ykk@rock-chips.com, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, linux-rockchip@lists.infradead.org, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, jay.xu@rock-chips.com, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, rmk+kernel@arm.linux.org.uk, mark.yao@rock-chips.com, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, djkurtz@google.com, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>, vladimir_zapolskiy@mentor.com
List-Id: devicetree@vger.kernel.org

Hi Andy,

Am Donnerstag, den 04.12.2014, 18:06 +0800 schrieb Andy Yan:
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v17: None
> Changes in v16:
> - describe ddc-i2c-bus as optional
> - add common clocks bindings
> 
> Changes in v15: None
> Changes in v14: None
> Changes in v13: None
> Changes in v12: None
> Changes in v11: None
> Changes in v10: None
> Changes in v9: None
> Changes in v8:
> - correct some spelling mistake
> - modify ddc-i2c-bus and interrupt description
> 
> Changes in v7: None
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> 
>  .../devicetree/bindings/drm/bridge/dw_hdmi.txt     | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/drm/bridge/dw_hdmi.txt
> 
> diff --git a/Documentation/devicetree/bindings/drm/bridge/dw_hdmi.txt b/Documentation/devicetree/bindings/drm/bridge/dw_hdmi.txt
> new file mode 100644
> index 0000000..fb14730
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/bridge/dw_hdmi.txt
> @@ -0,0 +1,45 @@
> +DesignWare HDMI bridge bindings
> +
> +Required properities:
> +- compatible: platform specific such as:
> +   * "snps,dw-hdmi-tx"
> +   * "fsl,imx6q-hdmi"
> +   * "fsl,imx6dl-hdmi"
> +   * "rockchip,rk3288-dw-hdmi"
> +- reg: Physical base address and length of the controller's registers.
> +- interrupts: The HDMI interrupt number
> +- clocks, clock-names : must have the phandles to the HDMI iahb and isrf clocks,
> +  as described in Documentation/devicetree/bindings/clock/clock-bindings.txt,
> +  the clock-names should be "iahb", "isfr"

This is missing the port bindings, I think it should mention the port
property here and refer to the soc specific binding document.

 - port@...: SoC specific port nodes with endpoint definitions as defined
   in Documentation/devicetree/bindings/media/video-interfaces.txt,
   please refer to the SoC specific binding document:
    * Documentation/devicetree/bindings/drm/imx/hdmi.txt
    * Documentation/devicetree/bindings/video/dw_hdmi-rockchip.txt

This also makes be wonder, shouldn't dw_hdmi-rockchip be under drm/?

> +Optional properties
> +- reg-io-width: the width of the reg:1,4, default set to 1 if not present
> +- ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
> +- clkocks, clock-names: phandle to the HDMI cec clock, name should be "cec"

s/clkocks/clocks/, and I'd uppercase the HDMI CEC clock for consistency.

> +
> +Example:
> +	hdmi: hdmi@0120000 {
> +		compatible = "fsl,imx6q-hdmi";

Could you change this example to:
		compatible = "fsl,imx6q-hdmi", "snps,dw-hdmi-tx"

> +		reg = <0x00120000 0x9000>;
> +		interrupts = <0 115 0x04>;
> +		gpr = <&gpr>;
> +		clocks = <&clks 123>, <&clks 124>;
> +		clock-names = "iahb", "isfr";
> +		ddc-i2c-bus = <&i2c2>;
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			hdmi_mux_0: endpoint {
> +				remote-endpoint = <&ipu1_di0_hdmi>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			hdmi_mux_1: endpoint {
> +				remote-endpoint = <&ipu1_di1_hdmi>;
> +			};
> +		};
> +	};
