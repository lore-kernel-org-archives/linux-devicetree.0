From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 3/4] dt-bindings: phy: Add support for QMP phy
Date: Wed, 15 Mar 2017 15:34:56 -0500
Message-ID: <20170315203456.pxroh7nir2iwll3o@rob-hp-laptop>
References: <1489050441-3240-1-git-send-email-vivek.gautam@codeaurora.org>
 <1489050441-3240-4-git-send-email-vivek.gautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1489050441-3240-4-git-send-email-vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: kishon-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 09, 2017 at 02:37:20PM +0530, Vivek Gautam wrote:
> Qualcomm chipsets have QMP phy controller that provides
> support to a number of controller, viz. PCIe, UFS, and USB.
> Adding dt binding information for the same.
> 
> Signed-off-by: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> 
> Hi Rob,
> I have removed your Acked-by tag because of the change in bindings.
> Please consider adding your Ack again if you are fine with these
> updated bindings.
> 
> Changes since v4:
>  - Added bindings for child nodes. Each phy lane is represented by child
>    node with its own register space (for tx, rx and pcs blocks), and clocks
>    and resets for power control facility.
>  - Removed register space and lane offsets for tx, rx and pcs blocks from
>    qmp phy node.
>  - #phy-cells is now part of each child node and thus must be 0.
>  - Added information on list of mandatory clocks and resets for each phy.
> 
> Changes since v3:
>  - Added #clock-cells = <1>, indicating that phy is a clock provider.
> 
> Changes since v2:
>  - Removed binding for "ref_clk_src" since we don't request this
>    clock in the driver.

Humm, sounds suspicious. You should describe clocks connected to the h/w 
block, not what the driver uses (currently).

>  - Addressed s/ref_clk/ref. Don't need to add '_clk' suffix to clock names.
>  - Using 'phy' for the node name.
> 
> Changes since v1:
>  - New patch, forked out of the original driver patch:
>    "phy: qcom-qmp: new qmp phy driver for qcom-chipsets"
>  - Added 'Acked-by' from Rob.
>  - Updated bindings to include mem resource as a list of
>    offset - length pair for serdes block and for each lane.
>  - Added a new binding for 'lane-offsets' that contains offsets
>    to tx, rx and pcs blocks from each lane base address.
> 
>  .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 106 +++++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
