From: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Subject: RE: [PATCH v3 1/2] dma: Add Xilinx Central DMA DT Binding
 Documentation
Date: Mon, 23 Mar 2015 16:27:57 +0000
Message-ID: <BN1AFFO11FD0430248BCDEC97A478A6292A10D0@BN1AFFO11FD043.protection.gbl>
References: <1425319048-28917-1-git-send-email-appanad@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1425319048-28917-1-git-send-email-appanad@xilinx.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Appana Durga Kedareswara Rao <appanad@xilinx.com>, "dan.j.williams@intel.com" <dan.j.williams@intel.com>, "vinod.koul@intel.com" <vinod.koul@intel.com>, Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.co" <mark.rutland@arm.co>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Srikanth Vemula <svemula@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Srikanth Thokala <sthokal@xilinx.com>, Anirudha Sarangi <anirudh@xilinx.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Ping !

> -----Original Message-----
> From: Kedareswara rao Appana [mailto:appana.durga.rao@xilinx.com]
> Sent: Monday, March 02, 2015 11:27 PM
> To: dan.j.williams@intel.com; vinod.koul@intel.com; Michal Simek; Soren
> Brinkmann; robh+dt@kernel.org; pawel.moll@arm.com;
> mark.rutland@arm.co; ijc+devicetree@hellion.org.uk; galak@codeaurora.org
> Cc: dmaengine@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; Appana Durga Kedareswara Rao; Anirudha Sarangi;
> Srikanth Vemula; devicetree@vger.kernel.org; Srikanth Thokala
> Subject: [PATCH v3 1/2] dma: Add Xilinx Central DMA DT Binding
> Documentation
>
> Device-tree binding documentation of Xilinx Central DMA Engine.
>
> Signed-off-by: Srikanth Thokala <sthokal@xilinx.com>
> Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
> ---
> Changes in v3:
> - Used proper alignment for all the properties.
> Changes in v2:
> - Change property 'xlnx,data-width' to 'xlnx,datawidth' in the description
>   to match the implementation.
>
>  .../devicetree/bindings/dma/xilinx/xilinx_cdma.txt | 54
> ++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/dma/xilinx/xilinx_cdma.txt
>
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xilinx_cdma.txt
> b/Documentation/devicetree/bindings/dma/xilinx/xilinx_cdma.txt
> new file mode 100644
> index 0000000..aba3b10
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/xilinx/xilinx_cdma.txt
> @@ -0,0 +1,54 @@
> +Xilinx AXI CDMA engine, it does transfers between memory-mapped
> source
> +address and a memory-mapped destination address.
> +
> +Required properties:
> +- compatible         : Should be "xlnx,axi-cdma-1.00.a"
> +- #dma-cells         : Should be <1>, see "dmas" property below
> +- reg                        : Should contain cdma registers location and length.
> +- dma-channel child node: Should have only one channel
> +
> +Optional properties:
> +- xlnx,include-sg    : Tells whether configured for Scatter-mode in
> +                       the hardware.
> +
> +Required child node properties:
> +- compatible         : It should be "xlnx,axi-cdma-channel".
> +- interrupts         : Should contain per channel CDMA interrupts.
> +- xlnx,datawidth     : Should contain the stream data width, take values
> +                       {32,64...1024}.
> +
> +Option child node properties:
> +- xlnx,include-dre   : Tells whether hardware is configured for Data
> +                       Realignment Engine.
> +
> +Example:
> +++++++++
> +
> +axi_cdma_0: axicdma@7e200000 {
> +       compatible = "xlnx,axi-cdma-1.00.a";
> +       #dma_cells = <1>;
> +       reg = < 0x7e200000 0x10000 >;
> +       dma-channel@7e200000 {
> +               compatible = "xlnx,axi-cdma-channel";
> +               interrupts = < 0 55 4 >;
> +               xlnx,datawidth = <0x40>;
> +       } ;
> +} ;
> +
> +
> +* DMA client
> +
> +Required properties:
> +- dmas               : a list of <[Central DMA device phandle] [Channel
> ID]> pairs,
> +               where Channel ID is '0' for write/tx and '1' for read/rx
> +                  channel.
> +- dma-names  : a list of DMA channel names, one per "dmas" entry
> +
> +Example:
> +++++++++
> +
> +cdmatest_0: cdmatest@0 {
> +       compatible ="xlnx,axi-cdma-test-1.00.a";
> +       dmas = <&axi_cdma_0 0>;
> +       dma-names = "cdma0";
> +} ;
> --
> 2.1.2



This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
