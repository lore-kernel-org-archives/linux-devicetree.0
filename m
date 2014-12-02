From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v15 06/12] dt-bindings: add document for dw_hdmi
Date: Tue, 02 Dec 2014 19:23:49 +0100
Message-ID: <1417544629.3411.15.camel@pengutronix.de>
References: <1417505778-18341-1-git-send-email-andy.yan@rock-chips.com>
 <1417506124-18626-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1417506124-18626-1-git-send-email-andy.yan@rock-chips.com>
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

Am Dienstag, den 02.12.2014, 15:42 +0800 schrieb Andy Yan:
> diff --git a/Documentation/devicetree/bindings/drm/bridge/dw_hdmi.txt b/Documentation/devicetree/bindings/drm/bridge/dw_hdmi.txt
> new file mode 100644
> index 0000000..107c1ca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/bridge/dw_hdmi.txt
> @@ -0,0 +1,40 @@
> +DesignWare HDMI bridge bindings
> +
> +Required properities:
> +- compatible: platform specific such as:
> +   * "fsl,imx6q-hdmi"
> +   * "fsl,imx6dl-hdmi"
> +   * "rockchip,rk3288-dw-hdmi"

I think we should add a common compatible value "snps,dw-hdmi-tx" here:

	compatible = "fsl,imx6q-hdmi", "snps,dw-hdmi-tx";

> +- reg: Physical base address and length of the controller's registers.
> +- ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing

Better make ddc-i2c-bus optional, see the other thread about the ddc i2c
master.

> +- interrupts: The HDMI interrupt number
> +
> +Optional properties
> +- reg-io-width: the width of the reg:1,4, default set to 1 if not present
> +
> +Example:
> +	hdmi: hdmi@0120000 {
> +		compatible = "fsl,imx6q-hdmi";
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

regards
Philipp
