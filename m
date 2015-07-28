From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RFCv2 1/3] docs: dts: Added documentation for Xilinx Zynq
 Reset Controller bindings.
Date: Tue, 28 Jul 2015 10:05:02 +0200
Message-ID: <1438070702.3193.4.camel@pengutronix.de>
References: <1437783682-13632-1-git-send-email-moritz.fischer@ettus.com>
 <1437783682-13632-2-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1437783682-13632-2-git-send-email-moritz.fischer@ettus.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, michal.simek@xilinx.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, galak@codeaurora.org, soren.brinkmann@xilinx.com
List-Id: devicetree@vger.kernel.org

Am Freitag, den 24.07.2015, 17:21 -0700 schrieb Moritz Fischer:
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>  Documentation/devicetree/bindings/reset/zynq-reset-pl.txt | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/zynq-reset-pl.txt
> 
> diff --git a/Documentation/devicetree/bindings/reset/zynq-reset-pl.txt b/Documentation/devicetree/bindings/reset/zynq-reset-pl.txt
> new file mode 100644
> index 0000000..ac4499e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/zynq-reset-pl.txt
> @@ -0,0 +1,13 @@
> +Xilinx Zynq PL Reset Manager
> +
> +Required properties:
> +- compatible: "xlnx,zynq-reset-pl"
> +- syscon <&slcr>;
> +- #reset-cells: 1
> +
> +Example:
> +	rstc: rstc@240 {
> +		#reset-cells = <1>;
> +		compatible = "xlnx,zynq-reset-pl";
> +		syscon = <&slcr>;

Why the syscon phandle if rstc always is the child of slcr? Why not just
request the syscon for the rstc's parent node.

> +	};

regards
Philipp
