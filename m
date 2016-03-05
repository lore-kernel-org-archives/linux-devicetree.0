From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/7] QE: Add uqe_serial document to bindings
Date: Fri, 4 Mar 2016 22:25:36 -0600
Message-ID: <20160305042536.GD13525@rob-hp-laptop>
References: <1456816183-22340-1-git-send-email-qiang.zhao@nxp.com>
 <1456816183-22340-3-git-send-email-qiang.zhao@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456816183-22340-3-git-send-email-qiang.zhao@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhao Qiang <qiang.zhao@nxp.com>
Cc: oss@buserror.net, leoyang.li@nxp.com, xiaobo.xie@nxp.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 01, 2016 at 03:09:39PM +0800, Zhao Qiang wrote:
> Add uqe_serial document to
> Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> 
> Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
> ---
> Changes for v2
> 	- modify tx/rx-clock-name specification
> Changes for v2
> 	- NA 
> 
>  .../bindings/powerpc/fsl/cpm_qe/uqe_serial.txt        | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> 
> diff --git a/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> new file mode 100644
> index 0000000..436c71c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/uqe_serial.txt
> @@ -0,0 +1,19 @@
> +* Serial
> +
> +Currently defined compatibles:
> +- ucc_uart

I guess this is in use already and okay. However, looking at the driver 
there really should be SoC specific compatible strings here since the 
driver is looking up the SoC compatible string and composing the 
firmware filename from that.

> +
> +Properties for ucc_uart:
> +port-number : port number of UCC-UART
> +tx/rx-clock-name : should be "brg1"-"brg16" for internal clock source,
> +		   should be "clk1"-"clk28" for external clock source.
> +
> +Example:
> +
> +	ucc_serial: ucc@2200 {
> +		device_type = "serial";

Drop device_type. It should only be used in a few legacy cases.

Looks like the driver is matching on this. Please drop it from the 
driver too. I'd leave dts files for now, but they should be updated too 
later.

> +		compatible = "ucc_uart";
> +		port-number = <1>;
> +		rx-clock-name = "brg2";
> +		tx-clock-name = "brg2";
> +	};
> -- 
> 2.1.0.27.g96db324
> 
