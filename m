From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [RFC PATCH V3 3/4] dt-bindings: mt8183: Add sensor interface
 dt-bindings
Date: Mon, 26 Aug 2019 14:52:19 +0300
Message-ID: <20190826115219.GB826@valkosipuli.retiisi.org.uk>
References: <1559815233-24796-1-git-send-email-louis.kuo@mediatek.com>
 <1559815233-24796-4-git-send-email-louis.kuo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1559815233-24796-4-git-send-email-louis.kuo@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Louis Kuo <louis.kuo@mediatek.com>
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, laurent.pinchart+renesas@ideasonboard.com, Rynn.Wu@mediatek.com, christie.yu@mediatek.com, srv_heupstream@mediatek.com, holmes.chiou@mediatek.com, Jerry-ch.Chen@mediatek.com, tfiga@chromium.org, keiichiw@chromium.org, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, hans.verkuil@cisco.com, zwisler@chromium.org, frederic.chen@mediatek.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Louis,

On Thu, Jun 06, 2019 at 06:00:32PM +0800, Louis Kuo wrote:
> This patch adds the DT binding documentation for the sensor interface
> module in Mediatek SoCs.
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> ---
>  .../devicetree/bindings/media/mediatek-seninf.txt  | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-seninf.txt b/Documentation/devicetree/bindings/media/mediatek-seninf.txt
> new file mode 100644
> index 0000000..979063a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-seninf.txt
> @@ -0,0 +1,31 @@
> +* Mediatek seninf MIPI-CSI2 host driver

Note that DT bindings document the hardware, not the driver implementation.

> +
> +Seninf MIPI-CSI2 host driver is a HW camera interface controller. It support a widely adopted,

Same here; driver apparently refers to software.

Please wrap before or at 80 characters per line.

> +simple, high-speed protocol primarily intended for point-to-point image and video
> +transmission between cameras and host devices.

Could you elaborate the properties of the hardware in a bit more detail,
such as how many ports there are and how many lanes they can support? See
e.g. Documentation/devicetree/bindings/media/ti,omap3isp.txt .

Please also refer to video-interfaces.txt and document the port nodes and
the relevant properties in the endpoint nodes, as in the binding example I
referred to.

> +
> +Required properties:
> +  - compatible: "mediatek,mt8183-seninf"
> +  - reg: Must contain an entry for each entry in reg-names.
> +  - reg-names: Must include the following entries:
> +    "base_reg": seninf registers base
> +    "rx_reg": Rx analog registers base
> +  - interrupts: interrupt number to the cpu.
> +  - clocks : clock name from clock manager
> +  - clock-names: must be CLK_CAM_SENINF and CLK_TOP_MUX_SENINF.
> +    It is the clocks of seninf
> +
> +Example:
> +	seninf: seninf@1a040000 {
> +		compatible = "mediatek,mt8183-seninf";
> +		reg = <0 0x1a040000 0 0x8000>,
> +		      <0 0x11C80000 0 0x6000>;
> +		reg-names = "base_reg", "rx_reg";
> +		interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_LOW>;
> +		power-domains = <&scpsys MT8183_POWER_DOMAIN_CAM>;
> +		clocks =
> +				<&camsys CLK_CAM_SENINF>, <&topckgen CLK_TOP_MUX_SENINF>;

Please wrap before 80 and align the above two lines.

> +		clock-names =
> +			"CLK_CAM_SENINF", "CLK_TOP_MUX_SENINF";

No need to wrap here.

> +	}
> +
> -- 
> 1.9.1

This must be old.

-- 
Regards,

Sakari Ailus
