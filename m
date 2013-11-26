From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v3 2/9] staging: dwc2: update DT binding to add generic
 clock/phy properties
Date: Tue, 26 Nov 2013 15:49:30 +0530
Message-ID: <529475B2.9070202@ti.com>
References: <1385403367-18144-1-git-send-email-matt.porter@linaro.org>
 <1385403367-18144-3-git-send-email-matt.porter@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1385403367-18144-3-git-send-email-matt.porter@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matt Porter <matt.porter@linaro.org>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Christian Daudt <bcm@fixthebug.org>, Paul Zimmerman <paulz@synopsys.com>
Cc: Devicetree List <devicetree@vger.kernel.org>, Kamil Debski <k.debski@samsung.com>, Linaro Patches <patches@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Linux USB List <linux-usb@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Monday 25 November 2013 11:46 PM, Matt Porter wrote:
> dwc2/s3c-hsotg require a single clock to be specified and optionally
> a generic phy. On the s3c-hsotg driver old style USB phy support is
> present as a fallback so the generic phy properties are optional.
> 
> Signed-off-by: Matt Porter <matt.porter@linaro.org>
> ---
>  Documentation/devicetree/bindings/staging/dwc2.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/staging/dwc2.txt b/Documentation/devicetree/bindings/staging/dwc2.txt
> index 1a1b7cf..b8b42b6 100644
> --- a/Documentation/devicetree/bindings/staging/dwc2.txt
> +++ b/Documentation/devicetree/bindings/staging/dwc2.txt
> @@ -5,6 +5,12 @@ Required properties:
>  - compatible : "snps,dwc2"
>  - reg : Should contain 1 register range (address and length)
>  - interrupts : Should contain 1 interrupt
> +- clocks: clock provider specifier
> +- clock-names: shall be "otg"
> +- phys: phy provider specifier
> +- phy-names: shall be "device"

lets mention in the Documentation too that the phy properties are optional.
apart from that..
Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
> +Refer to clk/clock-bindings.txt for generic clock consumer properties
> +Refer to phy/phy-bindings.txt for generic phy consumer properties
>  
>  Example:
>  
> @@ -12,4 +18,8 @@ Example:
>                  compatible = "ralink,rt3050-usb, snps,dwc2";
>                  reg = <0x101c0000 40000>;
>                  interrupts = <18>;
> +		clocks = <&usb_otg_ahb_clk>;
> +		clock-names = "otg";
> +		phys = <&usbphy>;
> +		phy-names = "device";
>          };
> 
