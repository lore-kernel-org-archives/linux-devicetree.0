From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: Re: [PATCH 1/2] dts: socfpga: Add bindings for Altera SoC SDRAM
 controller
Date: Tue, 1 Apr 2014 07:28:07 +0200
Message-ID: <20140401052807.GN5052@pengutronix.de>
References: <1396303627-29198-1-git-send-email-tthayer@altera.com>
 <1396303627-29198-2-git-send-email-tthayer@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1396303627-29198-2-git-send-email-tthayer@altera.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: tthayer@altera.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, linux-doc@vger.kernel.org, devicetree@hellion.org.uk, linux-kernel@vger.kernel.org, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org, rob@landley.net, galak@codeaurora.org, dinguyen@altera.com
List-Id: devicetree@vger.kernel.org

Hi!

On Mon, Mar 31, 2014 at 05:07:06PM -0500, tthayer@altera.com wrote:
> From: Thor Thayer <tthayer@altera.com>
> 
> Addition of the Altera SDRAM controller bindings and device
> tree changes to the Altera SoC project.
> 
> Signed-off-by: Thor Thayer <tthayer@altera.com>
> To: Rob Herring <rob.herring@calxeda.com>
> To: Pawel Moll <pawel.moll@arm.com>
> To: Mark Rutland <mark.rutland@arm.com>
> To: Ian Campbell <ijc+devicetree@hellion.org.uk>
> To: Kumar Gala <galak@codeaurora.org>
> To: Rob Landley <rob@landley.net>
> To: Russell King <linux@arm.linux.org.uk>
> To: Dinh Nguyen <dinguyen@altera.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  .../bindings/arm/altera/socfpga-sdram.txt          |   14 ++++++++++++++
>  arch/arm/boot/dts/socfpga.dtsi                     |    5 +++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-sdram.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-sdram.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram.txt
> new file mode 100644
> index 0000000..351ab7b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram.txt
> @@ -0,0 +1,14 @@
> +Altera SOCFPGA SDRAM Controller
> +
> +Required properties:
> +- compatible : "altr,sdr-ctl", "syscon";
> +                Note that syscon is invoked for this device to support the FPGA
> +		bridge driver and possibly other devices in the future.  See
> +		also Documentation/devicetree/bindings/mfd/syscon.txt

This note is really linux specific (and specific to some vendor kernel driver
for that matter). I think you should remove that.

> +- reg : Should contain 1 register ranges(address and length)
> +
> +Example:
> +	sdrctl@0xffc25000 {
> +		compatible = "altr,sdr-ctl", "syscon";
> +		reg = <0xffc25000 0x1000>;
> +	};
> diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
> index 9e78c1d..3634de7 100644
> --- a/arch/arm/boot/dts/socfpga.dtsi
> +++ b/arch/arm/boot/dts/socfpga.dtsi
> @@ -528,6 +528,11 @@
>  			reg-io-width = <4>;
>  		};
>  
> +		sdrctl@0xffc25000 {
> +			compatible = "altr,sdr-ctl", "syscon";
> +			reg = <0xffc25000 0x1000>;
> +		};
> +
>  		rstmgr@ffd05000 {
>  			compatible = "altr,rst-mgr";
>  			reg = <0xffd05000 0x1000>;

Regards,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
