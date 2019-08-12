From: Rob Herring <robh@kernel.org>
Subject: Re: [v6,2/2] dt-bindings: rtc: add bindings for FlexTimer Module
Date: Mon, 12 Aug 2019 17:16:07 -0600
Message-ID: <20190812231607.GA21242@bogus>
References: <20190719035400.9800-1-biwen.li@nxp.com>
 <20190719035400.9800-2-biwen.li@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190719035400.9800-2-biwen.li@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Biwen Li <biwen.li@nxp.com>
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com, leoyang.li@nxp.com, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, xiaobo.xie@nxp.com, jiafei.pan@nxp.com, ran.wang_1@nxp.com, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 19, 2019 at 11:54:00AM +0800, Biwen Li wrote:
> The patch adds bindings for FlexTimer Module
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v6:
>     - correct subject
>     - delete note
>     - remove reg property about IP Powerdown exception register
> 
> Change in v5:
>     - None
> 
> Change in v4:
>     - add note about dts and kernel options
>     - add aliases in example
> 
> Change in v3:
> 	- remove reg-names property
> 	- correct cells number
> 
> Change in v2:
> 	- replace ls1043a with ls1088a as example
> 	- add rcpm node and fsl,rcpm-wakeup property
> 
>  .../bindings/rtc/rtc-fsl-ftm-alarm.txt        | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> new file mode 100644
> index 000000000000..9291b022ffc7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> @@ -0,0 +1,41 @@
> +Freescale FlexTimer Module (FTM) Alarm
> +
> +Required properties:
> +- compatible : Should be "fsl,<chip>-ftm-alarm", the
> +	       supported chips include
> +	       "fsl,ls1012a-ftm-alarm"
> +	       "fsl,ls1021a-ftm-alarm"
> +	       "fsl,ls1028a-ftm-alarm"
> +	       "fsl,ls1043a-ftm-alarm"
> +	       "fsl,ls1046a-ftm-alarm"
> +	       "fsl,ls1088a-ftm-alarm"
> +	       "fsl,ls208xa-ftm-alarm"
> +- reg : Specifies base physical address and size of the register sets for the
> +  FlexTimer Module.
> +- interrupts : Should be the FlexTimer Module interrupt.
> +- fsl,rcpm-wakeup property and rcpm node : Please refer
> +	Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> +
> +Optional properties:
> +- big-endian: If the host controller is big-endian mode, specify this property.
> +  The default endian mode is little-endian.
> +
> +Example:
> +aliases {
> +	...
> +	rtc1 = ftm_alarm0; // Use FlexTimer Module as /dev/rtc1
> +	...
> +};

As I said before, drop this. It's not going to work when this is 
converted to schema and the example is compiled. Feel free to convert 
this to schema and see...
 
> +
> +rcpm: rcpm@1e34040 {
> +	compatible = "fsl,ls1088a-rcpm", "fsl,qoriq-rcpm-2.1+";
> +	reg = <0x0 0x1e34040 0x0 0x18>;
> +	#fsl,rcpm-wakeup-cells = <6>;
> +};
> +
> +ftm_alarm0: timer@2800000 {

If this is an RTC, then rtc@...

> +	compatible = "fsl,ls1088a-ftm-alarm";
> +	reg = <0x0 0x2800000 0x0 0x10000>;
> +	fsl,rcpm-wakeup = <&rcpm 0x0 0x0 0x0 0x0 0x4000 0x0>;
> +	interrupts = <0 44 4>;
> +};
> -- 
> 2.17.1
> 
